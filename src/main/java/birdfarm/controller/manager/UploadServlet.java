package birdfarm.controller.manager;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author HP
 */
@MultipartConfig
@WebServlet(name = "UploadServlet", urlPatterns = {"/UploadServlet"})
public class UploadServlet extends HttpServlet {

    private static final String CLOUDINARY_CLOUD_NAME = "dpbscvwv3";
    private static final String CLOUDINARY_API_KEY = "742261457416638";
    private static final String CLOUDINARY_API_SECRET = "89eQg0LcQcu9AUXLYWgEN-S63Lk";

    private static final String DB_URL = "jdbc:sqlserver://localhost:1433;databaseName=BIRD_FARM_SHOP";
    private static final String DB_USERNAME = "sa";
    private static final String DB_PASSWORD = "12345";

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UploadServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UploadServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        // Initialize Cloudinary
        Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
                "cloud_name", CLOUDINARY_CLOUD_NAME,
                "api_key", CLOUDINARY_API_KEY,
                "api_secret", CLOUDINARY_API_SECRET));

        // Get file from request
        Part filePart = request.getPart("file");
        String fileName = filePart.getSubmittedFileName();
        String fileName_1 = "C:\\Users\\HP\\Pictures\\Camera Roll\\" + fileName;
        if (filePart != null && filePart.getSize() > 0) {
            // Create File object from Part
            File file = new File(fileName_1);
            try (InputStream fileContent = filePart.getInputStream()) {
                // Save uploaded image to Cloudinary
                Map uploadResult = cloudinary.uploader().upload(file, ObjectUtils.emptyMap());
                String imageUrl = (String) uploadResult.get("secure_url");

                // Save image URL to SQL Server
                // Use JDBC or Hibernate to connect and save to SQL Server
                // Example using JDBC:
                String jdbcUrl = "jdbc:sqlserver://localhost:1433;databaseName=BIRD_FARM_SHOP";
                String username = "sa";
                String password = "12345";
                try (Connection connection = DriverManager.getConnection(jdbcUrl, username, password)) {
                    // Thực hiện truy vấn SQL để lưu trữ đường dẫn hình ảnh
                    String sql = " Update RequiredOrder set imgTracking = ? where idRequiredOrder = 6";
                    try (PreparedStatement statement = connection.prepareStatement(sql)) {
                        statement.setString(1, imageUrl);
                        statement.executeUpdate();
                        System.out.println("Image URL saved to SQL Server.");
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        } else {
            System.out.println("");
        }

        response.sendRedirect(
                "index.jsp");
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
