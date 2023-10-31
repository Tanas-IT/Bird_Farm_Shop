/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package birdfarm.controller.cart;

import birdfarm.dao.BirdDAO;
import birdfarm.dao.UserDAO;
import birdfarm.dto.BirdDTO;
import birdfarm.dto.UserDTO;
import birdfarm.shopping.Cart;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
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
@WebServlet(name = "AddController", urlPatterns = {"/AddController"})
public class AddController extends HttpServlet {

    private final String BIRD_DETAIL_PAGE = "birdDetail.jsp";
    private final String BIRD_COMPARE_PAGE = "CompareBirdProductServlet";
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
        String url = BIRD_DETAIL_PAGE;
        String userID = request.getParameter("userID");
        String birdID = request.getParameter("birdID");
        String birdName = request.getParameter("birdName");
        int birdQuantity = Integer.parseInt(request.getParameter("birdQuantity"));
        HttpSession session = request.getSession();
        if (session != null) {
            Cart cart = (Cart) session.getAttribute("CART");
            if (cart == null) {
                cart = new Cart();
            }
            boolean flag = true;
            try {
                BirdDAO birdDAO = new BirdDAO();
                if (cart.getCart() != null) {
                    for (String key : cart.getCart().keySet()) {
                        if (key.equals(birdID)) {
                            cart.getCart().get(key).setQuantityOfUser(cart.getCart().get(key).getQuantityOfUser() + birdQuantity);
                            flag = false;
                            break;
                        }
                    }
                }
                boolean check = false;
                if (flag) {
                    BirdDTO bird = birdDAO.getBirdByID(birdID);
                    bird.setQuantityOfUser(birdQuantity);
                    check = cart.add(bird);
                }

                UserDAO userDAO = new UserDAO();
                UserDTO user = userDAO.getUser(userID);
                session.setAttribute("user", user);
                birdDAO.getAllBird();
                List<BirdDTO> listBird = birdDAO.getBirdList();
                ArrayList<String> subImageURLs;
                for (BirdDTO birdItem : listBird) {
                    if (birdItem.getIdBird().equals(birdID)) {
                        birdDAO.getSubImageByBirdID(birdItem.getIdBird());
                        subImageURLs = birdItem.getSubImageURL();
                        if (subImageURLs == null) {
                            subImageURLs = new ArrayList<>();
                            birdItem.setSubImageURL(subImageURLs);
                        }
                        subImageURLs.addAll(birdDAO.getBirdSubImageList());
                        birdItem.setFatherBird(birdDAO.getFatherAndMotherBird(birdItem.getIdFatherBird()));
                        birdItem.setMotherBird(birdDAO.getFatherAndMotherBird(birdItem.getIdMotherBird()));
                        break;
                    }
                }
                request.setAttribute("listBird", listBird);
                if (check) {
                    double total = 0;
                    session.setAttribute("CART", cart);
                    request.setAttribute("MESSAGE", "Thêm " + birdQuantity + " " + birdName + " vào giỏ hàng thành công!");
                    for (String key : cart.getCart().keySet()) {
                        double totalEach = cart.getCart().get(key).getQuantityOfUser() * cart.getCart().get(key).getSalePrice();
                        total += totalEach;
                    }
                    session.setAttribute("total", total);
                    session.setAttribute("quantityOfCart", cart.getCart().size());
                    session.setAttribute("idBird", birdID);
                }
                if (!check) {
                    request.setAttribute("MESSAGE", "Xin lỗi, số lượng chim bạn yêu cầu vượt quá số lượng hiện có trong trang trại.");
                }
                String button = request.getParameter("btAction");
                if(button.equals("Thêm vào giỏ hàng")) {
                    url = BIRD_COMPARE_PAGE;
                } else {
                    url = BIRD_DETAIL_PAGE;
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
