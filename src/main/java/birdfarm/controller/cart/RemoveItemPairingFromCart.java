/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package birdfarm.controller.cart;

import birdfarm.dto.BirdDTO;
import birdfarm.shopping.RequiredCart;
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
@WebServlet(name = "RemoveItemPairingFromCart", urlPatterns = {"/RemoveItemPairingFromCart"})
public class RemoveItemPairingFromCart extends HttpServlet {

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
        HttpSession session = request.getSession();
        String idBird = request.getParameter("idRemove");
        String userID = request.getParameter("userID");
        RequiredCart cart = (RequiredCart) session.getAttribute("RCART");
        int quantityOfCart = (int) session.getAttribute("RquantityOfCart");
        if(cart != null && !cart.getRcart().isEmpty()) {
            cart.getRcart().remove(idBird);
            quantityOfCart--;
        }
        if(cart == null || cart.getRcart().isEmpty()) {
                session.setAttribute("Rtotal", 0);
            } else {
                 double total = 0;
                 for (String key : cart.getRcart().keySet()) {
                        double totalEach = cart.getRcart().get(key).getQuantityOfUser() * cart.getRcart().get(key).getSalePrice();
                        total += totalEach;
                  }
                session.setAttribute("Rtotal", total);
            }
         if(quantityOfCart <= 0) {
             session.setAttribute("RquantityOfCart", 0);
              session.removeAttribute("RCART");
              session.removeAttribute("Rtotal");
         } else {
              session.setAttribute("RquantityOfCart", quantityOfCart);
              session.setAttribute("RCART",cart);
         }
        
        request.getRequestDispatcher("pairing.jsp").forward(request, response);
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
