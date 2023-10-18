/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package birdfarm.dao;

import birdfarm.dto.OrderDTO;
import birdfarm.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;

/**
 *
 * @author Minh
 */
public class OrderDAO {

    private static final String ADD_ORDER = "INSERT INTO Order(idUser, createdDate, status, Total, receiverAddress, Note, receiverPhoneNumber, receiverName, isPay) VALUES(?,?,?,?,?,?,?,?,?)";
    private static final String UPDATE_PAYMENT = "UPDATE Order SET paymentID =? WHERE orderCode=?";
    private static final String UPDATE_STATUS = "UPDATE Orders SET status=? WHERE orderCode=?";
    private static final String UPDATE_ISPAY = "UPDATE Orders SET isPay=? WHERE orderCode=?";
    private static final String GET_ORDER_BY_ID = "SELECT * FROM [Order]  WHERE idUser=? and idOrder=?";
    private static final String GET_ALL_ORDER = "Select o.idOrder, o.createdDate, bp.name, od.quantity, od.price, o.status, od.totalPrice From [Order] o\n"
                                                + "  Join [User] u\n"
                                                + "  ON o.idUser = u.idUser\n"
                                                + "  Join OrderDetail od\n"
                                                + "  ON o.idOrder = od.idOrder\n"
                                                + "  Join BirdProduct bp\n"
                                                + "  On bp.idBird = od.idBirdProduct\n"
                                                + "  Where o.idUser = '?'";

    public int AddOrder(OrderDTO order) throws SQLException {
        int lastInsertId = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet generatedKeys = null;
        try {
            conn = DBConnection.makeConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(ADD_ORDER, Statement.RETURN_GENERATED_KEYS);
//                ptm.setString(1, order.getOrderCode());
                ptm.setString(1, order.getIdUser());
                ptm.setString(2, order.getCreatedDate());
                ptm.setString(3, order.getStatus());
                ptm.setDouble(4, order.getTotal());
                ptm.setString(5, order.getReceiverAddress());
                ptm.setString(6, order.getNote());
                ptm.setString(7, order.getReceiverPhoneNumber());
                ptm.setString(8, order.getReceiverName());
                ptm.setBoolean(9, order.getIsPay());

                int rowsAffected = ptm.executeUpdate();
                if (rowsAffected > 0) {
                    generatedKeys = ptm.getGeneratedKeys();
                    if (generatedKeys.next()) {
                        lastInsertId = generatedKeys.getInt(1);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (generatedKeys != null) {
                generatedKeys.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return lastInsertId;
    }

    public void updatePaymentID(OrderDTO order) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBConnection.makeConnection();
            if (conn != null) {
                int pay = order.getPaymentId();
                ptm = conn.prepareStatement(UPDATE_PAYMENT);
                ptm.setInt(1, order.getPaymentId());
                ptm.setInt(2, order.getIdOrder());
                ptm.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    public void updateStatus(OrderDTO order) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBConnection.makeConnection();
            if (conn != null) {
                int pay = order.getPaymentId();
                ptm = conn.prepareStatement(UPDATE_STATUS);
                ptm.setString(1, order.getStatus());
                ptm.setInt(2, order.getIdOrder());
                ptm.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    public void updateIsPay(OrderDTO order) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBConnection.makeConnection();
            if (conn != null) {
                int pay = order.getPaymentId();
                ptm = conn.prepareStatement(UPDATE_ISPAY);
                ptm.setBoolean(1, order.getIsPay());
                ptm.setInt(2, order.getIdOrder());
                ptm.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    public OrderDTO getOrderById(String idOrder) throws SQLException {
        OrderDTO order = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBConnection.makeConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ORDER_BY_ID);
                ptm.setString(1, idOrder);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String odate = rs.getString("createDate");
                    String ostatus = rs.getString("status");
                    double oPrice = rs.getDouble("Total");
                    String oAddress = rs.getString("receiverAddress");
                    String oNote = rs.getString("Note");
                    String oPhone = rs.getString("receiverPhoneNumber");
                    String oName = rs.getString("receiverName");
                    int oPid = rs.getInt("paymentID");
                    boolean oIsPay = rs.getBoolean("isPay");

                    order = new OrderDTO(odate, odate, ostatus, oPrice, oAddress, oNote, oPhone, oName, oPid, oIsPay);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return order;
    }

    public List<OrderDTO> getAllOrder(String idUser) throws SQLException, NamingException, ClassNotFoundException {
        Connection conn = null;
        OrderDTO order = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        List<OrderDTO> list = new ArrayList<>();
        try {
            conn = DBConnection.makeConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ALL_ORDER);
                ptm.setString(1, idUser);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    int oId = rs.getInt("idOrder");
                    String oBird = rs.getString("name");
                    String oBirdId = rs.getString("idBird");
                    String oDate = rs.getString("createDate");
                    String oStatus = rs.getString("status");
                    double oPrice = rs.getDouble("Total");

                    order = new OrderDTO(oId, oDate, oStatus, oPrice, oDate, oBirdId);
                    list.add(order);

                }
            }
        } catch (SQLException e) {
            System.out.println(e);

        }
        return list;
    }
}
