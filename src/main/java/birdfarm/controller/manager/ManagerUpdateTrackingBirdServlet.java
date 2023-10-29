/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package birdfarm.controller.manager;

import birdfarm.dao.ManagerProductDAO;
import birdfarm.dao.ManagerTrackingBirdDAO;
import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.SQLException;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author HP
 */
@WebServlet(name = "ManagerUpdateTrackingBirdServlet", urlPatterns = {"/ManagerUpdateTrackingBirdServlet"})
@MultipartConfig
public class ManagerUpdateTrackingBirdServlet extends HttpServlet {

    private final String ERROR_PAGE = "error.html";
    private static final String CLOUDINARY_CLOUD_NAME = "dpbscvwv3";
    private static final String CLOUDINARY_API_KEY = "742261457416638";
    private static final String CLOUDINARY_API_SECRET = "89eQg0LcQcu9AUXLYWgEN-S63Lk";

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
        String status = request.getParameter("txtstatus");
        Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
                "cloud_name", CLOUDINARY_CLOUD_NAME,
                "api_key", CLOUDINARY_API_KEY,
                "api_secret", CLOUDINARY_API_SECRET));
        Part filePart = request.getPart("file");
        String fileName = filePart.getSubmittedFileName();
//        String fileName_1 = "C:\\Users\\HP\\Pictures\\Camera Roll\\" + fileName;
        String uploadDirectory = request.getServletContext().getRealPath("") + File.separator + "uploads";
        String filePath = uploadDirectory + File.separator + fileName;
        try {
            String idRequiredOrder = request.getParameter("txtidRequiredOrder");
            String idBirdNest = request.getParameter("txtidBirdNest");

            String imgTracking = request.getParameter("txtimgTracking");
            String reason = request.getParameter("txtreason");

            String birdNestFemale = request.getParameter("txtquantityBirdFemaleChild");
            String birdNestMale = request.getParameter("txtquantityBirdMaleChild");
            
            String noDataImg = null;

            int idRequiredOrder1 = Integer.parseInt(idRequiredOrder);
            int birdNestFemale1 = Integer.parseInt(birdNestFemale);
            int birdNestMale1 = Integer.parseInt(birdNestMale);
            String birdName = "Chim"+idBirdNest;
            if (idRequiredOrder1 > 0) {
                ManagerTrackingBirdDAO dao = new ManagerTrackingBirdDAO();
                dao.updateTrackingBirdDetail(idRequiredOrder1, birdNestFemale1, birdNestMale1);
                dao.updateTrackingBird(idRequiredOrder1, status, reason);
                String nameOfBird = "Chim"+idBirdNest;
                if (filePart != null && filePart.getSize() > 0) {
                    File directory = new File(uploadDirectory);
                    if (!directory.exists()) {
                        directory.mkdirs();
                    }
                    // Create File object from Part
//                    File file = new File(fileName_1);
                    try (InputStream fileContent = filePart.getInputStream()) {
                        // Save uploaded image to Cloudinary
                        Files.copy(fileContent, Paths.get(filePath), StandardCopyOption.REPLACE_EXISTING);
                        // Save uploaded image to Cloudinary
                        Map uploadResult = cloudinary.uploader().upload(filePath, ObjectUtils.emptyMap());
                        String imageUrl = (String) uploadResult.get("secure_url");
                        dao.updateTrackingBirdImg(idRequiredOrder1, imageUrl);
                        dao.insertTrackingBird(idBirdNest, imageUrl, status, reason,nameOfBird);
                    }

                } else {
                    dao.insertTrackingBird(idBirdNest,noDataImg , status, reason,nameOfBird);

                }

                //2.2 call method of DAO 
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
            Logger.getLogger(ManagerUpdateTrackingBirdServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ManagerUpdateTrackingBirdServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(ManagerUpdateTrackingBirdServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ManagerUpdateTrackingBirdServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ManagerUpdateTrackingBirdServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(ManagerUpdateTrackingBirdServlet.class.getName()).log(Level.SEVERE, null, ex);
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
