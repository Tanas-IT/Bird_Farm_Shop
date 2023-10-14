/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author 1005h
 */
public class MainController extends HttpServlet {
    private static final String NULL_PAGE="404.html";
    
    private static final String LOGIN_PAGE="login.html";
    
    private static final String LOGIN="Login";
    private static final String LOGIN_CONTROLLER="LoginController";
    private static final String SEARCH="Search";
    private static final String SEARCH_CONTROLLER="SearchController";
    private static final String DELETE="Delete";
    private static final String DELETE_CONTROLLER="DeleteController";
    private static final String UPDATE="Update";
    private static final String UPDATE_CONTROLLER="UpdateController";
    private static final String CREATE_PAGE="CreatePage";
    private static final String CREATE_PAGE_VIEW="create.html";
    private static final String CREATE="Create";
    private static final String CREATE_CONTROLLER="CreateController";
    private static final String LOGOUT="Logout";
    private static final String LOGOUT_CONTROLLER="LogoutController";
    private static final String SHOPPING_PAGE="ShoppingPage";
    private static final String SHOPPING_PAGE_VIEW="ShoppingController";
    private static final String ADD="Add";
    private static final String ADD_CONTROLLER="AddController";
    private static final String VIEW="View";
    private static final String VIEW_PAGE="viewCart.jsp";
    private static final String REMOVE="Remove";
    private static final String REMOVE_CONTROLLER="RemoveController";
    private static final String EDIT="Edit";
    private static final String EDIT_CONTROLLER="EditController";
    private static final String LOGIN_GOOGLE="LoginGoogle";
    private static final String LOGIN_GOOGLE_CONTROLLER="LoginGoogleController";
    private static final String CHECKOUT="CheckOut";
    private static final String CHECKOUT_CONTROLLER="CheckoutController";
    private static final String PAYMENT="Payment";
    private static final String PAYMENT_CONTROLLER="PaymentController";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = LOGIN_PAGE;
        try {
            String action =  request.getParameter("action");
            if (action==null) {
                url = LOGIN_PAGE;
            } else if (LOGIN.equals(action)){
                url = LOGIN_CONTROLLER;
            } else if (SEARCH.equals(action)){
                url = SEARCH_CONTROLLER;
            } else if (DELETE.equals(action)) {
                url = DELETE_CONTROLLER;
            } else if (UPDATE.equals(action)) {
                url = UPDATE_CONTROLLER;
            } else if (CREATE_PAGE.equals(action)) {
                url = CREATE_PAGE_VIEW; 
            } else if (CREATE.equals(action)) {
                url = CREATE_CONTROLLER;
            } else if (LOGOUT.equals(action)) {
                url = LOGOUT_CONTROLLER;
            } else if (SHOPPING_PAGE.equals(action)) {
                url = SHOPPING_PAGE_VIEW;
            } else if (ADD.equals(action)) {
                url = ADD_CONTROLLER;
            } else if (VIEW.equals(action)) {
                url = VIEW_PAGE;
            } else if (REMOVE.equals(action)) {
                url = REMOVE_CONTROLLER;
            } else if (EDIT.equals(action)) {
                url = EDIT_CONTROLLER;
            } else if (LOGIN_GOOGLE.equals(action)) {
                url = LOGIN_GOOGLE_CONTROLLER;
            } else if (CHECKOUT.equals(action)) {
                url = CHECKOUT_CONTROLLER;
            } else if (PAYMENT.equals(action)) {
                url = PAYMENT_CONTROLLER;
            } else {
                url = NULL_PAGE;
            }
        } catch (Exception e) {
            log("Error at MainController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
