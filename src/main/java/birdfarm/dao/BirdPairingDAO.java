/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package birdfarm.dao;

import birdfarm.dto.BirdPairingDTO;
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
 * @author Admin
 */
public class BirdPairingDAO implements Serializable {

    List<BirdPairingDTO> femaleBirdList;

    public List<BirdPairingDTO> getFemaleBirdList() {
        return femaleBirdList;
    }
    List<BirdPairingDTO> maleBirdList;

    public List<BirdPairingDTO> getMaleBirdList() {
        return maleBirdList;
    }

    public void showMaleBird()
            throws SQLException, NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBConnection.makeConnection();
            if (con != null) {
                String sql = "select name,overview,idBirdType,salePrice,imageURL,age,mutation from BirdProduct where gender=N'Trống'";
                stm = con.prepareCall(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String name = rs.getString("name");
                    String overview = rs.getString("overview");
                    int idBirdType = rs.getInt("idBirdType");
                    float salePrice = rs.getFloat("salePrice");
                    String imageURL = rs.getString("imageURL");
                    String age = rs.getString("age");
                    boolean mutation = rs.getBoolean("mutation");

                    BirdPairingDTO dto = new BirdPairingDTO(name, overview, idBirdType, salePrice, imageURL, age, mutation);

                    if (this.maleBirdList == null) {
                        this.maleBirdList = new ArrayList<>();
                    }
                    this.maleBirdList.add(dto);

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

    public void showFemaleBird()
            throws SQLException, NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBConnection.makeConnection();
            if (con != null) {
                String sql = "select name,overview,idBirdType,salePrice,imageURL,age,mutation from BirdProduct where gender='Mái'";
                stm = con.prepareCall(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String name = rs.getString("name");
                    String overview = rs.getString("overview");
                    int idBirdType = rs.getInt("idBirdType");
                    float salePrice = rs.getFloat("salePrice");
                    String imageURL = rs.getString("imageURL");
                    String age = rs.getString("age");
                    boolean mutation = rs.getBoolean("mutation");

                    BirdPairingDTO dto1 = new BirdPairingDTO(name, overview, idBirdType, salePrice, imageURL, age, mutation);

                    if (this.femaleBirdList == null) {
                        this.femaleBirdList = new ArrayList<>();
                    }
                    this.femaleBirdList.add(dto1);

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
