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
        private final String ADMIN_VIEW_PAYMENT_CONTROLLER = "AdminViewPaymentServlet";
        private final String MANAGER_VIEW_FEEDBACK_CONTROLLER = "ManagerViewFeedbackServlet";
        private final String BIRD_CONTROLLER = "BirdProductServlet";
        private final String VIEW_MORE_BIRD_CONTROLLER = "ViewMoreBirdServlet";
        private final String HOME_CONTROLLER = "HomeServlet";
        private final String LOGIN_PAGE = "";
        private final String LOGIN_CONTROLLER = "LoginServlet";
        private final String ADD_TO_CART_CONTROLLER = "AddController";
        private final String VIEW_CART_CONTROLLER = "ViewController";
        private final String COMPARE_BIRD_CONTROLLER = "CompareBirdProductServlet";
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
        String button = request.getParameter("btAction");//btAction phai duoc copy va paste vao trong servletlogin
        String url = BIRD_CONTROLLER;
        try {
            if (button == null) { //trigger welcome file
                url = BIRD_CONTROLLER;
            } else if (button.equals("AdminControlAccount")) {
                url = ADMIN_CONTROL_ACCOUNT_CONTROLLER;            
            } else if (button.equals("AdminViewProduct")){
                url = ADMIN_VIEW_PAYMENT_CONTROLLER;
            } else if (button.equals("ManagerViewFeedback")) {
                url = MANAGER_VIEW_FEEDBACK_CONTROLLER;
            }
            else if (button.equals("View More")) {
                url = VIEW_MORE_BIRD_CONTROLLER;
            } else if(button.equals("Home")) {
                url = HOME_CONTROLLER;
            } else if (button.equals("Login")) {
                url = LOGIN_CONTROLLER;
            } else if (button.equals("Mua ngay")) {
                url = ADD_TO_CART_CONTROLLER;
            } else if(button.equals("Thêm sản phẩm") || button.equals("Trang chủ")) {
                url =  BIRD_CONTROLLER;
            } else if(button.equals("Xem giỏ hàng")) {
                url = VIEW_CART_CONTROLLER;
            } else if(button.equals("So sánh ngay")) {
                url = COMPARE_BIRD_CONTROLLER;
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
