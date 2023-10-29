/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package birdfarm.controller.cart;

import birdfarm.dao.BirdDAO;
import birdfarm.dao.UserDAO;
import birdfarm.dto.BirdDTO;
import birdfarm.dto.UserDTO;
import birdfarm.shopping.Cart;
import java.io.IOException;
import java.sql.SQLException;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Minh
 */
@WebServlet(name = "AddCheckoutController", urlPatterns = {"/AddCheckoutController"})
public class AddCheckOutController extends HttpServlet {

    private static final String ERROR = "home.jsp";
    private static final String SUCCESS = "viewCart.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String idUser = request.getParameter("userID");
            String birdID = request.getParameter("birdID");
            String birdQuantity = request.getParameter("birdQuantity");
            String selectedItem = request.getParameter("selectedItem");
            BirdDAO birdDAO = new BirdDAO();
            BirdDTO bird = birdDAO.getBirdByID(birdID);
            int birdQuantityInt = Integer.parseInt(birdQuantity);
            BirdDTO birdSelect = new BirdDTO(bird.getIdBird(),
                    bird.getName(), bird.getQuantity(),
                    bird.getSalePrice(), bird.getImageURL(), bird.getType(), birdQuantityInt);
            HttpSession session = request.getSession();
            if (session != null) {
                Cart cart = (Cart) session.getAttribute("CART");
                if (cart == null) {
                    cart = new Cart();
                }
                boolean check = false;
                check = cart.add(birdSelect);
                UserDAO userDAO = new UserDAO();
                UserDTO user = userDAO.getUser(idUser);
                session.setAttribute("user", user);
                
                    double total = 0;
                    session.setAttribute("CART", cart);
                    for (String key : cart.getCart().keySet()) {
                        double totalEach = cart.getCart().get(key).getQuantityOfUser() * cart.getCart().get(key).getSalePrice();
                        total += totalEach;
                    }
                    session.setAttribute("total", total);
                    session.setAttribute("quantityOfCart", cart.getCart().size());
                    session.setAttribute("idBird", birdID);
                    if(selectedItem != null) {
                         session.setAttribute("selected", selectedItem);
                    }
                    url = SUCCESS;
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
