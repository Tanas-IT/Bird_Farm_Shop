/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package birdfarm.dao;

import birdfarm.dto.ManagerProductDTO;
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
public class ManagerProductDAO implements Serializable {

    private List<ManagerProductDTO> productList;

    public List<ManagerProductDTO> getProductList() {
        return productList;
    }

    public void showProduct()
            throws SQLException, NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBConnection.makeConnection();
            if (con != null) {
                String sql = " SELECT TOP (1000) bp.[idBird]\n" +
                            "      ,[name],\n" +
                            "	  bf.gender\n" +
                            "      ,[quantity]\n" +
                            "      ,[salePrice]\n" +
                            "      ,[period]\n" +
                            "      ,[shortDescription]\n" +
                            "      ,[isPairing]\n" +
                            "  FROM [BIRD_FARM_SHOP].[dbo].[BirdProduct] bp\n" +
                            "  Join BirdProfile bf\n" +
                            "  ON bp.idBird = bf.idBird\n" ;
                stm = con.prepareCall(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String idBird = rs.getString("idBird");
                    String name = rs.getString("name");
                    String period = rs.getString("period");
                    Double salePrice = rs.getDouble("salePrice");
                    int quantity = rs.getInt("quantity");
                    String gender = rs.getString("gender");
                    ManagerProductDTO dto
                            = new ManagerProductDTO(name, quantity, salePrice,
                                    period, idBird, gender);

                    if (this.productList == null) {
                        this.productList = new ArrayList<>();
                    }
                    this.productList.add(dto);
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

    public int getTotalProduct() throws NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBConnection.makeConnection();
            if (con != null) {
                String sql = "select COUNT(*) from BirdProduct";

                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public int getTotalProduct(int i) throws NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBConnection.makeConnection();
            if (con != null) {
                String sql = "select COUNT(*) from BirdProduct where type = ? ";

                stm = con.prepareStatement(sql);
                stm.setInt(1, i);
                rs = stm.executeQuery();
                while (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public boolean updateProduct(String idBird, boolean status, String period, int quantity,
            Double importPrice, Double salePrice, String imageURL, String overview, String videoURL)
            throws SQLException, NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        boolean result = false;

        try {
            //1. Make connection
            con = DBConnection.makeConnection();
            if (con != null) {

                String sql = "  UPDATE BirdProduct\n"
                        + "SET [status] = ?, \n"
                        + "    [period] = ?, \n"
                        + "    quantity = ?, \n"
                        + "    importPrice = ?, \n"
                        + "    salePrice = ?, \n"
                        + "    imageURL = ?, \n"
                        + "    overview = ?,"
                        + " videoURL = ? \n"
                        + "WHERE idBird = ? ";

                stm = con.prepareStatement(sql);
                stm.setBoolean(1, status);
                stm.setString(2, period);
                stm.setInt(3, quantity);
                stm.setDouble(4, importPrice);
                stm.setDouble(5, salePrice);
                stm.setString(6, imageURL);
                stm.setString(7, overview);
                stm.setString(8, videoURL);
                stm.setString(9, idBird);

                int effectRows = stm.executeUpdate();

                //5. Process
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

    public boolean updateProductVer2BirdProduct(String idBird, String shortDescription)
            throws SQLException, NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        boolean result = false;

        try {
            //1. Make connection
            con = DBConnection.makeConnection();
            if (con != null) {

                String sql = "  UPDATE [BirdProduct]\n"
                        + "SET [shortDescription] = ? \n"
                        + "WHERE idBird = ? ";

                stm = con.prepareStatement(sql);
                stm.setString(1, shortDescription);
                stm.setString(2, idBird);

                int effectRows = stm.executeUpdate();

                //5. Process
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

    public boolean updateProductVer3BirdProfile(String idBird, String achievement,
            Double feeBirdNestMale, Double feeBirdNestFemale)
            throws SQLException, NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        boolean result = false;

        try {
            //1. Make connection
            con = DBConnection.makeConnection();
            if (con != null) {

                String sql = "  UPDATE [BirdProfile]\n"
                        + "SET [achievement] = ?, \n"
                        + "    [feeBirdNestMale] = ?, \n"
                        + "    [feeBirdNestFemale] = ? \n"
                        + "WHERE idBird = ? ";

                stm = con.prepareStatement(sql);
                stm.setString(1, achievement);
                stm.setDouble(2, feeBirdNestMale);
                stm.setDouble(3, feeBirdNestFemale);

                stm.setString(4, idBird);

                int effectRows = stm.executeUpdate();

                //5. Process
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

    public void showUpdateProduct(String searchValue)
            throws SQLException, NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBConnection.makeConnection();
            if (con != null) {
                String sql = " SELECT b.idBird, b.name, b.overview, b.type,\n"
                        + "                        b.quantity, b.importPrice, b.salePrice, \n"
                        + "                        b.imageURL, b.videoURL, b.period, b.status, b.shortDescription, b.type, b.idBirdSpecies,\n"
                        + "						bt.birdTypeName , bp.age, bp.feeBirdNestFemale , bp.feeBirdNestMale , bp.achievement,\n"
                        + "						bp.gender, bp1.name as birdFather , bp2.name as birdMother\n"
                        + "                        from BirdProduct b\n"
                        + "						Left Join BirdProfile bp on b.idBird = bp.[idBird]\n"
                        + "						Left Join BirdType bt on b.idBirdSpecies = bt.idBirdType\n"
                        + "						Left join BirdProduct bp1 on bp1.idBird = bp.idFatherBird\n"
                        + "                        Left join BirdProduct bp2 on bp2.idBird = bp.idMotherBird\n"
                        + "\n"
                        + "\n"
                        + "                        WHERE b.idBird = ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, searchValue);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String idBird = rs.getString("idBird");
                    String name = rs.getString("name");
                    String overview = rs.getString("overview");
                    int quantity = rs.getInt("quantity");
                    Double importPrice = rs.getDouble("importPrice");
                    Double salePrice = rs.getDouble("salePrice");
                    String imageURL = rs.getString("imageURL");
                    String videoURL = rs.getString("videoURL");
                    String period = rs.getString("period");
                    boolean status = rs.getBoolean("status");
                    String shortDescription = rs.getString("shortDescription");
                    int type = rs.getInt("type");

                    int idBirdSpecies = rs.getInt("idBirdSpecies");
                    String birdTypeName = rs.getString("birdTypeName");
                    String age = rs.getString("age");
                    Double feeBirdNestFemale = rs.getDouble("feeBirdNestFemale");
                    Double feeBirdNestMale = rs.getDouble("feeBirdNestMale");
                    String achievement = rs.getString("achievement");
                    String gender = rs.getString("gender");
                    String birdFather = rs.getString("birdFather");
                    String birdMother = rs.getString("birdMother");

                    ManagerProductDTO dto
                            = new ManagerProductDTO(idBird, name, overview,
                                    quantity, importPrice, salePrice, imageURL,
                                    period, status, videoURL, shortDescription,
                                    type, idBirdSpecies, birdTypeName, age,
                                    feeBirdNestMale, feeBirdNestFemale, achievement,
                                    gender, birdFather, birdMother);

                    if (this.productList == null) {
                        this.productList = new ArrayList<>();
                    }
                    this.productList.add(dto);
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

    public boolean deleteBird(String idBird) throws SQLException, NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        boolean result = false;
        try {
            //1. Make connection
            con = DBConnection.makeConnection();
            if (con != null) {
                String sql = "Delete From BirdProduct "
                        + "Where idBird = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, idBird);
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

     public boolean deleteBirdPro(String idBird) throws SQLException, NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        boolean result = false;
        try {
            //1. Make connection
            con = DBConnection.makeConnection();
            if (con != null) {
                String sql = "Delete From BirdProfile "
                        + "Where idBird = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, idBird);
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
    public boolean insertTableBirdProduct(String idBird, String name,
            String overview, int idBirdSpecies, int quantity, Double importPrice,
            Double salePrice, String imageURL, String period, int type, String videoURL,
            String shortDescription)
            throws SQLException, NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        boolean result = false;

        try {

            con = DBConnection.makeConnection();
            if (con != null) {

                String sql = "  INSERT INTO BirdProduct( [idBird]\n"
                        + "      ,[name]\n"
                        + "      ,[overview]\n"
                        + "      ,[idBirdSpecies]\n"
                        + "      ,[quantity]\n"
                        + "      ,[importPrice]\n"
                        + "      ,[salePrice]\n"
                        + "      ,[imageURL]\n"
                        + "      ,[status]\n"
                        + "      ,[period]\n"
                        + "      ,[type]\n"
                        + "      ,[videoURL]\n"
                        + "      ,[shortDescription]\n"
                        + "      ,[isPairing] )\n"
                        + " VALUES (?,?,?,?,?,?,?,?, '1' ,?,?,?,?, '0')";

                stm = con.prepareStatement(sql);
                stm.setString(1, idBird);
                stm.setString(2, name);
                stm.setString(3, overview);
                stm.setInt(4, idBirdSpecies);
                stm.setInt(5, quantity);
                stm.setDouble(6, importPrice);
                stm.setDouble(7, salePrice);
                stm.setString(8, imageURL);
                stm.setString(9, period);
                stm.setInt(10, type);
                stm.setString(11, videoURL);
                stm.setString(12, shortDescription);
                int effectRows = stm.executeUpdate();

                //5. Process
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

    public boolean insertTableBirdProfile(String idBirdProfile, String idBird,
            String achievement, String reproductiveHistory, String age, String idFatherBird,
            String idMotherBird, boolean mutation, String gender, Double feeBirdNestMale, 
            Double feeBirdNestFemale)
            throws SQLException, NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        boolean result = false;

        try {

            con = DBConnection.makeConnection();
            if (con != null) {

                String sql = "INSERT INTO  BirdProfile ( [idBirdProfile]\n"
                        + "      ,[idBird]\n"
                        + "      ,[achievement]\n"
                        + "      ,[reproductiveHistory]\n"
                        + "      ,[Age]\n"
                        + "      ,[idFatherBird]\n"
                        + "      ,[idMotherBird]\n"
                        + "      ,[mutation]\n"
                        + "      ,[gender]\n"
                        + "      ,[feeBirdNestMale]\n"
                        + "      ,[feeBirdNestFemale])\n"
                        + "	  VALUES (?,?,?,?,?,?,?,?,?,?,?)";

                stm = con.prepareStatement(sql);
                stm.setString(1, idBirdProfile);
                stm.setString(2, idBird);
                stm.setString(3, achievement);
                stm.setString(4, reproductiveHistory);
                stm.setString(5, age);
                stm.setString(6, idFatherBird);
                stm.setString(7, idMotherBird);
                stm.setBoolean(8, mutation);
                stm.setString(9, gender);
                stm.setDouble(10, feeBirdNestMale);
                stm.setDouble(11, feeBirdNestFemale);
                int effectRows = stm.executeUpdate();

                //5. Process
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
}
