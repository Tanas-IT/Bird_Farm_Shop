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
import birdfarm.shopping.CheckOutCart;
import birdfarm.shopping.CheckOutProduct;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;
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

      private static final String ERROR="viewCart.jsp";
    private static final String SUCCESS="checkOut.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String idUser = request.getParameter("userID");
            String[] birdIDArray = request.getParameterValues("birdID");
            String[] birdQuantity = request.getParameterValues("birdQuantity");
            BirdDAO birdDAO = new BirdDAO();
            ArrayList<CheckOutProduct> birdSelectCheckOutList = new ArrayList<>();
            for(int i = 0; i < birdIDArray.length; i++) {
                BirdDTO bird = birdDAO.getBirdByID(birdIDArray[i]);
                bird.setQuantity(Integer.parseInt(birdQuantity[i]));
                 CheckOutProduct birdSelect = new CheckOutProduct(bird.getIdBird(),
                           bird.getName(),bird.getQuantity() ,
                           bird.getQuantity(),bird.getImageURL());
                birdSelectCheckOutList.add(birdSelect);
            }
            HttpSession session = request.getSession();
            if(session!=null){
                CheckOutCart cart = (CheckOutCart) session.getAttribute("CHECKOUTCART");
                if(cart==null){
                    cart = new CheckOutCart();
                }
                boolean check = false;
                for(CheckOutProduct birdCheckOut : birdSelectCheckOutList) {
                    check = cart.add(birdCheckOut);
                    if(check == false) {
                        break;
                    }
                }
                UserDAO userDAO = new UserDAO();
                UserDTO user = userDAO.getUser(idUser);
                 request.setAttribute("user", user);
                if (check) {
                    double total = 0;
                    session.setAttribute("CHECKOUTCART", cart);
                  
                     for (String key : cart.getCart().keySet()) {
                        double totalEach = cart.getCart().get(key).getQuantity() * cart.getCart().get(key).getSalePrice();
                        total += totalEach;
                    }
                    session.setAttribute("total", total);
                    session.setAttribute("quantityOfCart", cart.getCart().size());
                    url = SUCCESS;
                }
                if (!check) {
                    
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
