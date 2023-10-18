/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package birdfarm.controller.cart;

import java.io.IOException;
import java.io.PrintWriter;
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
import birdfarm.dto.ReceiverDTO;
import birdfarm.payment.Payment_COD_DTO;
import birdfarm.payment.Payment_VNP_DTO;
import birdfarm.shopping.Cart;

/**
 *
 * @author 1005h
 */
public class PaymentResultController extends HttpServlet {

    private static final String ERROR = "shopping.jsp";
    private static final String VNP = "paymentResultVNP.jsp";
    private static final String COD = "paymentResultCOD.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            //Cap nhat quantity san pham va tinh trang thanh toan o day
            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("CART");
            OrderDAO odao = new OrderDAO();
            BirdDAO bdao = new BirdDAO();
            String email =(String) session.getAttribute("EMAIL");
            OrderDTO order = (OrderDTO) session.getAttribute("ORDER");

            if (order.getPaymentId() == 2) {
                String vnp_ResponseCode = request.getParameter("vnp_ResponseCode");
                if (vnp_ResponseCode.equals("00")) {
                    boolean checkQuantity = false;
                    if (cart != null) {
                        for (BirdDTO product : cart.getCart().values()) {
                            checkQuantity = bdao.updateQuantity(product);
                        }
                        order.setIsPay(true);
                        odao.updateIsPay(order);
                        sendMail_Method(order,email);
                        url = VNP;
                    }
                } else {
                    url = VNP;
                }
            } else if (order.getPaymentId()==1) {
                //COD cung cap nhat quantity va tinh trang thanh toan, va gui mail
                boolean checkQuantity = false;
                if (cart != null) {
                    for (BirdDTO product : cart.getCart().values()) {
                        checkQuantity = bdao.updateQuantity(product);
                    }
                    order.setIsPay(true);
                    odao.updateIsPay(order);
                    sendMail_Method(order,email);
                    url = COD;
                } else {
                    url = COD;
                }
            } else {
                request.setAttribute("MESSAGE", "Something went wrong! Any changed has been rolled back!");
                url = ERROR;
            }
        } catch (Exception e) {
            log("Error at PaymentResultController: " + e.toString());
        } finally {
            response.sendRedirect(url);
        }
    }

    private void sendMail_Method(OrderDTO order,String email) {
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
                + "        <img src=\"https://cdn.discordapp.com/attachments/1090646946127036508/1125092227857784964/Tun_Store.png\" alt=\"Tủn Store Logo\" style=\"width: 200px;\">\n"
                + "    </div>\n"
                + "    <div class=\"title\">\n"
                + "        <p>Greetings " + order.getReceiverName()+ ",</p>\n"
                + "        <p>Thank you for your ordering at Tủn Store!</p>\n"
                + "        <p>Your order " + order.getOrderCode() + " has been successfully paid on " + order.getCreatedDate() + "</p>\n"
                + "    </div>\n"
                + "    <div class=\"line\"></div>\n"
                + "    <div class=\"content\">\n"
                + "        <div class=\"UserInfo\">\n"
                + "            <h4>Receiver's Information:</h4>\n"
                + "            <p>Full Name: " + order.getReceiverName() + "</p>\n"
                + "            <p>Email: " + email + "</p>\n"
                + "        </div>\n"
                + "        <div class=\"paymentMethod\">\n"
                + "            <h4>Payment Method:</h4>\n"
                + "            <p>" + order.getPaymentId() + "</p>\n"
                + "        </div>\n"
                + "        <div class=\"OrderInfo\">\n"
                + "            <h4>Order's Information:</h4>\n"
                + "            <p>Invoice: " + order.getOrderCode() + "</p>\n"
                + "            <p>Order date: " + order.getCreatedDate() + "</p>\n"
                + "        </div>\n"
                + "        <div class=\"line\"></div>\n"
                + "        <div class=\"Total\">\n"
                + "            <p>Total: " + order.getTotal() + " VNĐ</p>\n"
                + "        </div>\n"
                + "    </div>\n"
                + "</body>\n"
                + "</html>\n";
        Email.sendEmail(email, "Tun Store Order Invoice", bill);
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
