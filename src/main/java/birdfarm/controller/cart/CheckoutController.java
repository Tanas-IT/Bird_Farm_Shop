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
@WebServlet(name = "CheckoutController", urlPatterns = {"/CheckoutController"})
public class CheckoutController extends HttpServlet {

    private static final String SUCCESS = "checkOut.jsp";
    private static final String LOGIN_ERROR = "Login.jsp";
    private static final String CART_ERROR = "viewCart.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = CART_ERROR;

        try {
            HttpSession session = request.getSession();
            String userID = request.getParameter("userID");
            String[] birdID = request.getParameterValues("idBird");
            String[] quantityArray = request.getParameterValues("birdQuantity");
            String[] indexArray = request.getParameterValues("selectedIndexs");
            UserDAO userDAO = new UserDAO();
            UserDTO user = userDAO.getUser(userID);
            if (user == null) {
                request.setAttribute("MESSAGE_CHECKOUT", "You must login to checkout!");
                url = LOGIN_ERROR;
            } else {
                Cart cart = (Cart) session.getAttribute("CART");
                Cart checkOutCart = new Cart();
                BirdDAO birdDAO = new BirdDAO();
                if (cart == null || birdID.equals("")) {
                    request.setAttribute("MESSAGE", "Giỏ hàng của bạn đang trống. Vui lòng quay lại chọn sản phẩm");
                    url = CART_ERROR;
                } else {
                    for(int i = 0; i < indexArray.length; i++) {
                        int index = Integer.parseInt(indexArray[i]);
                        BirdDTO bird = birdDAO.getBirdByID(birdID[index]);
                        bird.setQuantityOfUser(Integer.parseInt(quantityArray[index]));
                        boolean check = checkOutCart.add(bird);
                    }
                    String isBuy = request.getParameter("isBuy");
                    session.setAttribute("CHECKOUTCART", checkOutCart);
                    url = SUCCESS;

                }
                session.setAttribute("user", user);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
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
