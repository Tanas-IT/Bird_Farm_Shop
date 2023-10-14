///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package sample.controller;
//
//import com.google.gson.Gson;
//import com.google.gson.JsonObject;
//import java.io.IOException;
//import java.io.PrintWriter;
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//import org.apache.http.client.ClientProtocolException;
//import org.apache.http.client.fluent.Form;
//import org.apache.http.client.fluent.Request;
//import sample.loginGoogle.Constants;
//import sample.loginGoogle.GoogleUserDTO;
//import sample.user.UserDAO;
//import sample.user.UserDTO;
//
///**
// *
// * @author 1005h
// */
//public class LoginGoogleController extends HttpServlet {
//    
//    private static final String LOGIN_PAGE = "login.jsp";
//    private static final String US = "US";
//    private static final String USER_PAGE = "user.jsp";
//    private static final String AD = "AD";
//    private static final String ADMIN_PAGE = "admin.jsp";
//    
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        String url = LOGIN_PAGE;
//        try {
//            String code = request.getParameter("code");
//            String accessToken = getToken(code);
//            GoogleUserDTO user = getUserInfo(accessToken);
//            String googleId = user.getId();
//            String email = user.getEmail();
//            UserDAO dao = new UserDAO();
//            
//            UserDTO loginGoogleUser = dao.checkLoginGoogle(email, googleId);
//            
//            if(loginGoogleUser == null){
//                String tmp[] = user.getEmail().split("@");
//                String userID = tmp[0];
//                String fullName = user.getName();
//                String password = "123iausgfkjzxbfieryqoqwlkkzdfn883401";
//                String roleID = "US";
//                UserDTO newUser = new UserDTO(userID, fullName, email, roleID, password, googleId);
//                dao.checkInsertGoogle(newUser);
//                HttpSession session = request.getSession();
//                session.setAttribute("LOGIN_USER", newUser);
//                url = USER_PAGE;
//                
//            } else {
//                HttpSession session = request.getSession();
//                session.setAttribute("LOGIN_USER", loginGoogleUser);
//                String roleID = loginGoogleUser.getRoleID();
//                if(AD.equals(roleID)){
//                    url = ADMIN_PAGE;
//                } else if(US.equals(roleID)){
//                    url = USER_PAGE;
//                } else {
//                    request.setAttribute("ERROR", "Your role is not support!");
//                    url = LOGIN_PAGE;
//                }
//            }
//        } catch (Exception e) {
//            log("Error at LoginGoogleController: " + e.toString());
//        } finally {
//            response.sendRedirect(url);
//        }
//    }
//    
//    public static String getToken(String code) throws ClientProtocolException, IOException {
//            // call api to get token
//        String response = Request.Post(Constants.GOOGLE_LINK_GET_TOKEN)
//                        .bodyForm(Form.form().add("client_id", Constants.GOOGLE_CLIENT_ID)
//                                        .add("client_secret", Constants.GOOGLE_CLIENT_SECRET)
//                                        .add("redirect_uri", Constants.GOOGLE_REDIRECT_URI).add("code", code)
//                                        .add("grant_type", Constants.GOOGLE_GRANT_TYPE).build())
//                        .execute().returnContent().asString();
//
//        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
//        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
//        return accessToken;
//    }
//
//    public static GoogleUserDTO getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
//        String link = Constants.GOOGLE_LINK_GET_USER_INFO + accessToken;
//        String response = Request.Get(link).execute().returnContent().asString();
//
//        GoogleUserDTO googlePojo = new Gson().fromJson(response, GoogleUserDTO.class);
//
//        return googlePojo;
//    }
//        
//    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
//    /**
//     * Handles the HTTP <code>GET</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
//
//    /**
//     * Handles the HTTP <code>POST</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
//
//    /**
//     * Returns a short description of the servlet.
//     *
//     * @return a String containing servlet description
//     */
//    @Override
//    public String getServletInfo() {
//        return "Short description";
//    }// </editor-fold>
//}
