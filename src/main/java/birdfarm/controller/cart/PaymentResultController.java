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
import birdfarm.dao.OrderDAO;
import birdfarm.dto.BirdDTO;
import birdfarm.dto.OrderDTO;
import birdfarm.dto.OrderDetailDTO;
import birdfarm.dto.UserDTO;
import birdfarm.shopping.Cart;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author 1005h
 */
public class PaymentResultController extends HttpServlet {

    private static final String ERROR = "viewCart.jsp";
    private static final String VNP = "paymentResultVNP.jsp";
    private static final String COD = "paymentResultCOD.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        //vnp_BankCode, vnp_OrderInfo,vnp_BankTranNo,vnp_TransactionNo
        try {
            //Cap nhat quantity san pham va tinh trang thanh toan o day
            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("CART");
            Cart checkOutCart = (Cart) session.getAttribute("CHECKOUTCART");
            OrderDAO odao = new OrderDAO();
            BirdDAO bdao = new BirdDAO();
            String email = (String) session.getAttribute("EMAIL");
            OrderDTO order = (OrderDTO) session.getAttribute("ORDER");
            List<OrderDetailDTO> orderDetail = odao.getOrderDetail(order);
            session.setAttribute("ORDERDETAIL", orderDetail);
            if (order.getPaymentId() == 2) {
                String vnp_ResponseCode = request.getParameter("vnp_ResponseCode");
                if (vnp_ResponseCode.equals("00")) {
                    boolean checkQuantity = false;
                    if (cart != null) {
                        ArrayList<String> removeProductInCart = new ArrayList<>();
                        for (String birdKey : checkOutCart.getCart().keySet()) {
                            checkQuantity = bdao.updateQuantity(checkOutCart.getCart().get(birdKey));
                            cart.getCart().get(birdKey).setQuantityOfUser(0);
                            removeProductInCart.add(birdKey);
                        }
                        for(String productKey : removeProductInCart) {
                            cart.getCart().remove(productKey);
                        }
                        order.setIsPay(true);
                        odao.updateIsPay(order);
                        sendMail_Method(order, email, orderDetail);
                        url = VNP;
                        session.setAttribute("CART",cart);
                        session.removeAttribute("quantityOfCart");
                    }
                } else {
                    url = ERROR;
                    session.setAttribute("PAYMENT", "Thanh toán không thành công");
                    UserDTO user = (UserDTO) session.getAttribute("user");
                    session.setAttribute("user", user);
                }
            } else if (order.getPaymentId() == 1) {
                //COD cung cap nhat quantity va tinh trang thanh toan, va gui mail
                boolean checkQuantity = false;
                if (cart != null) {
                     ArrayList<String> removeProductInCart = new ArrayList<>();
                        for (String productKey : checkOutCart.getCart().keySet()) {
                            checkQuantity = bdao.updateQuantity(checkOutCart.getCart().get(productKey));
                            cart.getCart().get(productKey).setQuantityOfUser(0);
                            removeProductInCart.add(productKey);
                        }
                        for(String productKey : removeProductInCart) {
                            cart.getCart().remove(productKey);
                        }
                        order.setIsPay(true);
                        odao.updateIsPay(order);
                        sendMail_Method(order, email, orderDetail);
                    url = COD;
                    session.setAttribute("PAYMENT", "Lỗi");
                    session.setAttribute("CART",cart);
                    session.removeAttribute("quantityOfCart");
                } else {
                    url = COD;
                    session.setAttribute("PAYMENT", "Lỗi");
                    session.removeAttribute("quantityOfCart");
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

    private void sendMail_Method(OrderDTO order, String email, List<OrderDetailDTO> orderDetail) {
        String orderType = "Thanh toán trực tiếp khi nhận hàng";
        String acceptOrder = "        <p>Đơn hàng " + order.getOrderCode() + " của bạn đã được duyệt vào ngày " + order.getCreatedDate() + ". Bạn vui lòng thanh toán khi nhận hàng</p>\n";
        StringBuilder orderInfo = new StringBuilder();
        DecimalFormat decimalFormat = new DecimalFormat("###,###");
        String formattedNumber = decimalFormat.format(order.getTotal());
        if (order.getPaymentId() == 2) {
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
                + "    <div class=\"line\"></div>\n";
                for (OrderDetailDTO orderDetailItem : orderDetail) {
                    String orderDetailPrice = decimalFormat.format(orderDetailItem.getPrice());
                    String orderDetailTotalEach = decimalFormat.format(orderDetailItem.getQuantity() * orderDetailItem.getPrice());
                    orderInfo.append("<h4>Tên sản phẩm: ").append(orderDetailItem.getBird().getName()).append("</h4>\n")
                            .append("<p>Số lượng: ").append(orderDetailItem.getQuantity()).append("</p>\n")
                            .append("<p>Đơn giá: ").append(orderDetailPrice).append("</p>\n")
                            .append("<p>Tổng: ").append(orderDetailTotalEach).append(" VNĐ</p>\n");
                    orderInfo.append("<div class=\"line\"></div>\n");
                    orderInfo.append("        <div class=\"Total\">\n");
              
                }
                String lastEmail = "            <p>Tổng tiền: " + formattedNumber + " VNĐ</p>\n"
                + "        </div>\n" + "    </div>\n"+ "</body>\n"+ "</html>\n";
        String userInfo = "        </div>\n"
                + "        <div class=\"UserInfo\">\n"
                + "            <h4>Thông tin người mua:</h4>\n"
                + "            <p>Họ và tên: " + order.getReceiverName() + "</p>\n"
                + "            <p>Email: " + email + "</p>\n"
                + "            <p>Địa chỉ: " + order.getReceiverAddress() + "</p>\n"
                + "        </div>\n"
                + "        <div class=\"line\"></div>\n";
                
                
        Email.sendEmail(email, "Bird Farm Shop Invoice", bill + userInfo + orderInfo.toString() + lastEmail);
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
