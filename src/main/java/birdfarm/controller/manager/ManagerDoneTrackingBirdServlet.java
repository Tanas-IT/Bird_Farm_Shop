/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package birdfarm.controller.manager;

import birdfarm.dao.ManagerTrackingBirdDAO;
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
@WebServlet(name = "ManagerDoneTrackingBirdServlet", urlPatterns = {"/ManagerDoneTrackingBirdServlet"})
public class ManagerDoneTrackingBirdServlet extends HttpServlet {

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
            String idRequiredOrder = request.getParameter("txtidRequiredOrder");
            String status = request.getParameter("txtstatus");
            String imgTracking = request.getParameter("txtimgTracking");
            String reason = request.getParameter("txtreason");

            String birdNestFemale = request.getParameter("txtquantityBirdFemaleChild");
            String birdNestMale = request.getParameter("txtquantityBirdMaleChild");
            String idBirdNest = request.getParameter("txtidBirdNest");
            String noDataImg = "https://res.cloudinary.com/dpbscvwv3/image/upload/v1698369672/7799536_ad1jms.png";

            String priceBirdDad = request.getParameter("txtpriceBirdDad");
            String priceBirdMom = request.getParameter("txtpriceBirdMom");
            String fee = request.getParameter("txtfee");

            int idRequiredOrder1 = Integer.parseInt(idRequiredOrder);
            int birdNestFemale1 = Integer.parseInt(birdNestFemale);
            int birdNestMale1 = Integer.parseInt(birdNestMale);

            Double fee_1 = Double.parseDouble(fee);
            Double priceBirdDad_1 = Double.parseDouble(priceBirdDad);
            Double priceBirdMom_1 = Double.parseDouble(priceBirdMom);
            //Tinh Total cua don hang
            Double a, b, total;

            a = fee_1;
            b = (birdNestFemale1*priceBirdMom_1) +(birdNestMale1*priceBirdDad_1);

            total = a + b;
            String button = request.getParameter("btAction");
            if(button.equals("DoneTrackingBird")) {
                status = "Đã hoàn thành";
            }

            if (idRequiredOrder1 > 0) {
                //2. call model 
                //2.1 new DAO object 
                ManagerTrackingBirdDAO dao = new ManagerTrackingBirdDAO();
                //2.2 call method of DAO 
                dao.successBirdProductTrackingBird(idRequiredOrder1);
                dao.successRequiredOrderTrackingBird(idRequiredOrder1, total, reason);
                String birdName = "Chim"+idBirdNest;
                dao.insertTrackingBird(idBirdNest, noDataImg, status, reason,birdName);

                url = "DispatchServlet?btAction=DetailTrackingBird&txtidRequiredOrder=" + idRequiredOrder;
            }

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
            Logger.getLogger(ManagerDoneTrackingBirdServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ManagerDoneTrackingBirdServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(ManagerDoneTrackingBirdServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ManagerDoneTrackingBirdServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ManagerDoneTrackingBirdServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(ManagerDoneTrackingBirdServlet.class.getName()).log(Level.SEVERE, null, ex);
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
