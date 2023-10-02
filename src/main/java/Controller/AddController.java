/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.product.ProductDAO;
import sample.product.ProductDTO;
import sample.shopping.Cart;
import sample.user.UserDAO;
import sample.user.UserDTO;

/**
 *
 * @author 1005h
 */
public class AddController extends HttpServlet {

    private static final String ERROR="shopping.jsp";
    private static final String SUCCESS="shopping.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String productID = request.getParameter("productID");
            String productImage = request.getParameter("productImage");
            String productName = request.getParameter("productName");
            double productPrice = Double.parseDouble(request.getParameter("productPrice"));
            int productQuantity = Integer.parseInt(request.getParameter("quantity"));
            ProductDTO product = new ProductDTO(productID, productName, productPrice, productQuantity, productImage);
            HttpSession session = request.getSession();
            if(session!=null){
                Cart cart = (Cart) session.getAttribute("CART");
                if(cart==null){
                    cart = new Cart();
                }
                boolean check = cart.add(product);
                if (check) {
                    session.setAttribute("CART", cart);
                    request.setAttribute("MESSAGE", "Add " + productQuantity + " " + productName + " successfully!");
                    url = SUCCESS;
                }
                if (!check) {
                    request.setAttribute("MESSAGE", "Quantity exist the available amount!");
                    url = ERROR;
                }
            }
        } catch (Exception e) {
            log("Error at AddController: " + e.toString());
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
