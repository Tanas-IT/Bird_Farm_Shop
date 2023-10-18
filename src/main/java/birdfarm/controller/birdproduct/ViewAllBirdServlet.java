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
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.List;
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
@WebServlet(name = "ViewAllBirdServlet", urlPatterns = {"/ViewAllBirdServlet"})
public class ViewAllBirdServlet extends HttpServlet {

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
        String idType = request.getParameter("idType");
        String userID = request.getParameter("userID");
        String title = "Chim";
        if(idType.equals("0")) {
            title = "Chim Phổ Thông";
        } else if(idType.equals("1")) {
            title = "Tổ Chim";
        } else if(idType.equals("2")) {
            title = "Chim Cao Cấp";
        } else if(idType.equals("3")) {
            title = "Bán Chạy Nhất";
        } else if(idType.equals("4")) {
            title = "Chim Giống";
        }
        try (PrintWriter out = response.getWriter()) {
            UserDAO userDAO = new UserDAO();
            UserDTO user = userDAO.getUser(userID);
            BirdDAO birdDAO = new BirdDAO();
            birdDAO.getBirdByType(idType);
            List<BirdDTO> birdList = birdDAO.getBirdViewAllTypeList();
            if(user == null) {
            out.println("<span style='font-size: 2.5rem; font-weight: 500; line-height: 1.2; margin-top:0;color:red; text-align: center; margin-bottom: 15px;display: inline-block;position: relative;left: 50%;transform: translateX(-50%);'>"+ title +"</span>");
            out.print("<button class=\"bg-white\" onclick=\"resetInterface()\" style=\"border: none;color: #7DB32B; text-decoration: none; font-size: 20px; font-weight: bold; position: absolute;right: 2%;margin-top:10px;\">Thu gọn<i class=\"fa-solid fa-arrow-right\" style=\"color: #7db32b; margin-left: 10px\"></i></button>");
            out.println("<div class=\"row-item row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-5 justify-content-center align-items-center w-100\">\n");
            for(BirdDTO bird : birdList) {
                out.println("<div  id=\""+bird.getIdBird()+"\" class=\"col mb-5\">\n"
                    + "                        <div style=\"overflow: hidden; max-height: 100%;\" class=\"card h-100\">\n"
                    + "                            <!-- Product image-->\n"
                    + "                            <img id=\"img-"+bird.getIdBird() +"\" style=\"width: 100%; height: 300px; background-size: cover; border-top-left-radius: 3px; border-top-right-radius: 3px\" class=\"card-img-top\" src=\""+bird.getImageURL()+"\" alt=\""+bird.getName()+"\" />\n"
                    + "                            <!-- Product details-->\n"
                    + "                            <div class=\"card-body p-2\">\n"
                    + "                                <div class=\"text-center\">\n"
                    + "                                    <!-- Product name-->\n"
                    + "                                    <h6 id=\"name-"+bird.getIdBird() +"\" class=\"text-center fw-bolder\">"+bird.getName()+"</h6>\n"
                    + "                                    <!-- Product reviews-->\n"
                    + "                                    <div style=\"font-size: 16px; color:#bb9d05;\" class=\"d-flex justify-content-center mb-2\">\n"
                    + "                                        Giới tính: "+bird.getGender() +"\n"
                    + "                                    </div>\n"
                    + "\n");
            if(bird.isMutation()) { 
                out.println("<div class=\"d-flex justify-content-center text-black mb-2\">\n"
                    + "Đột biến: Có \n"
                    + "</div>\n");
            }
            out.println("<div class=\"d-flex justify-content-center text-warning mb-2\">\n"
                    + "       <div class=\"bi-star-fill\"></div>\n"
                    + "       <div class=\"bi-star-fill\"></div>\n"
                    + "       <div class=\"bi-star-fill\"></div>\n"
                    + "       <div class=\"bi-star-fill\"></div>\n"
                    + "       <div class=\"bi-star-fill\"></div>\n"
                    + "  </div>\n"
                    + "  <!-- Product price-->\n"
                    + "  \n");
            DecimalFormat decimalFormat = new DecimalFormat("###,###");
            String formattedNumber = decimalFormat.format(bird.getSalePrice());
            out.println(
                    " <h6 style=\"color:red;\">Giá:"+ formattedNumber +"VND"+"</h6>\n"
                    + "  </div>\n"
                    + "  </div>\n"
                    + "  <!-- Product actions-->\n"
                    + "   <div class=\"product-actions justify-content-between card-footer p-4 pb-2 pt-0 border-top-0 bg-transparent\">\n"
                    + "        <div class=\"btn-add\"><a class=\"btn-addCart btn-item btn btn-outline-dark mt-auto\" href=\"Login.jsp\">Mua ngay</a></div>\n"
                    + "              <div><a class=\"btn-viewMore btn-item btn btn-outline-dark mt-auto\" href=\"DispatchServlet?btAction=View More&id="+bird.getIdBird()+"\">Xem thêm</a></div>\n"
                    + "         </div>\n"
                    + "         <a href=\"#\" id=\"btn-compare_"+bird.getIdBird()+"\" class=\"text-decoration-none btn-compare text-primary\" onclick=\"compare('"+bird.getIdBird()+"', '"+bird.getType()+"')\">\n"
                    + "              <i class=\"text-primary bi bi-plus-circle\"></i>\n"
                    + "                  So sánh\n"
                    + "         </a>\n"
                    + "   </div>\n"
                    + "   </div>");
            }
            out.println("</div>");
            }
            if(user != null) {
                out.println("<span style='font-size: 2.5rem; font-weight: 500; line-height: 1.2; margin-top:0;color:red; text-align: center; margin-bottom: 15px;display: inline-block;position: relative;left: 50%;transform: translateX(-50%);'>"+ title +"</span>");
                out.print("<button class=\"bg-white\" onclick=\"resetInterface()\" style=\"border: none;color: #7DB32B; text-decoration: none; font-size: 20px; font-weight: bold; position: absolute;right: 2%;margin-top:10px;\">Thu gọn<i class=\"fa-solid fa-arrow-right\" style=\"color: #7db32b; margin-left: 10px\"></i></button>");
                out.println("<div class=\"row-item row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-5 justify-content-center align-items-center w-100\">\n");
                for (BirdDTO bird : birdList) {
                    out.println("<div  id=\"" + bird.getIdBird() + "\" class=\"bird-product col mb-5\">\n"
                            + "                        <div style=\"overflow: hidden; max-height: 100%;\" class=\"card h-100\">\n"
                            + "                            <!-- Product image-->\n"
                            + "                            <img id=\"img-" + bird.getIdBird() + "\" style=\"width: 100%; height: 300px; background-size: cover; border-top-left-radius: 3px; border-top-right-radius: 3px\" class=\"card-img-top\" src=\"" + bird.getImageURL() + "\" alt=\"" + bird.getName() + "\" />\n"
                            + "                            <!-- Product details-->\n"
                            + "                            <div class=\"card-body p-2\">\n"
                            + "                                <div class=\"text-center\">\n"
                            + "                                    <!-- Product name-->\n"
                            + "                                    <h6 id=\"name-" + bird.getIdBird() + "\" class=\"text-center fw-bolder\">" + bird.getName() + "</h6>\n"
                    );
                    if(bird.getType() != 1) {  
                        out.println("<div style=\"font-size: 16px; color:#bb9d05;\" class=\"d-flex justify-content-center mb-2\">\n"
                            + " Giới tính: " + bird.getGender() + "\n"
                            + " </div>\n"
                            + "\n");
                    }
                    if (bird.isMutation()) {
                        out.println("<div class=\"d-flex justify-content-center text-black mb-2\">\n"
                                + "Đột biến: Có \n"
                                + "</div>\n");
                    }
                    out.println("<div class=\"d-flex justify-content-center text-warning mb-2\">\n"
                            + "       <div class=\"bi-star-fill\"></div>\n"
                            + "       <div class=\"bi-star-fill\"></div>\n"
                            + "       <div class=\"bi-star-fill\"></div>\n"
                            + "       <div class=\"bi-star-fill\"></div>\n"
                            + "       <div class=\"bi-star-fill\"></div>\n"
                            + "  </div>\n"
                            + "  <!-- Product price-->\n"
                            + "  \n");
                    DecimalFormat decimalFormat = new DecimalFormat("###,###");
                    String formattedNumber = decimalFormat.format(bird.getSalePrice());
                    out.println(
                            " <h6 style=\"color:red;\">Giá:" + formattedNumber + "VND" + "</h6>\n"
                            + "  </div>\n"
                            + "  </div>\n"
                            + "  <!-- Product actions-->\n"
                            + "   <div class=\"product-actions justify-content-between card-footer p-4 pb-2 pt-0 border-top-0 bg-transparent\">\n"
                            + "    <div class=\"btn-add\">"
                            +  " <form action=\"DispatchServlet\">\n" +
                                "      <input type=\"hidden\" name=\"userID\" value=\"" +user.getIdUser().trim() + "\" />\n" +
                                "      <input type=\"hidden\" name=\"birdID\" value=\"" +  bird.getIdBird() + "\"/>\n" +
                                "      <input type=\"hidden\" name=\"birdName\" value=\""+ bird.getName() +"\" />\n" +
                                "      <input type=\"hidden\" name=\"birdQuantity\" value=\"" + bird.getQuantity() +"\" />\n" +
                                "      <input type=\"hidden\" name=\"birdPrice\" value=\"" + bird.getSalePrice() +"\" />\n" +
                                "      <input type=\"hidden\" name=\"birdImage\" value=\"" + bird.getImageURL()+"\" />\n" +
                                "      <input type=\"submit\" name=\"btAction\" value = \"Mua ngay\" class=\"btn-addCart btn-item btn btn-outline-dark mt-auto\"/>\n" +
                                "</form>\n" 
                            + "</div>"
                            + "              <div><a class=\"btn-viewMore btn-item btn btn-outline-dark mt-auto\" href=\"DispatchServlet?btAction=View More&id=" + bird.getIdBird() + "&userID=" + user.getIdUser()+"\">Xem thêm</a></div>\n"
                            + "         </div>\n"
                            + "   </div>\n"
                            + "   </div>");
                }
                out.println("</div>");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (NamingException ex) {
           ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } finally {
            
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
