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
import birdfarm.shopping.Cart;

/**
 *
 * @author 1005h
 */
public class RemoveController extends HttpServlet {

    private static final String ERROR="viewCart.jsp";
    private static final String SUCCESS="viewCart.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String id = request.getParameter("productID");
            HttpSession session = request.getSession();
            if(session!=null){
                Cart cart = (Cart) session.getAttribute("CART");
                if(cart!=null){
                    boolean check = cart.remove(id);
                    if (check && cart.getCart().isEmpty()) {
                        session.setAttribute("CART", null);
                        request.setAttribute("MESSAGE", "Remove successfully!");
                        url = SUCCESS;
                    } else if(check) {
                        session.setAttribute("CART", cart);
                        request.setAttribute("MESSAGE", "Remove successfully!");
                        url = SUCCESS;
                    } else {
                        request.setAttribute("MESSAGE", "Remove failed!");
                        url = ERROR;
                    }
                }
                
            }
            
        } catch (Exception e) {
            log("Error at RemoveController: " + e.toString());
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
