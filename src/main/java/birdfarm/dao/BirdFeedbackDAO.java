/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package birdfarm.dao;

import birdfarm.dto.BirdFeedbackDTO;
import birdfarm.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.naming.NamingException;

/**
 *
 * @author ASUS
 */
public class BirdFeedbackDAO {

    private List<BirdFeedbackDTO> listBirdFeedBack;

    public List<BirdFeedbackDTO> getListBirdFeedBack() {
        return listBirdFeedBack;
    }

    public void getBirdFeedBack()
            throws SQLException, NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBConnection.makeConnection();
            if (con != null) {
                String sql = "SELECT u.fullName, bp.name, bf.content, bf.createdDate\n"
                        + " FROM [BIRD_FARM_SHOP].[dbo].[BirdFeedback] bf\n"
                        + " JOIN [User] u\n"
                        + " ON bf.[idUser] = u.idUser\n"
                        + " Join BirdProduct bp\n"
                        + " On bf.idBirdProduct = bp.idBird";
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String userFullName = rs.getString("fullName");
                    String birdName = rs.getString("name");
                    String content = rs.getString("content");
                    Date createdDate = rs.getDate("createdDate");
                    BirdFeedbackDTO birdFeedback = new BirdFeedbackDTO(userFullName, birdName, content, createdDate);

                    if (this.listBirdFeedBack == null) {
                        this.listBirdFeedBack = new ArrayList<>();
                    }
                    this.listBirdFeedBack.add(birdFeedback);
                }
            }
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

    public boolean insertBirdFeedBack(String idUser, String txtFeedBack, String idBirdNest, int rateStar)
            throws SQLException, NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        Date currentDate = new Date();
        java.sql.Date createDate = new java.sql.Date(currentDate.getTime());
        boolean result = false;
        try {
            con = DBConnection.makeConnection();
            if (con != null) {
                String sql = "Insert Into BirdFeedback\n" +
"                          (idUser, idBirdProduct, content, createdDate, rate)\n" +
"                          VALUES \n" +
"                          (\n" +
"                        	?,\n" +
"                        	?,\n" +
"                        	?,\n" +
"                        	?, \n" +
"                         ? )";
                stm = con.prepareStatement(sql);
                stm.setString(1, idUser);
                stm.setString(2, idBirdNest);
                stm.setString(3, txtFeedBack);
                stm.setDate(4, createDate);
                stm.setInt(5, rateStar);
                int count = stm.executeUpdate();
                if (count > 0) {
                    result = true;
                }
            }
        }
        catch(Exception e) {
            e.printStackTrace();
        }
        finally {
           
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return result;
    }
}
