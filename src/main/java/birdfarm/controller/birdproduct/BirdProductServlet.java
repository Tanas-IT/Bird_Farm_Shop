/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package birdfarm.controller.birdproduct;

import birdfarm.dao.BirdDAO;
import birdfarm.dao.BirdFeedbackDAO;
import birdfarm.dao.UserDAO;
import birdfarm.dto.BirdDTO;
import birdfarm.dto.BirdFeedbackDTO;
import birdfarm.dto.BirdTypeDTO;
import birdfarm.dto.UserDTO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "BirdProductServlet", urlPatterns = {"/BirdProductServlet"})
public class BirdProductServlet extends HttpServlet {
    private final String GUEST_PAGE = "guest.jsp";
    private final String ERROR_PAGE = "error.html";
    private final String HOME_PAGE = "home.jsp";
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
        String url = ERROR_PAGE;
        try {
           String quantityOfCart = request.getParameter("quantityOfCart");
           String idUser = request.getParameter("userID");
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
             for(BirdDTO bird : listCommonBird) {
                 birdDAO.getSubImageByBirdID(bird.getIdBird());
                 for(String img: birdDAO.getBirdSubImageList()) {
                     if(bird.getSubImageURL() == null) {
                         bird.setSubImageURL(new ArrayList<String>());
                     }
                     bird.getSubImageURL().add(img);
                 }
                 if(bird.getType() == 0) {
                     listBirdsInLots.add(bird);
                 } else if(bird.getType() == 1) {
                     listBirdNest.add(bird);
                 } else if(bird.getType() == 2) {
                     listPremiumBird.add(bird);
                 } else if(bird.getType() == 3) {
                     listBirdBestSeller.add(bird);
                 } else if(bird.getType() == 4) {
                     listBirdBreeding.add(bird);
                 }
             }
           request.setAttribute("listBirdFeedback", listBirdFeedback);
           request.setAttribute("listPremiumBird", listPremiumBird);
           request.setAttribute("listBirdsInLots", listBirdsInLots);
           request.setAttribute("listBirdNest", listBirdNest);
           request.setAttribute("listBirdBestSeller", listBirdBestSeller);
           request.setAttribute("listBirdType", listBirdType);
           if(idUser != null) {
               UserDAO userDAO = new UserDAO();
               UserDTO user = userDAO.getUser(idUser);
               request.setAttribute("user", user);
               request.setAttribute("quantityOfCart", quantityOfCart);
               url = HOME_PAGE;
           } else {
               url = GUEST_PAGE;
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
