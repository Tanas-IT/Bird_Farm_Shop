/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package birdfarm.dao;

import birdfarm.dto.Chart;
import birdfarm.dto.ManagerOrderDTO;
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
public class ManagerOrderDAO implements Serializable {

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

    public void showOrder()
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
                        + "   O.status = N'Đang xử lý'";
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

    public void showCancelOrder()
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
                        + "   O.status = N'Đã hủy'";
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

    public void showCustomerCancelOrder()
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
                        + "   O.status = N'Bị hủy'";
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

    public void showDeliveryOrder()
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
                        + "   O.status = N'Đang giao'";
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

    public void showSucessOrder()
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
                        + "   O.status = N'Đã xong'";
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

    public void showOrderDetail(int searchIdOrder)
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
                        + "	BP.name, BP.imageURL , pm.methodName\n"
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
                                    receiverAddress, receiverPhoneNumber,
                                    name, imageURL, quantity, price, fullName,
                                    Note, methodName);

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

    public void showCustomerOrder(int searchIdOrder)
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
                            = new ManagerOrderDTO(idOrder, createdDate, status,
                                    receiverAddress, receiverPhoneNumber, fullName,
                                    methodName);

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

    public boolean acceptOrder(int idOrder)
            throws SQLException, NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        boolean result = false;
        try {
            con = DBConnection.makeConnection();
            if (con != null) {
                String sql = "UPDATE [Order] "
                        + " SET status = N'Đã xử lý' "
                        + "WHERE idOrder = ? ";
                stm = con.prepareStatement(sql);
                stm.setInt(1, idOrder);
                int effectRows = stm.executeUpdate();
                if (effectRows > 0) {
                    result = true;
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
        return result;
    }

    public boolean rejectOrder(int idOrder)
            throws SQLException, NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        boolean result = false;
        try {
            con = DBConnection.makeConnection();
            if (con != null) {
                String sql = "UPDATE [Order] "
                        + " SET status = N'Đã hủy' "
                        + "WHERE idOrder = ? ";
                stm = con.prepareStatement(sql);
                stm.setInt(1, idOrder);
                int effectRows = stm.executeUpdate();
                if (effectRows > 0) {
                    result = true;
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
        return result;
    }

    public boolean deliveryOrder(int idOrder)
            throws SQLException, NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        boolean result = false;
        try {
            con = DBConnection.makeConnection();
            if (con != null) {
                String sql = "UPDATE [Order] "
                        + " SET status = N'Đang giao' "
                        + "WHERE idOrder = ? ";
                stm = con.prepareStatement(sql);
                stm.setInt(1, idOrder);
                int effectRows = stm.executeUpdate();
                if (effectRows > 0) {
                    result = true;
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
        return result;
    }

    public boolean successOrder(int idOrder)
            throws SQLException, NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        boolean result = false;
        try {
            con = DBConnection.makeConnection();
            if (con != null) {
                String sql = "UPDATE [Order] "
                        + " SET status = N'Đã xong' "
                        + "WHERE idOrder = ? ";
                stm = con.prepareStatement(sql);
                stm.setInt(1, idOrder);
                int effectRows = stm.executeUpdate();
                if (effectRows > 0) {
                    result = true;
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
        return result;
    }

    public List<Chart> totalMoneyOrder(String idOrder, String start, int day) throws SQLException, NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<Chart> list = new ArrayList<>();
        for (int i = 0; i < day; i++) {
            int value = 0;
            try {
                con = DBConnection.makeConnection();
                if (con != null) {
                    String sql = "SELECT SUM(Total)\n"
                            + "FROM [Order]\n"
                            + "WHERE idOrder " + idOrder + "\n"
                            + "  AND createdDate <= DATEADD(DAY, ?, ?) AND createdDate >= ?";

                    stm = con.prepareStatement(sql);
                    stm.setInt(1, i);
                    stm.setString(2, start);
                    stm.setString(3, start);
                    rs = stm.executeQuery();
                    while (rs.next()) {
                        value = rs.getInt(1);
                    }
                    sql = "select  DATEADD(DAY, ?, ?)";
                    stm = con.prepareStatement(sql);
                    stm.setInt(1, i);
                    stm.setString(2, start);
                    rs = stm.executeQuery();
                    while (rs.next()) {
                        Chart c = Chart.builder()
                                .date(rs.getDate(1))
                                .value(value)
                                .build();
                        list.add(c);
                    }
                }
            } catch (SQLException e) {
                System.out.println(e);
            }
        }
        return list;
    }

    public List<Chart> getTotalOrder(String start, int day) throws
            SQLException, NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<Chart> list = new ArrayList<>();
        for (int i = 0; i < day; i++) {
            int value = 0;
            try {
                con = DBConnection.makeConnection();
                if (con != null) {
                    String sql = "SELECT COUNT(*) FROM [Order] "
                            + "WHERE createdDate <= DATEADD(DAY, ?, ?) "
                            + "AND createdDate >= ? ";

                    stm = con.prepareStatement(sql);
                    stm.setInt(1, i);
                    stm.setString(2, start);
                    stm.setString(3, start);
                    rs = stm.executeQuery();
                    while (rs.next()) {
                        value = rs.getInt(1);
                    }
                    sql = "select  DATEADD(DAY, ?, ?)";
                    stm = con.prepareStatement(sql);
                    stm.setInt(1, i);
                    stm.setString(2, start);
                    rs = stm.executeQuery();
                    while (rs.next()) {
                        Chart c = Chart.builder()
                                .date(rs.getDate(1))
                                .value(value)
                                .build();
                        list.add(c);
                    }
                }
            } catch (SQLException e) {
                System.out.println(e);
            } finally {
                if (rs != null) {
                    rs.close();
                }
                if (stm != null) {
                    stm.close();
                }
                if (con != null) {
                    con.close();
                }
            }

        }
        return list;
    }

}
