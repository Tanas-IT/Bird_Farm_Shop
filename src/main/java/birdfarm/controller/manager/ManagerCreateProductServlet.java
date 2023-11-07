/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package birdfarm.controller.manager;

import birdfarm.dao.ManagerProductDAO;
import birdfarm.dto.ManagerCreateErrorDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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
@WebServlet(name = "ManagerCreateProductServlet", urlPatterns = {"/ManagerCreateProductServlet"})
public class ManagerCreateProductServlet extends HttpServlet {

    private final String ERROR_PAGE = "ManagerViewCreateProductServlet";

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
            throws ServletException, IOException, SQLException, NamingException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");

        String idBird = request.getParameter("txtId");
        String period = request.getParameter("txtperiod");
        String idBirdSpecies = request.getParameter("txtidBirdSpecies");
        String quantity = request.getParameter("txtQuantity");
        String importPrice = request.getParameter("txtImportPrice");
        String salePrice = request.getParameter("txtSalePrice");
        String type = request.getParameter("txtType");
        String overView = request.getParameter("txtOverView");
        String shortDescription = request.getParameter("txtShortDescription");
        String imageURL = request.getParameter("txtImageURL");
        String videoURL = request.getParameter("txtvideoURL");
        String name = request.getParameter("txtName");

        //=================================================
        String achievement = request.getParameter("txtAchievement");
        String reductiveHistory = request.getParameter("txtreductiveHistory");
        String age = request.getParameter("txtAge");
        String mutation = request.getParameter("txtMutation");
        String birdMother = request.getParameter("txtBirdMother");
        String birdFather = request.getParameter("txtBirdFather");
        String gender = request.getParameter("txtGender");
        String feeBirdMaleBorn = request.getParameter("txtBirdMaleBorn");
        String feeBirdFemaleBorn = request.getParameter("txtBirdFemaleBorn");

        ManagerCreateErrorDTO errors = new ManagerCreateErrorDTO();

        int idBirdSpecies1 = Integer.parseInt(idBirdSpecies);
        int quantity1 = Integer.parseInt(quantity);
        Double importPrice1 = Double.parseDouble(importPrice);
        Double salePrice1 = Double.parseDouble(salePrice);
        int type1 = Integer.parseInt(type);

        boolean mutation1 = Boolean.parseBoolean(mutation);
        Double feeBirdMaleBorn1 = Double.parseDouble(feeBirdMaleBorn);
        Double feeBirdFemaleBorn1 = Double.parseDouble(feeBirdFemaleBorn);

        String url = ERROR_PAGE;
        try {

            ManagerProductDAO dao = new ManagerProductDAO();
            dao.insertTableBirdProduct(idBird, name, overView, idBirdSpecies1, 
                    quantity1, importPrice1, salePrice1, imageURL, period, type1, 
                    videoURL, shortDescription);
            
            if(idBird != "" && birdFather != "" && birdMother != ""){
                String idBirdProfile = "BP_"+idBird;
                String age1 = age+" tuổi";
                dao.insertTableBirdProfile(idBirdProfile, idBird, 
                        achievement, reductiveHistory, age1, birdFather, 
                        birdMother, mutation1, gender, feeBirdFemaleBorn1, feeBirdFemaleBorn1);
            }
            url = ERROR_PAGE;

            // no error occurs
        } catch (SQLException ex) {
            errors.setIdBirdIsExisted(idBird + " is existed !!! \n "
                    + "Please try to create another account !!!");
            request.setAttribute("CREATE_ERRORS", errors);
            log("CreateNewProduct _ SQL " + ex.getMessage());
        } catch (NamingException ex) {
            log("CreateNewProduct _ Naming " + ex.getMessage());
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
            Logger.getLogger(ManagerCreateProductServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(ManagerCreateProductServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ManagerCreateProductServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ManagerCreateProductServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(ManagerCreateProductServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ManagerCreateProductServlet.class.getName()).log(Level.SEVERE, null, ex);
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
