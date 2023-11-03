/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package birdfarm.controller.manager;

import birdfarm.dao.DateDAO;
import birdfarm.dao.ManagerOrderDAO;
import birdfarm.dao.ManagerProductDAO;
import birdfarm.dao.ManagerTrackingBirdDAO;
import birdfarm.dto.Chart;
import birdfarm.dto.DateDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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
 * @author HP
 */
@WebServlet(name = "ManagerDashBoardServlet", urlPatterns = {"/ManagerDashBoardServlet"})
public class ManagerDashBoardServlet extends HttpServlet {

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
            throws ServletException, IOException, NamingException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        ManagerProductDAO pd = new ManagerProductDAO();
//        CustomerDAO cd = new CustomerDAO();
//        FeedbackDAO fd = new FeedbackDAO();
//        CategoryDAO ctd = new CategoryDAO();
        ManagerOrderDAO od = new ManagerOrderDAO();
        ManagerTrackingBirdDAO ot = new ManagerTrackingBirdDAO();

        DateDAO dd = new DateDAO();

        DateDTO date = dd.get7day();
        String salerId = "!= -1";
        String start = date.getStart().toString();
        String end = date.getEnd().toString();
        String start_raw = request.getParameter("start");
        String end_raw = request.getParameter("end");
        if (start_raw != null) {
            start = start_raw;
            end = end_raw;
        }

        int day = dd.CountDayByStartEnd(start, end);
//Dem so luong chim trong data
        int totalProduct = pd.getTotalProduct();
        int totalProduct0 = pd.getTotalProduct(0);
        int totalProduct1 = pd.getTotalProduct(1);
        int totalProduct2 = pd.getTotalProduct(2);
        int totalProduct3 = pd.getTotalProduct(3);
        int totalProduct4 = pd.getTotalProduct(4);

        //Tong tien Order thu duoc
        List<Chart> listChartRevenueArea = od.totalMoneyOrder(salerId, start, day);
        double maxListChartRevenueArea = -1;
        for (Chart o : listChartRevenueArea) {
            if (o.getValue() > maxListChartRevenueArea) {
                maxListChartRevenueArea = o.getValue();
            }
        }
        maxListChartRevenueArea = (maxListChartRevenueArea / 1000000 + 1) * 1000000;

        // set chart customer
        List<Chart> listOrder = od.getTotalOrder(start, day);

        int maxListOrderArea = -1;
        for (Chart o : listOrder) {
            if (o.getValue() > maxListOrderArea) {
                maxListOrderArea = o.getValue();
            }
        }
        maxListOrderArea = (maxListOrderArea / 10 + 1) * 10;

        List<Chart> totalMoneyRequiredOrder = ot.totalMoneyRequiredOrder(salerId, start, day);
        double maxListTotalMoneyReuiredOrder = -1;
        for (Chart o : totalMoneyRequiredOrder) {
            if (o.getValue() > maxListTotalMoneyReuiredOrder) {
                maxListTotalMoneyReuiredOrder = o.getValue();
            }
        }
        maxListTotalMoneyReuiredOrder = (maxListTotalMoneyReuiredOrder / 1000000 + 1) * 1000000;
//        
//        // set chart avg rated

        request.setAttribute("totalProduct", totalProduct);
        request.setAttribute("totalProduct0", totalProduct0);
        request.setAttribute("totalProduct1", totalProduct1);
        request.setAttribute("totalProduct2", totalProduct2);
        request.setAttribute("totalProduct3", totalProduct3);
        request.setAttribute("totalProduct4", totalProduct4);

//        request.setAttribute("listCategoryProduct", listCategoryProduct);
//        
        request.setAttribute("listChartRevenueArea", listChartRevenueArea);
        request.setAttribute("maxListChartRevenueArea", maxListChartRevenueArea);
//        
        request.setAttribute("listOrder", listOrder);
        request.setAttribute("maxListOrderArea", maxListOrderArea);
//        
        request.setAttribute("totalMoneyRequiredOrder", totalMoneyRequiredOrder);
        request.setAttribute("maxListTotalMoneyReuiredOrder", maxListTotalMoneyReuiredOrder);

//        request.setAttribute("listChartAvgStar", listChartAvgStar);
        request.setAttribute("start", start);
        request.setAttribute("end", end);
        request.getRequestDispatcher("Manager_Chart.jsp").forward(request, response);
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
        } catch (NamingException ex) {
            Logger.getLogger(ManagerDashBoardServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ManagerDashBoardServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ManagerDashBoardServlet.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (NamingException ex) {
            Logger.getLogger(ManagerDashBoardServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ManagerDashBoardServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ManagerDashBoardServlet.class.getName()).log(Level.SEVERE, null, ex);
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
