/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package birdfarm.dispatchservlet;

import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "DispatchServlet", urlPatterns = {"/DispatchServlet"})
public class DispatchServlet extends HttpServlet {

    private final String ADMIN_CONTROL_ACCOUNT_CONTROLLER = "AdminControlAccountServlet";
    private final String ADMIN_VIEW_PRODUCT_CONTROLLER = "AdminViewProductServlet";
    private final String ADMIN_UPDATE_ACCOUNT_CONTROLLER = "AdminUpdateAccountServlet";

    private final String MANAGER_VIEW_FEEDBACK_CONTROLLER = "ManagerViewFeedbackServlet";

    private final String MANAGER_VIEW_BILL_CONTROLLER = "ManagerViewBillServlet";
    private final String MANAGER_VIEW_DETAIL_BILL_CONTROLLER = "ManagerViewDetailBillServlet";

    private final String MANAGER_DASHBOARD_CONTROLLER = "ManagerDashBoardServlet";

    private final String MANAGER_VIEW_PRODUCT_CONTROLLER = "ManagerViewProductServlet";
    private final String MANAGER_UPDATE_PRODUCT_CONTROLLER = "ManagerUpdateProductServlet";
    private final String MANAGER_SHOW_UPDATE_PRODUCT_CONTROLLER = "ManagerShowUpdateProductServlet";
    private final String MANAGER_DELETE_PRODUCT_CONTROLLER = "ManagerDeleteProductServlet";

    private final String MANAGER_VIEW_ORDER_CONTROLLER = "ManagerViewOrderServlet";
    private final String MANAGER_VIEW_DETAIL_ORDER_CONTROLLER = "ManagerViewDetailOrderServlet";
    private final String MANAGER_ACCEPT_ORDER_CONTROLLER = "ManagerAcceptOrderServlet";
    private final String MANAGER_REJECT_ORDER_CONTROLLER = "ManagerRejectOrderServlet";

    private final String LOGIN_PAGE = "";

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

        //Which button did user click?
        String button = request.getParameter("btAction");//btaction phai duoc copy va paste vao trong servletlogin
        String url = LOGIN_PAGE;
        try {
            if (button == null) { //trigger welcome file
                //do nothing
            } else if (button.equals("AdminControlAccount")) {
                url = ADMIN_CONTROL_ACCOUNT_CONTROLLER;
            } else if (button.equals("AdminViewProduct")) {
                url = ADMIN_VIEW_PRODUCT_CONTROLLER;
            } else if (button.equals("Update")) {
                url = ADMIN_UPDATE_ACCOUNT_CONTROLLER;

            } else if (button.equals("ManagerViewFeedback")) {
                url = MANAGER_VIEW_FEEDBACK_CONTROLLER;
            } else if (button.equals("ManagerViewBill")) {
                url = MANAGER_VIEW_BILL_CONTROLLER;
            } else if (button.equals("ManagerViewProduct")) {
                url = MANAGER_VIEW_PRODUCT_CONTROLLER;
            } else if (button.equals("ManagerViewOrder")) {
                url = MANAGER_VIEW_ORDER_CONTROLLER;
                
            } else if (button.equals("AcceptOrder")) {
                url = MANAGER_ACCEPT_ORDER_CONTROLLER;
            } else if (button.equals("RejectOrder")) {
                url = MANAGER_REJECT_ORDER_CONTROLLER;
                
            } else if (button.equals("DetailBill")) {
                url = MANAGER_VIEW_DETAIL_BILL_CONTROLLER;
            } else if (button.equals("DetailOrder")) {
                url = MANAGER_VIEW_DETAIL_ORDER_CONTROLLER;
            } else if (button.equals("Check")) {
                url = MANAGER_DASHBOARD_CONTROLLER;
            } else if (button.equals("ViewUpdateProduct")) {
                url = MANAGER_SHOW_UPDATE_PRODUCT_CONTROLLER;
            } else if (button.equals("UpdateProduct")) {
                url = MANAGER_UPDATE_PRODUCT_CONTROLLER;
            } else if (button.equals("DeleteProduct")) {
                url = MANAGER_DELETE_PRODUCT_CONTROLLER;
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
