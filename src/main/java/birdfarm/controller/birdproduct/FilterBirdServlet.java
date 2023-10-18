/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package birdfarm.controller.birdproduct;

import birdfarm.controller.birdcomparator.BirdPriceAscendingComparator;
import birdfarm.controller.birdcomparator.BirdPriceDescendingComparator;
import birdfarm.dao.BirdDAO;
import birdfarm.dao.UserDAO;
import birdfarm.dto.BirdDTO;
import birdfarm.dto.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Collections;
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
@WebServlet(name = "FilterBirdServlet", urlPatterns = {"/FilterBirdServlet"})
public class FilterBirdServlet extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        try {
            String selectItemPrice = request.getParameter("selectItemPrice");
            String selectItemSpecies = request.getParameter("selectItemSpecies");
            String selectItemGender = request.getParameter("selectItemGender");
            String selectItemPeriod = request.getParameter("selectItemPeriod");
            String selectItemCategory = request.getParameter("selectItemCategory");
            String userID = request.getParameter("userID");
            BirdDAO birdDAO = new BirdDAO();
            birdDAO.getAllBird();
            UserDAO userDAO = new UserDAO();
            UserDTO user = userDAO.getUser(userID);
            List<BirdDTO> listBirds = birdDAO.getBirdList();
            List<BirdDTO> filterBirdList = new ArrayList<>();
            for (BirdDTO bird : listBirds) {
                boolean meetsConditions = true;

                if (!selectItemSpecies.equals("0") && !bird.getBirdSpecies().equals(selectItemSpecies)) {
                    meetsConditions = false;
                }
                if (!selectItemGender.equals("0") && bird.getType() != 1 && !bird.getGender().equals(selectItemGender)) {
                    meetsConditions = false;
                }
                if (!selectItemPeriod.equals("0") && !bird.getPeriod().equals(selectItemPeriod)) {
                    meetsConditions = false;
                }
                if (!selectItemCategory.equals("") && bird.getType() != Integer.parseInt(selectItemCategory)) {
                    meetsConditions = false;
                }

                if (meetsConditions) {
                    filterBirdList.add(bird);
                }
            }
            if (selectItemPrice.equals("Từ thấp đến cao")) {
                BirdPriceAscendingComparator birdAscCompare = new BirdPriceAscendingComparator();
                Collections.sort(filterBirdList, birdAscCompare);
            }
            if (selectItemPrice.equals("Từ cao đến thấp")) {
                BirdPriceDescendingComparator birdDescCompare = new BirdPriceDescendingComparator();
                Collections.sort(filterBirdList, birdDescCompare);
            }
            if(user == null) {
            if (filterBirdList.size() > 0) {
                out.println("<div class=\"row-item row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-5 justify-content-center align-items-center w-100\">\n");
                for (BirdDTO bird : filterBirdList) {
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
                            + "        <div class=\"btn-add\"><a class=\"btn-addCart btn-item btn btn-outline-dark mt-auto\" href=\"Login.jsp\">Mua ngay</a></div>\n"
                            + "              <div><a class=\"btn-viewMore btn-item btn btn-outline-dark mt-auto\" href=\"DispatchServlet?btAction=View More&id=" + bird.getIdBird() +"\">Xem thêm</a></div>\n"
                            + "         </div>\n"
                            + "   </div>\n"
                            + "   </div>");
                }
                out.println("</div>");
            } else {
                out.println("<img style='width: 100px;display: inline-block;position: relative;left: 45%;transform: translate(-330px, 76%);' alt='Not found' src='img/oops.png'/>"
                        + "<h3 style='color:red; text-align: center'>Không có chim nào thỏa điều kiện trong cửa hàng</h3>");
            }}
            if(user != null) {
                if (filterBirdList.size() > 0) {
                out.println("<div class=\"row-item row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-5 justify-content-center align-items-center w-100\">\n");
                for (BirdDTO bird : filterBirdList) {
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
            } else {
                out.println("<img style='width: 100px;display: inline-block;position: relative;left: 45%;transform: translate(-330px, 76%);' alt='Not found' src='img/oops.png'/>"
                        + "<h3 style='color:red; text-align: center'>Không có chim nào thỏa điều kiện trong cửa hàng</h3>");
                }
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
