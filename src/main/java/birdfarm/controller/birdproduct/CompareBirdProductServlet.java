/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package birdfarm.controller.birdproduct;

import birdfarm.dao.BirdDAO;
import birdfarm.dto.BirdDTO;
import birdfarm.dto.UserDTO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
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
@WebServlet(name = "CompareBirdProductServlet", urlPatterns = {"/CompareBirdProductServlet"})
public class CompareBirdProductServlet extends HttpServlet {
    private final String COMPARE_PAGE = "sosanh.jsp";
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
        String url = COMPARE_PAGE;
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        String birdID1 = request.getParameter("birdID1");
        String birdID2 = request.getParameter("birdID2");
        UserDTO user = (UserDTO)session.getAttribute("user");
        
        try {
            BirdDAO birdDAO = new BirdDAO();
            BirdDTO bird1 = birdDAO.getBirdByID(birdID1);
            BirdDTO bird2 = birdDAO.getBirdByID(birdID2);
            bird1.setFatherBird(birdDAO.getBirdByID(bird1.getIdFatherBird()));
            bird1.setMotherBird(birdDAO.getBirdByID(bird1.getIdMotherBird()));
            bird2.setFatherBird(birdDAO.getBirdByID(bird2.getIdFatherBird()));
            bird2.setMotherBird(birdDAO.getBirdByID(bird2.getIdMotherBird()));
            if(bird1 != null && bird2 != null) {
                request.setAttribute("bird1", bird1);
                request.setAttribute("bird2", bird2);
            }
            if(user == null) {
                url = "sosanhguest.jsp";
            }
          
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (NamingException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
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
