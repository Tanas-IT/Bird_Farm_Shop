/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package birdfarm.controller.feedback;

import birdfarm.dao.BirdFeedbackDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "FeedbackServlet", urlPatterns = {"/FeedbackServlet"})
public class FeedbackServlet extends HttpServlet {
    private final String ERROR_PAGE = "error.html";
    private final String HISTORY_BIRD_PAIRING = "HistoryPairingController";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR_PAGE;
        try  {
           String idRequireOrder = request.getParameter("idRequireOrder");
           String txtFeedback = request.getParameter("txtFeedback");
           String rateStar = request.getParameter("rateStar");
           int rateStarNum = Integer.parseInt(rateStar);
           String idBirdNest = request.getParameter("birdNestName");
           String idUser = request.getParameter("idUser");
            BirdFeedbackDAO birdFeedbackDAO = new BirdFeedbackDAO();
            boolean result = birdFeedbackDAO.insertBirdFeedBack(idUser, txtFeedback, idBirdNest, rateStarNum);
            if(result) {
                request.setAttribute("idOrder", idRequireOrder);
                url = HISTORY_BIRD_PAIRING;
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
