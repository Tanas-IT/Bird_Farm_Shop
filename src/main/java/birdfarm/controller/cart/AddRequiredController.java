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
import birdfarm.shopping.RequiredCart;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
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
@WebServlet(name = "AddRequiredController", urlPatterns = {"/AddRequiredController"})
public class AddRequiredController extends HttpServlet {
    private final String PAIRING__PAGE = "pairing.jsp";
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
        String url = PAIRING__PAGE;
        String userID = request.getParameter("userID");
        String birdID = request.getParameter("birdID");
        String birdName = request.getParameter("birdName");
        int birdQuantity = Integer.parseInt(request.getParameter("birdQuantity"));
        HttpSession session = request.getSession();
        if (session != null) {
            RequiredCart cart = (RequiredCart) session.getAttribute("RCART");
            if (cart == null) {
                cart = new RequiredCart();
            }
           
            try {
                BirdDAO birdDAO = new BirdDAO();
                BirdDTO bird = birdDAO.getBirdPairing(birdID);
                bird.setQuantity(birdQuantity);
                boolean check = cart.add(bird);
                UserDAO userDAO = new UserDAO();
                UserDTO user = userDAO.getUser(userID);
                session.setAttribute("user", user);
                birdDAO.getAllBird();
                List<BirdDTO> listBird = birdDAO.getBirdList();
                request.setAttribute("listBird", listBird);
                if (check) {
                    double total = 0;
                    session.setAttribute("RCART", cart);
                    
                    if(session.getAttribute("Rtotal") != null) {
                        total = (double) session.getAttribute("Rtotal");
                    }
                   double totalEach = 0;
                    request.setAttribute("MESSAGE", "Thêm " + birdQuantity + " " + birdName + " vào giỏ hàng thành công!");
                        if(cart.getRcart().get(birdID).getGender().equals("Trống")) {
                            totalEach = cart.getRcart().get(birdID).getQuantity()* cart.getRcart().get(birdID).getFeeBirdNestMale();
                        } 
                        if(cart.getRcart().get(birdID).getGender().equals("Mái")) {
                            totalEach = cart.getRcart().get(birdID).getQuantity()* cart.getRcart().get(birdID).getFeeBirdNestFemale();
                        }
                        total += totalEach;
                        session.setAttribute("RquantityOfCart", cart.getRcart().size());
                    session.setAttribute("Rtotal", total);
                    session.setAttribute("idBird", birdID);
                }
                if (!check) {
                    request.setAttribute("MESSAGE_PAIRING", "Xin lỗi, quý khách chỉ có thể ghép 2 chim cùng loài và khác giới tính.");
                }
                
            } catch (SQLException ex) {
               ex.printStackTrace();
            } catch (NamingException ex) {
                ex.printStackTrace();
            } catch (ClassNotFoundException ex) {
                ex.printStackTrace();
            } finally {
               request.getRequestDispatcher(url).forward(request, response);
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
        protected void doGet
        (HttpServletRequest request, HttpServletResponse response)
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
        protected void doPost
        (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            processRequest(request, response);
        }

        /**
         * Returns a short description of the servlet.
         *
         * @return a String containing servlet description
         */
        @Override
        public String getServletInfo
        
            () {
        return "Short description";
        }// </editor-fold>

    }
