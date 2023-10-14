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
import birdfarm.dao.BirdDAO;
import birdfarm.dto.BirdDTO;
import birdfarm.shopping.Cart;
import birdfarm.dao.UserDAO;
import birdfarm.dto.UserDTO;
import java.util.Map;
import javax.servlet.annotation.WebServlet;

/**
 *
 * @author 1005h
 */
@WebServlet(name = "AddController", urlPatterns = {"/AddController"})
public class AddController extends HttpServlet {

    private static final String ERROR="viewCart.jsp";
    private static final String SUCCESS="viewCart.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String idUser = request.getParameter("userID");
            String birdID = request.getParameter("birdID");
            String birdImage = request.getParameter("birdImage");
            String birdName = request.getParameter("birdName");
            double birdPrice = Double.parseDouble(request.getParameter("birdPrice"));
            int birdQuantity = Integer.parseInt(request.getParameter("birdQuantity"));
            BirdDTO bird = new BirdDTO(birdID, birdName, birdQuantity, birdPrice, birdImage);
            HttpSession session = request.getSession();
            if(session!=null){
                Cart cart = (Cart) session.getAttribute("CART");
                if(cart==null){
                    cart = new Cart();
                }
                boolean check = cart.add(bird);
                UserDAO userDAO = new UserDAO();
                UserDTO user = userDAO.getUser(idUser);
                 request.setAttribute("user", user);
                if (check) {
                    double total = 0;
                    session.setAttribute("CART", cart);
                    request.setAttribute("MESSAGE", "Thêm " + birdQuantity + " " + birdName + " vào giỏ hàng thành công!");
                    for (String key : cart.getCart().keySet()) {
                        double totalEach = cart.getCart().get(key).getQuantity() * cart.getCart().get(key).getSalePrice();
                        total += totalEach;
                    }
                    session.setAttribute("total", total);
                    session.setAttribute("quantityOfCart", cart.getCart().size());
                    url = SUCCESS;
                }
                if (!check) {
                    request.setAttribute("MESSAGE", "Xin lỗi, số lượng chim bạn yêu cầu vượt quá số lượng hiện có trong trang trại.");
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
