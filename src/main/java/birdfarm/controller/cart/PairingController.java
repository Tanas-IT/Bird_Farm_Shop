/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package birdfarm.controller.birdproduct;

import birdfarm.dao.BirdDAO;
import birdfarm.dto.BirdDTO;
import birdfarm.dto.RequiredOrderDetailDTO;
import birdfarm.shopping.RequiredCart;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Minh
 */
@WebServlet(name = "PairingController", urlPatterns = {"/PairingController"})
public class PairingController extends HttpServlet {

    private static final String SUCCESS = "pairing.jsp";
    private static final String ERROR = "pairing.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            String action = (String) request.getAttribute("action");

            session.removeAttribute("RCART");
            session.setAttribute("RquantityOfCart", 0);
            session.removeAttribute("Rtotal");
            if (!action.equals("Đổi chim giống khác")) {

            } else {
                RequiredCart quantityCart = (RequiredCart) session.getAttribute("RCART");
                session.setAttribute("RquantityOfCart", quantityCart.getRcart().size());
            }
            String userID = request.getParameter("userID");
            BirdDAO dao = new BirdDAO();
            List<BirdDTO> fList = dao.getListFemale();
            List<BirdDTO> mList = dao.getListMale();
            if (!fList.isEmpty() || !mList.isEmpty()) {
                session.setAttribute("LIST_M", mList);
                session.setAttribute("LIST_F", fList);
                session.setAttribute("userID", userID);
                url = SUCCESS;
            } else {
                request.setAttribute("ERROR", "List is empty!");
            }
        } catch (Exception e) {
            log("Error at Shopping Controller: " + e.toString());
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
