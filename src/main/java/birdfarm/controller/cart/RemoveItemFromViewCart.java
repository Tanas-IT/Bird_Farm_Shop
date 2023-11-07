/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package birdfarm.controller.cart;

import birdfarm.shopping.Cart;
import java.io.IOException;
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
@WebServlet(name = "RemoveItemFromViewCart", urlPatterns = {"/RemoveItemFromViewCart"})
public class RemoveItemFromViewCart extends HttpServlet {
    private final String VIEW_CART = "ViewController";
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = VIEW_CART;
        String idUser = request.getParameter("userID");
        String birdID = request.getParameter("birdIDRemove");
        HttpSession session = request.getSession();
        try  {
            Cart cart = (Cart) session.getAttribute("CART");
             int quantityOfCart = cart.getCart().size();
            if(cart != null && !cart.getCart().isEmpty()) {
                 cart.getCart().remove(birdID);
                  quantityOfCart--;
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
        }
         if(quantityOfCart <= 0) {
             session.setAttribute("quantityOfCart", 0);
         } else {
              session.setAttribute("quantityOfCart", quantityOfCart);
         }
        session.setAttribute("CART", cart);
        } finally {
           request.getRequestDispatcher(url).forward(request, response);
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
