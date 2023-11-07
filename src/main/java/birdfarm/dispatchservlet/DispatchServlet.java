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
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author HP
 */
@WebServlet(name = "DispatchServlet", urlPatterns = {"/DispatchServlet"})
@MultipartConfig
public class DispatchServlet extends HttpServlet {

    private final String ADMIN_CONTROL_ACCOUNT_CONTROLLER = "AdminControlAccountServlet";
    private final String ADMIN_VIEW_PAYMENT_CONTROLLER = "AdminViewPaymentServlet";
    private final String MANAGER_VIEW_FEEDBACK_CONTROLLER = "ManagerViewFeedbackServlet";
    private final String BIRD_CONTROLLER = "BirdProductServlet";
    private final String VIEW_MORE_BIRD_CONTROLLER = "ViewMoreBirdServlet";
    private final String HOME_CONTROLLER = "HomeServlet";
    private final String LOGIN_PAGE = "";
    private final String LOGIN_CONTROLLER = "LoginServlet";
    private final String REGISTER_CONTROLLER = "CreateAccountServlet";
    private final String ADD_CHECKOUT_CONTROLLER = "AddCheckoutController";
    private final String VIEW_CART_CONTROLLER = "ViewController";
    private final String COMPARE_BIRD_CONTROLLER = "CompareBirdProductServlet";
    private final String FILTER_CONTROLLER = "FilterBirdServlet";
    private final String ADD_TO_CART_CONTROLLER = "AddController";
    private final String CHECK_OUT_CONTROLLER = "CheckoutController";
    private final String PAYMENT_CONTROLLER = "PaymentController";
    private final String HISTORY_CONTROLLER = "MyOrderController";
    private final String HISTORY_DETAIL_CONTROLLER = "OrderDetailController";
    private final String ADD_RERQUIRED_CONTROLLER = "AddRequiredController";
    private final String VIEW_REQUIRED_CART_CONTROLLER = "ViewRequiredController";
    private final String CHECKOUT_REQUIRED_CONTROLLER = "CheckoutRequiredController";
    private final String RPAYMENT_CONTROLLER = "RpaymentController";
    private final String HISTORY_PAIRING_CONTROLLER = "HistoryPairingController";
    private final String REMOVE_ITEM_FROM_VIEW_CART = "RemoveItemFromViewCart";
    private final String REMOVE_ITEM_FROM_VIEW_REQUIRED_CART = "RemoveItemFromViewRequiredCart";
    private final String REMOVE_ITEM_PAIRING = "RemoveItemPairingFromCart";
    private final String HISTORY_VIEW_DETAIL_PAIRING_BILL = "PairingRequiredOrderDetailController";

    private final String PAIRING_CONTROLLER = "PairingController";
    private final String REMOVE_ITEM_FROM_CART = "RemoveItemFromCart";
    private final String FEEDBACK_CONTROLLER = "FeedbackServlet";
    private final String FEEDBACK_ORDER_CONTROLLER = "FeedbackOrderServlet";

    private final String SEND_MAIL_TRACKING = "ManagerSendMailTrackingBirdServlet";

    private final String ADMIN_UPDATE_ACCOUNT_CONTROLLER = "AdminUpdateAccountServlet";
     private final String ADMIN_DELETE_ACCOUNT_CONTROLLER = "AdminDeleteAccountServlet";
    private final String ADMIN_UPDATE_PAYMENT_CONTROLLER = "AdminUpdatePayment";
     private final String REGISTER_ADMIN_CONTROLLER = "CreateAccountAdminServlet";

    private final String MANAGER_VIEW_BILL_CONTROLLER = "ManagerViewBillServlet";
    private final String MANAGER_VIEW_DETAIL_BILL_CONTROLLER = "ManagerViewDetailBillServlet";

    private final String MANAGER_DASHBOARD_CONTROLLER = "ManagerDashBoardServlet";

    private final String MANAGER_VIEW_PRODUCT_CONTROLLER = "ManagerViewProductServlet";
    private final String MANAGER_UPDATE_PRODUCT_CONTROLLER = "ManagerUpdateProductServlet";
    private final String MANAGER_SHOW_UPDATE_PRODUCT_CONTROLLER = "ManagerShowUpdateProductServlet";
    private final String MANAGER_DELETE_PRODUCT_CONTROLLER = "ManagerDeleteProductServlet";

    private final String MANAGER_VIEW_ORDER_CONTROLLER = "ManagerViewOrderServlet";
    private final String MANAGER_VIEW_CANCEL_ORDER_CONTROLLER = "ManagerViewCancelOrderServlet";
    private final String MANAGER_VIEW_CUSTOMER_CANCEL_ORDER_CONTROLLER = "ManagerViewCustomerCancelOrderServlet";
    private final String MANAGER_VIEW_DELIVERY_ORDER_CONTROLLER = "ManagerViewDeliveryOrderServlet";
    private final String MANAGER_VIEW_SUCCESS_ORDER_CONTROLLER = "ManagerViewSuccessOrderServlet";

    private final String MANAGER_VIEW_DETAIL_ORDER_CONTROLLER = "ManagerViewDetailOrderServlet";
    private final String MANAGER_ACCEPT_ORDER_CONTROLLER = "ManagerAcceptOrderServlet";
    private final String MANAGER_REJECT_ORDER_CONTROLLER = "ManagerRejectOrderServlet";
    private final String MANAGER_ACCEPT_DELIVERY_ORDER_CONTROLLER = "ManagerAcceptDeliveryOrderServlet";
    private final String MANAGER_SUCCESS_ORDER_CONTROLLER = "ManagerSuccessOrderServlet";

    private final String MANAGER_VIEW_TRACKING_LIST_CONTROLLER = "ManagerViewTrackingListServlet";
    private final String MANAGER_VIEW_TRACKING_DETAIL_CONTROLLER = "ManagerViewTrackingDetailServlet";
    private final String MANAGER_VIEW_SUCCESS_TRACKING_BIRD_CONTROLLER = "ManagerViewSuccessTrackingBirdServlet";
    private final String MANAGER_VIEW_SUCCESS_TRACKING_DETAIL_CONTROLLER = "ManagerViewSuccessTrackingDetailServlet";
    private final String MANAGER_VIEW_CANCEL_TRACKING_BIRD_CONTROLLER = "ManagerViewCanceTrackingBirdServlet";

    private final String MANAGER_UPDATE_TRACKING_BIRD_CONTROLLER = "ManagerUpdateTrackingBirdServlet";
    private final String MANAGER_CANCEL_TRACKING_BIRD_CONTROLLER = "ManagerCancelTrackingBirdServlet";
    private final String MANAGER_DONE_TRACKING_BIRD_CONTROLLER = "ManagerDoneTrackingBirdServlet";

    private final String MANAGER_VIEW_ADD_PRODUCT_CONTROLLER = "ManagerViewCreateProductServlet";
    private final String MANAGER_CREATE_PRODUCT_CONTROLLER = "ManagerCreateProductServlet";
    private final String HISTORY = "HistoryServlet";

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
            } else if (button.equals("AdminViewProduct")) {
                url = ADMIN_VIEW_PAYMENT_CONTROLLER;
            } else if (button.equals("ManagerViewFeedback")) {
                url = MANAGER_VIEW_FEEDBACK_CONTROLLER;
            } else if (button.equals("View More")) {
                url = VIEW_MORE_BIRD_CONTROLLER;
            } else if (button.equals("Home")) {
                url = HOME_CONTROLLER;
            } else if (button.equals("Login")) {
                url = LOGIN_CONTROLLER;
            } else if (button.equals("Mua ngay")) {
                url = ADD_CHECKOUT_CONTROLLER;
            } else if (button.equals("Thêm sản phẩm") || button.equals("Trang chủ")) {
                url = BIRD_CONTROLLER;
            } else if (button.equals("Xem chi tiết")) {
                url = VIEW_CART_CONTROLLER;
            } else if (button.equals("So sánh ngay")) {
                url = COMPARE_BIRD_CONTROLLER;
            } else if (button.equals("filter")) {
                url = FILTER_CONTROLLER;
            } else if (button.equals("Thêm Vào Giỏ Hàng") || button.equals("Thêm vào giỏ hàng")) {
                url = ADD_TO_CART_CONTROLLER;
            } else if (button.equals("Mua Hàng")) {
                url = CHECK_OUT_CONTROLLER;
            } else if (button.equals("Thanh toán")) {
                url = PAYMENT_CONTROLLER;
            } else if (button.equals("History")) {
                url = HISTORY_CONTROLLER;
            } else if (button.equals("HistoryDetail")) {
                url = HISTORY_DETAIL_CONTROLLER;
            } else if (button.equals("Register")) {
                url = REGISTER_CONTROLLER;
            } else if (button.equals("Pairing") || button.equals("Đổi chim giống khác")) {
                request.setAttribute("action", button);
                url = PAIRING_CONTROLLER;
            } else if (button.equals("Ghép cặp")) {
                url = ADD_RERQUIRED_CONTROLLER;
            } else if (button.equals("Xem chi tiết đơn hàng")) {
                url = VIEW_REQUIRED_CART_CONTROLLER;
            } else if (button.equals("Đặt hàng")) {
                url = CHECKOUT_REQUIRED_CONTROLLER;
            } else if (button.equals("Thanh toán đơn hàng")) {
                url = RPAYMENT_CONTROLLER;
            } else if (button.equals("HistoryPairingDetail")) {
                url = HISTORY_PAIRING_CONTROLLER;
            } else if (button.equals("removeItemCart")) {
                url = REMOVE_ITEM_FROM_CART;
            } else if (button.equals("RemoveItemPairing")) {
                url = REMOVE_ITEM_PAIRING;
            } else if (button.equals("Xóa")) {
                url = REMOVE_ITEM_FROM_VIEW_CART;
            } else if (button.equals("Xóa ")) {
                url = REMOVE_ITEM_FROM_VIEW_REQUIRED_CART;
            } else if (button.equals("HistoryViewPairingDetail")) {
                url = HISTORY_VIEW_DETAIL_PAIRING_BILL;
            } else if (button.equals("UpdatePaymentMethod")) {
                url = ADMIN_UPDATE_PAYMENT_CONTROLLER;
            } else if (button.equals("ManagerSendMail")) {
                url = SEND_MAIL_TRACKING;
            } else if (button.equals("SendFeedback")) {
                url = FEEDBACK_CONTROLLER;
            } else if (button.equals("SendOrderFeedback")) {
                url = FEEDBACK_ORDER_CONTROLLER;
            } else if (button.equals("HistoryManager")) {
                url = HISTORY;
//================================================================
            } else if (button.equals("HistoryBill")) {
                url = HISTORY_CONTROLLER;
            } else if (button.equals("AdminControlAccount")) {
                url = ADMIN_CONTROL_ACCOUNT_CONTROLLER;

            } else if (button.equals("Update")) {
                url = ADMIN_UPDATE_ACCOUNT_CONTROLLER;
            }   //------------------------------------------------------------------------------
           else if (button.equals("RegisterAdmin")) {
                url = REGISTER_ADMIN_CONTROLLER;
            }else if (button.equals("DeleteAccount")) {
                url = ADMIN_DELETE_ACCOUNT_CONTROLLER;
            } else if (button.equals("ManagerViewFeedback")) {
                url = MANAGER_VIEW_FEEDBACK_CONTROLLER;
            } else if (button.equals("ManagerViewBill")) {
                url = MANAGER_VIEW_BILL_CONTROLLER;
            } else if (button.equals("ManagerViewProduct")) {
                url = MANAGER_VIEW_PRODUCT_CONTROLLER;
//------------------------------------------------------------------------------                
            } else if (button.equals("ManagerViewOrder")) {
                url = MANAGER_VIEW_ORDER_CONTROLLER;
            } else if (button.equals("ManagerViewCancelOrder")) {
                url = MANAGER_VIEW_CANCEL_ORDER_CONTROLLER;
            } else if (button.equals("ManagerViewCustomerCancelOrder")) {
                url = MANAGER_VIEW_CUSTOMER_CANCEL_ORDER_CONTROLLER;
            } else if (button.equals("ManagerViewDeliveryOrder")) {
                url = MANAGER_VIEW_DELIVERY_ORDER_CONTROLLER;
            } else if (button.equals("ManagerSuccessOrder")) {
                url = MANAGER_VIEW_SUCCESS_ORDER_CONTROLLER;

//------------------------------------------------------------------------------ 
            } else if (button.equals("ManagerViewTrackingList")) {
                url = MANAGER_VIEW_TRACKING_LIST_CONTROLLER;
            } else if (button.equals("ManagerViewCancelTrackingBird")) {
                url = MANAGER_VIEW_CANCEL_TRACKING_BIRD_CONTROLLER;

            } else if (button.equals("ManagerSuccessTrackingBird")) {
                url = MANAGER_VIEW_SUCCESS_TRACKING_BIRD_CONTROLLER;
//------------------------------------------------------------------------------             
            } else if (button.equals("AcceptOrder")) {
                url = MANAGER_ACCEPT_ORDER_CONTROLLER;
            } else if (button.equals("RejectOrder")) {
                url = MANAGER_REJECT_ORDER_CONTROLLER;
            } else if (button.equals("CancelTrackingBird")) {
                url = MANAGER_CANCEL_TRACKING_BIRD_CONTROLLER;
            } else if (button.equals("DoneTrackingBird")) {
                url = MANAGER_DONE_TRACKING_BIRD_CONTROLLER;
            } else if (button.equals("DeliveryOrder")) {
                url = MANAGER_ACCEPT_DELIVERY_ORDER_CONTROLLER;
            } else if (button.equals("SuccessOrder")) {
                url = MANAGER_SUCCESS_ORDER_CONTROLLER;

//------------------------------------------------------------------------------
            } else if (button.equals("DetailBill")) {
                url = MANAGER_VIEW_DETAIL_BILL_CONTROLLER;
            } else if (button.equals("DetailOrder")) {
                url = MANAGER_VIEW_DETAIL_ORDER_CONTROLLER;
            } else if (button.equals("DetailTrackingBird")) {
                url = MANAGER_VIEW_TRACKING_DETAIL_CONTROLLER;
            } else if (button.equals("DetailSuccessTrackingBird")) {
                url = MANAGER_VIEW_SUCCESS_TRACKING_DETAIL_CONTROLLER;

//------------------------------------------------------------------------------             
            } else if (button.equals("Check")) {
                url = MANAGER_DASHBOARD_CONTROLLER;
            } else if (button.equals("ViewUpdateProduct")) {
                url = MANAGER_SHOW_UPDATE_PRODUCT_CONTROLLER;
            } else if (button.equals("UpdateProduct")) {
                url = MANAGER_UPDATE_PRODUCT_CONTROLLER;
            } else if (button.equals("UpdateTrackingBird")) {
                url = MANAGER_UPDATE_TRACKING_BIRD_CONTROLLER;
            } else if (button.equals("DeleteProduct")) {
                url = MANAGER_DELETE_PRODUCT_CONTROLLER;
            } else if(button.equals("AdminViewPaymentMethod")) {
                url = ADMIN_VIEW_PAYMENT_CONTROLLER;
            }  else if (button.equals("CreateProduct")) {
                url = MANAGER_CREATE_PRODUCT_CONTROLLER;
            } else if (button.equals("AddProduct")) {
                url = MANAGER_VIEW_ADD_PRODUCT_CONTROLLER;
            }
            }finally {
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
        protected void doGet
        (HttpServletRequest request, HttpServletResponse response)
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
        protected void doPost
        (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            request.setCharacterEncoding("UTF-8");
            processRequest(request, response);
        }

        /**
         * Returns a short description of the servlet.
         *
         * @return a String containing servlet description
         */
        @Override
        public String getServletInfo
        
            () {
        return "Short description";
        }// </editor-fold>

    }
