/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package birdfarm.dao;

import birdfarm.dto.BirdDTO;
import birdfarm.dto.OrderDetailDTO;
import birdfarm.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;

/**
 *
 * @author Minh
 */
public class OrderDetailDAO {

    private static final String INSERT = "INSERT INTO OrderDetail (idOrder, idBirdProduct, quantity, price, totalPrice) VALUES(?,?,?,?,?)";
    private static final String GET_DETAIL_ALL_ORDER = " select * from OrderDetail join BirdProduct \n" +
"                        on OrderDetail.idBirdProduct = BirdProduct.idBird\n" +
"						Join [Order] o ON o.idOrder = OrderDetail.idOrder\n" +
"						Join Customer c On o.idUser = c.idCustomer\n" +
"            			where o.idOrder = ?";

    public boolean insert(BirdDTO product, int lastInsertID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBConnection.makeConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT);
                ptm.setInt(1, lastInsertID);
                ptm.setString(2, product.getIdBird());
                ptm.setInt(3, product.getQuantityOfUser());
                ptm.setDouble(4, product.getSalePrice());
                ptm.setDouble(5, product.getTotal());

                check = ptm.executeUpdate() > 0 ? true : false;
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
        return check;
    }

    public List<OrderDetailDTO> getDetailAllOrder(int orderId) 
            throws NamingException, ClassNotFoundException {
        {
            Connection conn = null;
            OrderDetailDTO detail = null;
            PreparedStatement ptm = null;
            ResultSet rs = null;
            List<OrderDetailDTO> list = new ArrayList<>();
            try {
                conn = DBConnection.makeConnection();
                if (conn != null) {
                    ptm = conn.prepareStatement(GET_DETAIL_ALL_ORDER);
                    ptm.setInt(1, orderId);
                    rs = ptm.executeQuery();
                    while (rs.next()) {
                        int oId = rs.getInt("idOrder");
                        int quantity = rs.getInt("quantity");
                        Double price = rs.getDouble("price");
                        String oBirdName = rs.getString("name");
                        String receiverName = rs.getString("receiverName");
                        String email = rs.getString("Email");
                        String phoneNumber = rs.getString("phoneNumber");
                        String shortDescription = rs.getString("shortDescription");
                        String oBirdUrl = rs.getString("imageURL");
                        double totalPrice = rs.getDouble("totalPrice");
                        String idBird = rs.getString("idBird");
                        BirdDTO bird = new BirdDTO(idBird,quantity, price, oBirdName,shortDescription,oBirdUrl);
                        detail = new OrderDetailDTO(orderId, bird, receiverName, email, phoneNumber,totalPrice);
                        list.add(detail);
                    }
                }
            } catch (SQLException e) {
                System.out.println(e);

            }
            return list;
        }

    }
}
