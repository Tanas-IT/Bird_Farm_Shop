/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package birdfarm.dao;

import birdfarm.dto.ManagerOrderDTO;
import birdfarm.dto.ManagerViewFeedbackDTO;
import birdfarm.util.DBConnection;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;

/**
 *
 * @author HP
 */
public class ManagerDAO implements Serializable {

    private List<ManagerViewFeedbackDTO> feedbacktList;

    public List<ManagerViewFeedbackDTO> getFeedbackList() {
        return feedbacktList;
    }

    private List<ManagerOrderDTO> orderList;

    public List<ManagerOrderDTO> getOrderList() {
        return orderList;
    }

    private List<ManagerOrderDTO> orderListDetail;

    public List<ManagerOrderDTO> getOrderListDetail() {
        return orderListDetail;
    }

    private List<ManagerOrderDTO> orderListDetailCustomer;

    public List<ManagerOrderDTO> getOrderListDetailCustomer() {
        return orderListDetailCustomer;
    }

    public void showFeedback()
            throws SQLException, NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBConnection.makeConnection();
            if (con != null) {
                String sql = "SELECT BF.idUser, U.fullName, R.roleName, C.phoneNumber, C.email, BF.content, BF.createdDate\n"
                        + "FROM BirdFeedback BF\n"
                        + "JOIN [User] U ON BF.idUser = U.idUser\n"
                        + "JOIN Role R ON U.idRole = R.idRole\n"
                        + "JOIN Customer C ON U.idUser = C.idCustomer\n"
                        + "ORDER BY BF.createdDate DESC";
                stm = con.prepareCall(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String idUser = rs.getString("idUser");
                    String fullName = rs.getString("fullName");
                    String roleName = rs.getString("roleName");
                    String phoneNumber = rs.getString("phoneNumber");
                    String email = rs.getString("email");
                    String content = rs.getString("content");
                    String createdDate = rs.getString("createdDate");

                    ManagerViewFeedbackDTO dto
                            = new ManagerViewFeedbackDTO(fullName, roleName, phoneNumber, email, content, createdDate);

                    if (this.feedbacktList == null) {
                        this.feedbacktList = new ArrayList<>();
                    }
                    this.feedbacktList.add(dto);
                }
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }

    public void showBill()
            throws SQLException, NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBConnection.makeConnection();
            if (con != null) {
                String sql = "  SELECT\n"
                        + "   O.idOrder,\n"
                        + "   O.createdDate,\n"
                        + "   O.receiverPhoneNumber,\n"
                        + "   O.Total, O.status,\n"
                        + "   u.fullName\n"
                        + "FROM\n"
                        + "   [Order] AS O\n"
                        + "   JOIN [User] AS u ON u.idUser = O.idUser\n"
                        + "WHERE\n"
                        + "   O.status = N'Đã xử lý'";
                stm = con.prepareCall(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int idOrder = rs.getInt("idOrder");
                    String createdDate = rs.getString("createdDate");
                    String receiverPhoneNumber = rs.getString("receiverPhoneNumber");
                    Double Total = rs.getDouble("Total");
                    String status = rs.getString("status");
                    String fullName = rs.getString("fullName");

                    ManagerOrderDTO dto
                            = new ManagerOrderDTO(idOrder, createdDate, status, Total, receiverPhoneNumber, fullName);

                    if (this.orderList == null) {
                        this.orderList = new ArrayList<>();
                    }
                    this.orderList.add(dto);
                }
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }

    public void showBillDetail(int searchIdOrder)
            throws SQLException, NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBConnection.makeConnection();
            if (con != null) {
                String sql = "SELECT \n"
                        + "   O.idOrder,\n"
                        + "   O.createdDate,\n"
                        + "   O.receiverPhoneNumber, "
                        + "O.receiverAddress, O.Note,\n"
                        + "   u.fullName,\n"
                        + "   OD.price,\n"
                        + "   OD.quantity,\n"
                        + "	BP.name, BP.imageURL, pm.methodName \n"
                        + "    FROM\n"
                        + "   [Order] AS O\n"
                        + "   Join [User] As u ON u.idUser = O.idUser\n"
                        + "Join [Payment] As pm ON O.paymentID = pm.idPayment \n"
                        + "Join [OrderDetail] As OD on O.idOrder = OD.idOrder \n"
                        + "JOIN BirdProduct AS BP ON OD.idBirdProduct = BP.idBird "
                        + "Where O.idOrder = ? ";
                stm = con.prepareCall(sql);

                stm.setInt(1, searchIdOrder);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int idOrder = rs.getInt("idOrder");
                    String createdDate = rs.getString("createdDate");
                    String receiverAddress = rs.getString("receiverAddress");
                    String receiverPhoneNumber = rs.getString("receiverPhoneNumber");
                    String fullName = rs.getString("fullName");
                    String name = rs.getString("name");
                    int quantity = rs.getInt("quantity");
                    Double price = rs.getDouble("price");
                    String imageURL = rs.getString("imageURL");
                    String Note = rs.getString("Note");
                    String methodName = rs.getString("methodName");

                    ManagerOrderDTO dto
                            = new ManagerOrderDTO(idOrder, createdDate,
                                    receiverAddress, receiverPhoneNumber, name,
                                    imageURL, quantity, price, fullName, Note,
                                    methodName);

                    if (this.orderListDetail == null) {
                        this.orderListDetail = new ArrayList<>();
                    }
                    this.orderListDetail.add(dto);
                }
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }

    public void showCustomerBill(int searchIdOrder)
            throws SQLException, NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBConnection.makeConnection();
            if (con != null) {
                String sql = "SELECT \n"
                        + " O.idOrder,\n"
                        + " O.createdDate,\n"
                        + " O.receiverPhoneNumber, \n"
                        + " O.receiverAddress, O.status,\n"
                        + " u.fullName, pm.methodName\n"
                        + "FROM [Order] AS O\n"
                        + "Join [User] As u ON u.idUser = O.idUser\n"
                        + "Join [Payment] As pm ON O.paymentID = pm.idPayment \n"
                        + "Where O.idOrder = ?";
                stm = con.prepareCall(sql);

                stm.setInt(1, searchIdOrder);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int idOrder = rs.getInt("idOrder");
                    String createdDate = rs.getString("createdDate");
                    String receiverAddress = rs.getString("receiverAddress");
                    String receiverPhoneNumber = rs.getString("receiverPhoneNumber");
                    String fullName = rs.getString("fullName");
                    String status = rs.getString("status");
                    String methodName = rs.getString("methodName");

                    ManagerOrderDTO dto
                            = new ManagerOrderDTO(idOrder, 
                                    createdDate, status, receiverAddress,
                                    receiverPhoneNumber, fullName, methodName);

                    if (this.orderListDetailCustomer == null) {
                        this.orderListDetailCustomer = new ArrayList<>();
                    }
                    this.orderListDetailCustomer.add(dto);
                }
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }

}
