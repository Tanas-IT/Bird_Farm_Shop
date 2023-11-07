/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package birdfarm.controller.cart;

import birdfarm.dao.RequiredOrderDetailDAO;
import birdfarm.dto.RequiredOrderDetailDTO;
import com.sun.javafx.scene.control.skin.VirtualFlow;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "HistoryPairingController", urlPatterns = {"/HistoryPairingController"})
public class HistoryPairingController extends HttpServlet {

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
        HttpSession session = request.getSession();
            String idOrder = (String) request.getAttribute("idOrder");
            String orderId_raw = request.getParameter("idOrder");
            int orderId = 0;
            if(idOrder != null) {
                orderId = Integer.parseInt(idOrder);
            } else {
                orderId = Integer.parseInt(orderId_raw);
            }
        try{
            RequiredOrderDetailDAO requiredDAO = new RequiredOrderDetailDAO();
            requiredDAO.getTrackingBird(orderId);
            List<RequiredOrderDetailDTO> requiredOrder_Detail = requiredDAO.getListTracking();
            Map<String, List<RequiredOrderDetailDTO>> listFilter = new HashMap<>();
            for(RequiredOrderDetailDTO rod : requiredOrder_Detail) {
                if(!listFilter.containsKey(rod.getTrackingDate())) {
                    listFilter.put(rod.getTrackingDate(),new ArrayList<RequiredOrderDetailDTO>());
                } 
                listFilter.get(rod.getTrackingDate()).add(rod);
            }
            request.setAttribute("Order_Detail", listFilter);
        } catch (SQLException ex) {
           ex.printStackTrace();
        } finally {
            session.setAttribute("RequiredOrderID", orderId);
            request.getRequestDispatcher("TrackingPairing.jsp").forward(request, response);
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
