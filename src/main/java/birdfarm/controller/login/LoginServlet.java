/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package birdfarm.controller.login;

import birdfarm.dao.BirdDAO;
import birdfarm.dao.BirdFeedbackDAO;
import birdfarm.dao.UserDAO;
import birdfarm.dto.BirdDTO;
import birdfarm.dto.BirdFeedbackDTO;
import birdfarm.dto.BirdTypeDTO;
import birdfarm.dto.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    private static final String LOGIN_PAGE = "Login.jsp";
    private static final String HOME_PAGE = "home.jsp";
    private static final String ADMIN_PAGE = "AdminControlAccountServlet";
    private static final String MANAGER_PAGE = "ManagerViewOrderServlet";
    private static final String STAFF_PAGE = "ManagerViewOrderServlet";
    private static final String ERROR_PAGE = "error.html";
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
        PrintWriter out = response.getWriter();
        String userName = request.getParameter("txtUsername");
        String password = request.getParameter("txtPassword");
        String url = LOGIN_PAGE;
        try {
            HttpSession session = request.getSession();
            UserDAO dao = new UserDAO();

            UserDTO user = dao.checkLogin(userName, password);
            session.setAttribute("user", user);
            if (user == null) {
                url = LOGIN_PAGE;
            } else {
                if(user.getIdRole() == 4) {
                BirdDAO birdDAO = new BirdDAO();
                BirdFeedbackDAO birdFeedbackDAO = new BirdFeedbackDAO();
                birdFeedbackDAO.getBirdFeedBack();
                List<BirdFeedbackDTO> listBirdFeedback = birdFeedbackDAO.getListBirdFeedBack();
                birdDAO.getAllBird();
                List<BirdDTO> listCommonBird = birdDAO.getBirdList();
                List<BirdDTO> listBirdBestSeller = new ArrayList<>();
                List<BirdDTO> listPremiumBird = new ArrayList<>();
                List<BirdDTO> listBirdsInLots = new ArrayList<>();
                List<BirdDTO> listBirdNest = new ArrayList<>();
                List<BirdDTO> listBirdBreeding = new ArrayList<>();
                birdDAO.getAllSpecies();
                List<BirdTypeDTO> listBirdType = new ArrayList<>();
                listBirdType = birdDAO.getBirdTypeList();
//           for(BirdDTO bird : listCommonBird) {
//               if(bird.getQuantity() > 1 && !bird.isBirdNest()) {
//                   bird.setType("BirdInLots");
//                   listBirdsInLots.add(bird);
//                   
//               }
//               else if(bird.isBirdNest()) {
//                   bird.setType("BirdNest");
//                   listBirdNest.add(bird);
//               }
//           }
//           for(BirdDTO bird : listPremiumBird) {
//               bird.setType("BirdPremium");
//           }
//            for(BirdDTO bird : listBirdBestSeller) {
//               bird.setType("BirdBestSeller");
//           }
                for (BirdDTO bird : listCommonBird) {
                    if (bird.getType() == 0) {
                        listBirdsInLots.add(bird);
                    } else if (bird.getType() == 1) {
                        listBirdNest.add(bird);
                    } else if (bird.getType() == 2) {
                        listPremiumBird.add(bird);
                    } else if (bird.getType() == 3) {
                        listBirdBestSeller.add(bird);
                    } else if (bird.getType() == 4) {
                        listBirdBreeding.add(bird);
                    }
                }
                request.setAttribute("listBirdFeedback", listBirdFeedback);
                request.setAttribute("listPremiumBird", listPremiumBird);
                request.setAttribute("listBirdsInLots", listBirdsInLots);
                request.setAttribute("listBirdNest", listBirdNest);
                request.setAttribute("listBirdBestSeller", listBirdBestSeller);
                request.setAttribute("listBirdType", listBirdType);
                
                url = HOME_PAGE; 
                } else if(user.getIdRole() == 1) {
                    url = ADMIN_PAGE;
                } else if(user.getIdRole() == 2) {
                    url = MANAGER_PAGE;
                } else if(user.getIdRole() == 3) {
                    url = STAFF_PAGE;
                } else {
                    url = ERROR_PAGE;
                }
                
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (NamingException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
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
