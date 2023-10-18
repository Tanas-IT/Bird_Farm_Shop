/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package birdfarm.controller.googlelogin;

import birdfarm.dao.UserDAO;
import birdfarm.dto.CustomerDTO;
import birdfarm.dto.GoogleDTO;
import birdfarm.dto.UserDTO;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.sql.SQLException;
import java.util.UUID;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;

/**
 *
 * @author Admin
 */
@WebServlet(name = "LoginGoogleHandler", urlPatterns = {"/LoginGoogleHandler"})
public class LoginGoogleHandler extends HttpServlet {

    private final String RESULT_PAGE = "Register.jsp";
    private final String LOGIN_PAGE = "Login.jsp";
    private final String HOME_PAGE = "LoginServlet";
    

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
        String url = HOME_PAGE;
        String code = request.getParameter("code");
        try {
            if (code == null || code.isEmpty()) {
                RequestDispatcher dis = request.getRequestDispatcher("Login.jsp");
                dis.forward(request, response);
            } else {
                String accessToken = GoogleUtils.getToken(code);
                GoogleDTO userToken = GoogleUtils.getUserInfo(accessToken);
                String uniqueID = UUID.randomUUID().toString();
                String idUser = uniqueID.substring(0, 5).trim();
                String username = userToken.getEmail();
                String password = "123";
                String email = userToken.getEmail();
                String fullName = userToken.getGiven_name();
                String image = userToken.getPicture();
                UserDAO dao = new UserDAO();
                UserDTO checkAccount = dao.checkLogin(username, password);
                UserDTO currentUser = null;
                if(checkAccount == null) {
                    checkAccount = new UserDTO(idUser, username, password, fullName, 4, image);
                    CustomerDTO customer = new CustomerDTO(idUser, "TPHCM", password, email, image);
                    boolean result = dao.createAccount(checkAccount);
                    boolean customerResult = dao.createCustomerAccount(customer);
                    if (result && customerResult) {
                        currentUser = dao.getUser(idUser);
                        url = "LoginServlet?txtUsername="+currentUser.getUsername()+"&txtPassword="+currentUser.getPassword();
                    }
                }
                currentUser = dao.getUser(checkAccount.getIdUser());
                url = "LoginServlet?txtUsername="+currentUser.getUsername()+"&txtPassword="+currentUser.getPassword();
            }
        } catch (NamingException ex) {
            log("CreateNewAccount_naming" + ex.getMessage());
        } catch (SQLException ex) {
            log("CreateNewAccount_SQL" + ex.getMessage());
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
