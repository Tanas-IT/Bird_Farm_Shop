/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package birdfarm.controller.cart;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import birdfarm.Mail.Email;
import birdfarm.dao.BirdDAO;
import birdfarm.dao.RequiredOrderDAO;
import birdfarm.dto.BirdDTO;
import birdfarm.dto.OrderDetailDTO;
import birdfarm.dto.RequiredOrderDTO;
import birdfarm.dto.UserDTO;
import birdfarm.shopping.RequiredCart;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author 1005h
 */
public class RequiredPaymentResultController extends HttpServlet {

    private static final String ERROR = "viewRequiredCart.jsp";
    private static final String VNP = "PairingPaymentResultVNP.jsp";
    private static final String COD = "PairingPaymentResultCOD.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
      
        try {
            //Cap nhat quantity san pham va tinh trang thanh toan o day
            HttpSession session = request.getSession();
            RequiredCart cart = (RequiredCart) session.getAttribute("RCART");
            RequiredOrderDAO odao = new RequiredOrderDAO();
            BirdDAO bdao = new BirdDAO();
            String email = (String) session.getAttribute("EMAIL");
            List<RequiredOrderDTO> orderDetailList = new ArrayList<>();
            RequiredOrderDTO order = (RequiredOrderDTO) session.getAttribute("ORDER");
            for(String key : cart.getRcart().keySet()) {
                if(cart.getRcart().get(key).getGender().equals("Trống")) {
                     orderDetailList.add(odao.getRequiredOrderDetailMale(order));
                }
                if(cart.getRcart().get(key).getGender().equals("Mái")) {
                    orderDetailList.add(odao.getRequiredOrderDetailFemale(order));
                }
            }
            
            session.setAttribute("ORDERDETAIL", orderDetailList);
            
            if (order.getPaymentID() == 2) {
                String vnp_ResponseCode = request.getParameter("vnp_ResponseCode");
                if (vnp_ResponseCode.equals("00")) {
                    boolean checkQuantity = false;
                    if (cart != null) {
                        for (BirdDTO product : cart.getRcart().values()) {
                            product.setQuantity(product.getQuantityOfUser());
                            product.setQuantityOfUser(0);
                            checkQuantity = bdao.updateQuantity(product);
                        }
                        order.setIsPay(true);
                        odao.updateIsPay(order);
                        
                        sendMail_Method(order, email, orderDetailList);
                        url = VNP;
                        RequiredCart temp = cart;
                         for (BirdDTO product : temp.getRcart().values()) {
                           if(product.getQuantity() == 0) {
                               cart.getRcart().remove(product.getIdBird());
                           }
                        }
                        session.setAttribute("RCART",cart);
                        session.setAttribute("ORDER",order);
                        session.removeAttribute("RquantityOfCart");
                    }
                } else {
                    url = ERROR;
                    session.setAttribute("PAYMENTREQUIRED", "Thanh toán không thành công");
                    UserDTO user = (UserDTO) session.getAttribute("user");
                    session.setAttribute("user", user);
                        session.setAttribute("ORDER",order);
                        session.removeAttribute("RquantityOfCart");
                }
            } else if (order.getPaymentID() == 1) {
                //COD cung cap nhat quantity va tinh trang thanh toan, va gui mail
                boolean checkQuantity = false;
                if (cart != null) {
                    for (BirdDTO product : cart.getRcart().values()) {
                        checkQuantity = bdao.updateQuantity(product);
                    }
                    order.setIsPay(true);
                    odao.updateIsPay(order);
                    sendMail_Method(order, email, orderDetailList);
                    url = COD;
                    session.setAttribute("PAYMENT", "COD");
                    session.setAttribute("ORDER",order);
                    session.removeAttribute("quantityOfCart");
                } else {
                    url = COD;
                    session.setAttribute("PAYMENT", "COD");
                   session.removeAttribute("RquantityOfCart");
                }
            } else {
                request.setAttribute("MESSAGE", "Something went wrong! Any changed has been rolled back!");
                url = ERROR;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            response.sendRedirect(url);
        }
    }

    private void sendMail_Method(RequiredOrderDTO order, String email, List<RequiredOrderDTO> orderDetail) {
        String orderType = "Thanh toán trực tiếp khi nhận hàng";
        String acceptOrder = "        <p>Đơn hàng " + order.getOrderCode() + " của bạn đã được duyệt vào ngày " + order.getCreatedDate() + ". Bạn vui lòng thanh toán khi nhận hàng</p>\n";
        StringBuilder orderInfo = new StringBuilder();
        DecimalFormat decimalFormat = new DecimalFormat("###,###");
        String formattedNumber = decimalFormat.format(order.getTotal());
       
        if (order.getPaymentID() == 2) {
            orderType = "Thanh toán Online Banking qua VNPAY";
            acceptOrder = "        <p>Đơn hàng " + order.getOrderCode() + " của bạn đã được thanh toán vào ngày " + order.getCreatedDate() + "</p>\n";
        }
        String bill = "<!DOCTYPE html>\n"
                + "<html lang=\"en\">\n"
                + "<head>\n"
                + "    <meta charset=\"UTF-8\">\n"
                + "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
                + "    <title>Order Invoice</title>\n"
                + "    <style>\n"
                + "        .line {\n"
                + "            border-top: 2px solid black;\n"
                + "            margin: 20px 0;\n"
                + "        }\n"
                + "        body {\n"
                + "            font-family: Arial, sans-serif;\n"
                + "            margin: 0;\n"
                + "            padding: 20px;\n"
                + "            background-color: #f2f2f2;\n"
                + "        }\n"
                + "        .header {\n"
                + "            text-align: center;\n"
                + "            margin-bottom: 20px;\n"
                + "            background-color: white;\n"
                + "            padding: 10px;\n"
                + "        }\n"
                + "        .title {\n"
                + "            margin-bottom: 20px;"
                + "        }\n"
                + "        .UserInfo, .paymentMethod, .OrderInfo {\n"
                + "            margin-bottom: 20px;\n"
                + "        }\n"
                + "        .UserInfo h4, .paymentMethod h4, .OrderInfo h4 {\n"
                + "            margin-bottom: 10px;\n"
                + "        }\n"
                + "        .Total {\n"
                + "            text-align: left;\n"
                + "            font-weight: bold;\n"
                + "            font-size: 18px;\n"
                + "        }\n"
                + "        img {\n"
                + "            max-width: 200px;\n"
                + "            height: auto;\n"
                + "        }\n"
                + "    </style>\n"
                + "</head>\n"
                + "<body>\n"
                + "    <div class=\"header\">\n"
                + "        <img src=\"https://res.cloudinary.com/dpbscvwv3/image/upload/v1697764831/393990886_1483536199101474_2162963140634789592_n_ifhaoe.png?fbclid=IwAR13zvLSLaEDKZ26xpqhJsputuvU_aK8RYTsAitKV9jd6HcovoZfAt044UQ\" alt=\"Bird Farm Shop Logo\" style=\"width: 200px;\">\n"
                + "    </div>\n"
                + "    <div class=\"title\">\n"
                + "        <p>Xin chào " + order.getReceiverName() + ",</p>\n"
                + "        <p>Cảm ơn đã tin tưởng và mua sản phẩm tại cửa hàng chúng tôi</p>\n"
                + acceptOrder 
                + "    </div>\n"
                + "    <div class=\"line\"></div>\n"
                + "    <div class=\"content\">\n"
                + "        <div class=\"paymentMethod\">\n"
                + "            <h4>Phương thức thanh toán:</h4>\n"
                + "            <p>" + orderType + "</p>\n"
                + "        </div>\n"
                + "        <div class=\"OrderInfo\">\n"
                + "            <h4>Thông tin đơn hàng:</h4>\n"
                + "            <p>Hóa đơn: " + order.getOrderCode() + "</p>\n"
                + "            <p>Ngày thanh toán: " + order.getCreatedDate() + "</p>\n"
                +"<div class=\"line\"></div>\n";
                for (RequiredOrderDTO orderDetailItem : orderDetail) {
                     String formattedEachNumber = decimalFormat.format(orderDetailItem.getFeeBirdNest());
                           orderInfo.append("<p>Tên sản phẩm: ").append(orderDetailItem.getName()).append("</p>\n")
                            .append("<p>Số lượng: ").append("1 </p>\n")
                            .append("<p>Phí: ").append(formattedEachNumber).append("</p>\n")
                            .append("<div class=\"line\"></div>\n");
                }
        String lastEmail = "        </div>\n"
                + "        <div class=\"UserInfo\">\n"
                + "            <h4>Thông tin người mua:</h4>\n"
                + "            <p>Họ và tên: " + order.getReceiverName() + "</p>\n"
                + "            <p>Email: " + email + "</p>\n"
                + "            <p>Địa chỉ: " + order.getReceiverAddress() + "</p>\n"
                + "        </div>\n"
                + "        <div class=\"line\"></div>\n"
                + "        <div class=\"Total\">\n"
                + "            <p>Tổng tiền: " + formattedNumber + " VNĐ</p>\n"
                + "        </div>\n"
                + "    </div>\n"
                + "</body>\n"
                + "</html>\n";
        Email.sendEmail(email, "Bird Farm Shop Invoice", bill + orderInfo.toString() + lastEmail);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
