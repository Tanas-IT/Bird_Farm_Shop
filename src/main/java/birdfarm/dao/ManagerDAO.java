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

//    public void showOrder()
//            throws SQLException, NamingException, ClassNotFoundException {
//        Connection con = null;
//        PreparedStatement stm = null;
//        ResultSet rs = null;
//
//        try {
//            con = DBConnection.makeConnection();
//            if (con != null) {
//                String sql = "SELECT O.createdDate, O.Total, U.fullName, C.phoneNumber\n"
//                        + "FROM [Order] AS O\n"
//                        + "JOIN [User] AS U ON O.idUser = U.idUser\n"
//                        + "JOIN Customer AS C ON U.idUser = C.idCustomer;";
//                stm = con.prepareCall(sql);
//                rs = stm.executeQuery();
//                while (rs.next()) {
//                    String fullName = rs.getString("fullName");
//                    String phoneNumber = rs.getString("phoneNumber");
//                    String createdDate = rs.getString("createdDate");
//                    Double Total = rs.getDouble("Total");
//                    
//                    ManagerOrderDTO dto
//                            = new ManagerOrderDTO(createdDate, Total, fullName, phoneNumber);
//
//                    if (this.orderList == null) {
//                        this.orderList = new ArrayList<>();
//                    }
//                    this.orderList.add(dto);
//                }
//            }
//        } finally {
//            if (stm != null) {
//                stm.close();
//            }
//            if (con != null) {
//                con.close();
//            }
//        }
//    }
    public void showOrder()
            throws SQLException, NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBConnection.makeConnection();
            if (con != null) {
                String sql = "  SELECT\n"
                        + "    O.createdDate,\n"
                        + "    O.Total,\n"
                        + "    O.deliveryCost,\n"
                        + "    O.receiverAddress,\n"
                        + "    O.receiverPhoneNumber,\n"
                        + "    O.receiverName,\n"
                        + "    BP.name,\n"
                        + "    OD.quantity,\n"
                        + "    OD.price\n"
                        + "FROM\n"
                        + "    [Order] AS O\n"
                        + "    JOIN OrderDetail AS OD ON O.idOrder = OD.idOrder\n"
                        + "    JOIN BirdProduct AS BP ON OD.idBirdProduct = BP.idBird;";
                stm = con.prepareCall(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String createdDate = rs.getString("createdDate");
                    Double Total = rs.getDouble("Total");
                    Double deliveryCost = rs.getDouble("deliveryCost");
                    String receiverAddress = rs.getString("receiverAddress");
                    String receiverPhoneNumber = rs.getString("receiverPhoneNumber");
                    String receiverName = rs.getString("receiverName");
                    String name = rs.getString("name");
                    int quantity = rs.getInt("quantity");
                    Double price = rs.getDouble("price");

                    ManagerOrderDTO dto
                            = new ManagerOrderDTO(createdDate, Total, deliveryCost, 
                                    receiverAddress, receiverPhoneNumber, receiverName, 
                                    name, quantity, price);                           
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
}
