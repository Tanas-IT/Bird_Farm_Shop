/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package birdfarm.controller.manager;

import birdfarm.dao.ManagerProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
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
 * @author HP
 */
@WebServlet(name = "ManagerUpdateProductServlet", urlPatterns = {"/ManagerUpdateProductServlet"})
public class ManagerUpdateProductServlet extends HttpServlet {

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
            throws ServletException, IOException, ClassNotFoundException, SQLException, NamingException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR_PAGE;
        try {
            String idBird = request.getParameter("txtIdBird");
            String status = request.getParameter("txtStatus");
            String period = request.getParameter("txtPeriod");
            String quantity = request.getParameter("txtQuantity");
            String importPrice = request.getParameter("txtImportPrice");
            String salePrice = request.getParameter("txtSalePrice");
            String imageURL = request.getParameter("txtImageURL");
            String videoURL = request.getParameter("txtvideoURL");

            String overview = request.getParameter("txtOverview");

            //========================
            String birdMaleBorn = request.getParameter("txtBirdMaleBorn");
            String birdFemaleBorn = request.getParameter("txtBirdFemaleBorn");
            String achievement = request.getParameter("txtAchievement");
            String shortDescription = request.getParameter("txtShortDescription");

            boolean status1 = false;
            int quantity1 = Integer.parseInt(quantity);
            Double importPrice1 = Double.parseDouble(importPrice);
            Double salePrice1 = Double.parseDouble(salePrice);

            Double birdMaleBorn1 = Double.parseDouble(birdMaleBorn);
            Double birdFemaleBorn1 = Double.parseDouble(birdFemaleBorn);

            if (status != null) {
                status1 = true;
            }

            ManagerProductDAO dao = new ManagerProductDAO();
            dao.updateProduct(idBird, status1, period, quantity1,
                    importPrice1, salePrice1, imageURL, overview, videoURL);
            dao.updateProductVer2BirdProduct(idBird, shortDescription);
            dao.updateProductVer3BirdProfile(idBird, achievement, birdMaleBorn1, birdFemaleBorn1);

            url = "DispatchServlet?btAction=ViewUpdateProduct&txtIdBird=" + idBird;

        } finally {
            response.sendRedirect(url);
            out.close();
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
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ManagerUpdateProductServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ManagerUpdateProductServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(ManagerUpdateProductServlet.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ManagerUpdateProductServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ManagerUpdateProductServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(ManagerUpdateProductServlet.class.getName()).log(Level.SEVERE, null, ex);
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
