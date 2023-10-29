/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package birdfarm.controller.cart;

import birdfarm.dto.BirdDTO;
import birdfarm.shopping.Cart;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "RemoveItemFromCart", urlPatterns = {"/RemoveItemFromCart"})
public class RemoveItemFromCart extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        String idBird = request.getParameter("idRemove");
        String userID = request.getParameter("userID");
        Cart cart = (Cart) session.getAttribute("CART");
        int quantityOfCart = (int) session.getAttribute("quantityOfCart");
        if(cart != null && !cart.getCart().isEmpty()) {
            cart.getCart().remove(idBird);
            quantityOfCart--;
        }
        if(cart == null || cart.getCart().isEmpty()) {
                session.setAttribute("total", 0);
            } else {
                 double total = 0;
                 for (String key : cart.getCart().keySet()) {
                        double totalEach = cart.getCart().get(key).getQuantityOfUser() * cart.getCart().get(key).getSalePrice();
                        total += totalEach;
                    }
                session.setAttribute("total", total);
            }
         if(quantityOfCart <= 0) {
             session.setAttribute("quantityOfCart", 0);
         } else {
              session.setAttribute("quantityOfCart", quantityOfCart);
         }
       
        
        try (PrintWriter out = response.getWriter()) {
            out.println(
"                            <i class=\"fa-solid fa-cart-shopping\"></i>\n" +
"                            <!--No cart:  header_cart-list--no-cart-->");
            if(cart == null || cart.getCart().isEmpty() || quantityOfCart <= 0) {
                out.println("<div class=\"header_cart\">\n" +
"                                        <div class=\"header__cart-list header_cart-list--no-cart\">\n" +
"                                        <img class=\"header__cart-no-cart-img\" src=\"img/no_cart.png\"/>\n" +
"                                        <span class=\"header__cart-list-no-cart-msg\">Chưa có sản phẩm</span>\n" +
"                                        </div>\n" +
"                                    </div>");
                
            } else {
            out.println("<div  class=\"header_cart\">\n" +
"                                    <div class=\"header__cart-list\">\n" +
"                                    <h4 class=\"header__cart-heading\">Sản phẩm đã thêm</h4>\n" +
"                                    <ul  class=\"header__cart-list-item\">");
            for (Map.Entry<String, BirdDTO> entry : cart.getCart().entrySet()) {
                    String type = "Chim phổ thông";
                    if(entry.getValue().getType() == 1) type = "Tổ chim";
                    else if(entry.getValue().getType() == 2) type = "Chim cao cấp";
                    else if(entry.getValue().getType() == 3) type = "Chim giống";
                    DecimalFormat decimalFormat = new DecimalFormat("###,###");
                    String formattedNumber = decimalFormat.format(entry.getValue().getSalePrice());                                                
                    idBird = entry.getKey();
            out.println("<li class=\"header__cart-item\">\n" +
"                                            <img class=\"header__cart-img\" src=\""+ entry.getValue().getImageURL() +"\">\n" +
"                                            <div class=\"header__cart-item-info\">\n" +
"                                                <div class=\"header__cart-item-head\">\n" +
"                                                    <h5 class=\"header__cart-item-name\">"+ entry.getValue().getName() +"</h5>\n" +
"                                                    <div class=\"header__cart-item-price-wrap\">\n" +
"                                                        <span class=\"header__cart-item-price\">\n" +
                                                            formattedNumber + " VNĐ" +
"                                                        </span>\n" +
"                                                        <span class=\"header__cart-item-multiply\">x</span>\n" +
"                                                        <span class=\"header__cart-item-quantity\">"+ entry.getValue().getQuantityOfUser() +"</span>\n" +
"                                                    </div>\n" +
"                                                </div>\n" +
"                                                <div class=\"header__cart-item-body\">\n" +
"                                                    <span class=\"header__cart-item-description\">\n" +
"                                                        Phân loại hàng:" + type +
"                                                    </span>\n" +
"                                                    <span class=\"header__cart-item-remove\"><span data-idRemove=\""+ entry.getKey() +"\" onclick=\"RemoveItemFromCart(this)\" >Xóa</span></span>\n" +
"                                                </div>\n" +
"                                            </div>\n" +
"                                        </li>\n");
                }
            out.println("</ul>\n" +
"                        <form action=\"DispatchServlet\">\n" +
"                              <input id=\"userID\" type=\"hidden\" name=\"userID\" value=\""+ userID +"\" />\n" +
"                              <input id=\"birdID\" type=\"hidden\" name=\"birdID\" value=\""+ idBird  +"\" />\n" +
"                              <input type=\"submit\" name=\"btAction\" class=\"header__cart-view-cart btn btn-danger\" value=\"Xem chi tiết\" />\n" +
"                       </form>\n" +
"                                    </div>\n" +
"                                </div>");
            }
                      out.println("Giỏ hàng\n" +
"                            <span class=\"badge bg-warning text-white ms-1 rounded-pill\">\n");
                        if (quantityOfCart > 0) { 
                            out.println(quantityOfCart);
                        } else {
                            out.println(" 0\n" +
             "                            </span>\n");
                        }
            
        }
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
