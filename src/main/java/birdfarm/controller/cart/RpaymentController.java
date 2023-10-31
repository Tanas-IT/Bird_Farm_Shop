/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package birdfarm.controller.cart;

import birdfarm.dao.OrderDAO;
import birdfarm.dao.OrderDetailDAO;
import birdfarm.dao.RequiredOrderDAO;
import birdfarm.dao.RequiredOrderDetailDAO;
import birdfarm.dao.UserDAO;
import birdfarm.dto.BirdDTO;
import birdfarm.dto.OrderDTO;
import birdfarm.dto.OrderDetailDTO;
import birdfarm.dto.ReceiverDTO;
import birdfarm.dto.RequiredOrderDTO;
import birdfarm.dto.UserDTO;
import birdfarm.shopping.Cart;
import birdfarm.shopping.RequiredCart;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.vnpay.common.ConfigForPairing;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;
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
public class RpaymentController extends HttpServlet {

    private static final String ERROR = "RcheckOut.jsp";
    private static final String SUCCESS_COD = "RequiredPaymentResultController";

    protected void processRequest(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String url = ERROR;
        try {
            HttpSession session = req.getSession();
            //Get idUser
            String idUser = req.getParameter("userID");
            //Get createDate
            Date currentDate = new Date();
            java.sql.Date createdDate = new java.sql.Date(currentDate.getTime());
            //Get status
            String status = "Đang xử lý";
            //Get note
            String note = req.getParameter("note");
            //Get total
            double total = Double.parseDouble(req.getParameter("total")); //Front End gui qua
            //Get receiverAddress
            String receiverAddress = req.getParameter("address");
            //Get receiverPhoneNumber
            String receiverPhoneNumber = req.getParameter("phone");
            //Get receiverName
            String receiverName = req.getParameter("fullname");
            //Get paymentId
            int paymentId = Integer.parseInt(req.getParameter("payType"));
            //Get isPay
            boolean isPay = false;
            //Get orderCode
            String orderCode = ConfigForPairing.getRandomNumber(8);
            //Get idBirdNest
            String idBirdNest = ConfigForPairing.getRandomNumber(8);

            //Email
            String email = req.getParameter("email");
            session.setAttribute("EMAIL", email);

           
            //Tao order
            RequiredOrderDAO dao = new RequiredOrderDAO();
            RequiredOrderDTO order = new RequiredOrderDTO(idUser, createdDate, status, total, 
                                                receiverAddress,receiverName, receiverPhoneNumber,paymentId, 
                                                isPay, idBirdNest,note,orderCode);
            int lastInsertID = dao.AddRequiredOrder(order);
            boolean checkInsert = false;
            //Tao orderdetails
            if (lastInsertID > 0) {
                RequiredCart cart = (RequiredCart) session.getAttribute("RCART");
                RequiredOrderDetailDAO oddao = new RequiredOrderDetailDAO();
                double totalFee = 0;
                for(BirdDTO product : cart.getRcart().values()) {
                    if(product.getGender().equals("Trống")) {
                        totalFee += product.getFeeBirdNestMale();
                    }
                    if(product.getGender().equals("Mái")) {
                        totalFee += product.getFeeBirdNestFemale();
                    }
                }
                if (cart != null) {
                    checkInsert = oddao.insert(lastInsertID, idBirdNest, totalFee);
                    for (BirdDTO product : cart.getRcart().values()) {
                        if (product.getGender().equalsIgnoreCase("Trống")) {
                            oddao.updateIdBirdFather(product.getIdBird(),lastInsertID);
                            oddao.updateIsPairing(product.getIdBird());
                        } else if (product.getGender().equalsIgnoreCase("Mái")) {
                            oddao.updateIdBirdMother(product.getIdBird(),lastInsertID);
                             oddao.updateIsPairing(product.getIdBird());
                        }
                    }
                    oddao.createBirdNest(idBirdNest);
                }
            }
            //Luu vo session
            session.setAttribute("ORDER", order);
            UserDAO userDAO = new UserDAO();
            session.setAttribute("user", userDAO.getUser(idUser));
            //Xu ly thanh toan
            if (paymentId == 2) {
                long price = (long) total;
                url = vnpay_Pay(orderCode, price, req, resp);
            }
            if (paymentId == 1) {
                url = SUCCESS_COD;
            }

        } catch (Exception e) {
            log("Error at PaymentController: " + e.toString());
        } finally {
            resp.sendRedirect(url);
        }

    }

    private String vnpay_Pay(String orderCode, long price, HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String vnp_Version = "2.1.0";
        String vnp_Command = "pay";
//        String orderType = req.getParameter("ordertype");
        String orderType = "110000";
        long amount = price * 100;
//        String bankCode = req.getParameter("bankCode");
        String bankCode = "NCB";

//        String vnp_TxnRef = Config.getRandomNumber(8);
        String vnp_TxnRef = orderCode;
        String vnp_IpAddr = ConfigForPairing.getIpAddress(req);
        String vnp_TmnCode = ConfigForPairing.vnp_TmnCode;

        Map<String, String> vnp_Params = new HashMap<>();
        vnp_Params.put("vnp_Version", vnp_Version);
        vnp_Params.put("vnp_Command", vnp_Command);
        vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
        vnp_Params.put("vnp_Amount", String.valueOf(amount));
        vnp_Params.put("vnp_CurrCode", "VND");

        if (bankCode != null && !bankCode.isEmpty()) {
            vnp_Params.put("vnp_BankCode", bankCode);
        }
        vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
        vnp_Params.put("vnp_OrderInfo", "Thanh toán đơn hàng: " + vnp_TxnRef + "; Phuong thuc thanh toan VNPAY");
        vnp_Params.put("vnp_OrderType", orderType);

//        String locate = req.getParameter("language");
        String locate = "vn";
        if (locate != null && !locate.isEmpty()) {
            vnp_Params.put("vnp_Locale", locate);
        } else {
            vnp_Params.put("vnp_Locale", "vn");
        }
        vnp_Params.put("vnp_ReturnUrl", ConfigForPairing.vnp_Returnurl);
        vnp_Params.put("vnp_IpAddr", vnp_IpAddr);

        Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        String vnp_CreateDate = formatter.format(cld.getTime());
        vnp_Params.put("vnp_CreateDate", vnp_CreateDate);

        cld.add(Calendar.MINUTE, 15);
        String vnp_ExpireDate = formatter.format(cld.getTime());
        vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);

        List fieldNames = new ArrayList(vnp_Params.keySet());
        Collections.sort(fieldNames);
        StringBuilder hashData = new StringBuilder();
        StringBuilder query = new StringBuilder();
        Iterator itr = fieldNames.iterator();
        while (itr.hasNext()) {
            String fieldName = (String) itr.next();
            String fieldValue = (String) vnp_Params.get(fieldName);
            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                //Build hash data
                hashData.append(fieldName);
                hashData.append('=');
                hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                //Build query
                query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
                query.append('=');
                query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                if (itr.hasNext()) {
                    query.append('&');
                    hashData.append('&');
                }
            }
        }
        String queryUrl = query.toString();
        String vnp_SecureHash = ConfigForPairing.hmacSHA512(ConfigForPairing.vnp_HashSecret, hashData.toString());
        queryUrl += "&vnp_SecureHash=" + vnp_SecureHash;
        String paymentUrl = ConfigForPairing.vnp_PayUrl + "?" + queryUrl;
        com.google.gson.JsonObject job = new JsonObject();
        job.addProperty("code", "00");
        job.addProperty("message", "success");
        job.addProperty("data", paymentUrl);
        Gson gson = new Gson();
        resp.getWriter().write(gson.toJson(job));
        return paymentUrl;
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
