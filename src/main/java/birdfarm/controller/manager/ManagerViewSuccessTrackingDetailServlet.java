/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package birdfarm.controller.manager;

import birdfarm.dao.ManagerTrackingBirdDAO;
import birdfarm.dto.ManagerTrackingBirdDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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

/**
 *
 * @author HP
 */
@WebServlet(name = "ManagerViewSuccessTrackingDetailServlet", urlPatterns = {"/ManagerViewSuccessTrackingDetailServlet"})
public class ManagerViewSuccessTrackingDetailServlet extends HttpServlet {

 private final String MANAGER_VIEW_ORDER_PAGE = "Manager_ViewSuccessTrackingBirdDetail.jsp";
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
            throws ServletException, IOException, SQLException, ClassNotFoundException, NamingException {
        response.setContentType("text/html;charset=UTF-8");

        String searchValue = request.getParameter("txtidRequiredOrder");
        int searchVal = Integer.parseInt(searchValue);

        String url = ERROR_PAGE;
        try {
            if (searchVal > 0) {
                ManagerTrackingBirdDAO dao = new ManagerTrackingBirdDAO();
                dao.showUpdateTrackingBird(searchVal);
                List<ManagerTrackingBirdDTO> result1 = dao.getRequiredOrderDetailList();
                request.setAttribute("TRACKING_ORDER_DETAIL_LIST", result1);
                url = MANAGER_VIEW_ORDER_PAGE;
            }
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
     try {
         processRequest(request, response);
     } catch (SQLException ex) {
         Logger.getLogger(ManagerViewSuccessTrackingDetailServlet.class.getName()).log(Level.SEVERE, null, ex);
     } catch (ClassNotFoundException ex) {
         Logger.getLogger(ManagerViewSuccessTrackingDetailServlet.class.getName()).log(Level.SEVERE, null, ex);
     } catch (NamingException ex) {
         Logger.getLogger(ManagerViewSuccessTrackingDetailServlet.class.getName()).log(Level.SEVERE, null, ex);
     }
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
     try {
         processRequest(request, response);
     } catch (SQLException ex) {
         Logger.getLogger(ManagerViewSuccessTrackingDetailServlet.class.getName()).log(Level.SEVERE, null, ex);
     } catch (ClassNotFoundException ex) {
         Logger.getLogger(ManagerViewSuccessTrackingDetailServlet.class.getName()).log(Level.SEVERE, null, ex);
     } catch (NamingException ex) {
         Logger.getLogger(ManagerViewSuccessTrackingDetailServlet.class.getName()).log(Level.SEVERE, null, ex);
     }
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
