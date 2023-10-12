///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package birdfarm.dao;
//
//import birdfarm.dto.ManagerTrackingBirđTO;
//import birdfarm.util.DBConnection;
//import java.io.Serializable;
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.util.ArrayList;
//import java.util.List;
//import javax.naming.NamingException;
//
///**
// *
// * @author HP
// */
//public class ManagerTrackingBirđAO implements Serializable{
//    private List<ManagerTrackingBirđTO> requiredOrderDetailList;
//
//    public List<ManagerTrackingBirđTO> getRequiredOrderDetailList() {
//        return requiredOrderDetailList;
//    }
//    
//    public void showOrder()
//            throws SQLException, NamingException, ClassNotFoundException {
//        Connection con = null;
//        PreparedStatement stm = null;
//        ResultSet rs = null;
//
//        try {
//            con = DBConnection.makeConnection();
//            if (con != null) {
//                String sql = "  SELECT\n"
//                        + "   O.idOrder,\n"
//                        + "   O.createdDate,\n"
//                        + "   O.receiverPhoneNumber,\n"
//                        + "   O.Total, O.status,\n"
//                        + "   u.fullName\n"
//                        + "FROM\n"
//                        + "   [Order] AS O\n"
//                        + "   JOIN [User] AS u ON u.idUser = O.idUser\n"
//                        + "WHERE\n"
//                        + "   O.status = N'Đang xử lý'";
//                stm = con.prepareCall(sql);
//                rs = stm.executeQuery();
//                while (rs.next()) {
//                    int idOrder = rs.getInt("idOrder");
//                    String createdDate = rs.getString("createdDate");
//                    String receiverPhoneNumber = rs.getString("receiverPhoneNumber");
//                    Double Total = rs.getDouble("Total");
//                    String status = rs.getString("status");
//                    String fullName = rs.getString("fullName");
//
//                    ManagerTrackingBirđTO dto
//                            = new ManagerTrackingBirđTO(idOrder, createdDate, status, Total, receiverPhoneNumber, fullName);
//
//                    if (this.requiredOrderDetailList == null) {
//                        this.requiredOrderDetailList = new ArrayList<>();
//                    }
//                    this.requiredOrderDetailList.add(dto);
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
//}
