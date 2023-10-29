/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package birdfarm.controller.birdproduct;

import birdfarm.dao.BirdDAO;
import birdfarm.dao.UserDAO;
import birdfarm.dto.BirdDTO;
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
import javax.servlet.http.HttpSession;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "ViewMoreBirdServlet", urlPatterns = {"/ViewMoreBirdServlet"})
public class ViewMoreBirdServlet extends HttpServlet {

    private final String VIEW_MORE_PAGE = "birdDetail.jsp";
    private final String ERROR_PAGE = "error.html";

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
            HttpSession session = request.getSession();
            String idBird = request.getParameter("id");
            String userId = request.getParameter("userID");
            BirdDAO birdDAO = new BirdDAO();
            UserDAO userDAO = new UserDAO();
            birdDAO.getAllBird();
            List<BirdDTO> listBird = birdDAO.getBirdList();
            ArrayList<String> subImageURLs;
            for (BirdDTO bird : listBird) {
                if (bird.getIdBird().equals(idBird)) {
                    birdDAO.getSubImageByBirdID(bird.getIdBird());
                    subImageURLs = bird.getSubImageURL();
                    if (subImageURLs == null) {
                        subImageURLs = new ArrayList<>();
                        bird.setSubImageURL(subImageURLs);
                    }
                    subImageURLs.addAll(birdDAO.getBirdSubImageList());
                    bird.setFatherBird(birdDAO.getFatherAndMotherBird(bird.getIdFatherBird()));
                    bird.setMotherBird(birdDAO.getFatherAndMotherBird(bird.getIdMotherBird()));
                    break;
                }
            }
            session.setAttribute("idBird", idBird);
            request.setAttribute("listBird", listBird);
            url = VIEW_MORE_PAGE;
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
