/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package birdfarm.dao;

import birdfarm.dto.AdminDTO;
import birdfarm.dto.BirdDTO;
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
 * @author ASUS
 */
public class BirdDAO {
    private List<BirdDTO> birdList;
    private List<String> birdSubImageList;
    private List<BirdDTO> birdSearchList;
    private List<BirdDTO> birdViewAllTypeList;
    public List<BirdDTO> getBirdList() {
        return birdList;
    }


    public List<String> getBirdSubImageList() {
        return birdSubImageList;
    }

    public List<BirdDTO> getBirdSearchList() {
        return birdSearchList;
    }

    public List<BirdDTO> getBirdViewAllTypeList() {
        return birdViewAllTypeList;
    }
    
        
    public void getAllBird()
            throws SQLException, NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBConnection.makeConnection();
            if (con != null) {
                String sql = "SELECT bp.idBird\n" +
                        "      ,[name]\n" +
                        "      ,[overview]\n" +
                        "      ,[idBirdSpecies]\n" +
                        "      ,[quantity]\n" +
                        "      ,[importPrice]\n" +
                        "      ,[salePrice]\n" +
                        "      ,[isBirdNest]\n" +
                        "      ,[imageURL]\n" +
                        "      ,[status]\n" +
                        "      ,[period]\n" +
                        "      ,[Age]\n" +
                        "      ,[idFatherBird]\n" +
                        "      ,[idMotherBird]\n" +
                        "      ,[mutation]\n" +
                        "      ,[gender]\n" +
                        "      ,[type]\n" +
                        "      ,[videoURL]\n" +
                        "      ,[shortDescription]\n" +
                        "      ,[isPairing],\n" +
                        "        bf.achievement,\n" +
                        "	 bf.reproductiveHistory,\n" +
                        "	 birdTypeName\n" +
                        "  FROM [BIRD_FARM_SHOP].[dbo].[BirdProduct] bp\n" +
                        "  JOIN BirdProfile bf\n" +
                        "  ON bp.idBird = bf.idBird\n" +
                        "  JOIN BirdType bt\n" +
                        "  ON bp.idBirdSpecies = bt.idBirdType\n";
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String idBird = rs.getString("idBird");
                    String name = rs.getString("name");
                    String overview = rs.getString("overview");
                    String idBirdSpecies = rs.getString("idBirdSpecies");
                    int quantity = rs.getInt("quantity");
                    double importPrice = rs.getDouble("importPrice");
                    double salePrice = rs.getDouble("salePrice");
                    boolean isBirdNest = rs.getBoolean("isBirdNest");
                    String imageURL = rs.getString("imageURL");
                    boolean status = rs.getBoolean("status");
                    String period = rs.getString("period");
                    String age = rs.getString("Age");
                    String idFatherBird = rs.getString("idFatherBird");
                    String idMotherBird = rs.getString("idMotherBird");
                    boolean mutation = rs.getBoolean("mutation");
                    String gender = rs.getString("gender");
                    int type = rs.getInt("type");
                    String videoURL = rs.getString("videoURL");
                    String shortDescription = rs.getString("shortDescription");
                    String achievement = rs.getString("achievement");
                    String reproductiveHistory = rs.getString("reproductiveHistory");
                    String species = rs.getString("birdTypeName");
                    BirdDTO bird
                            = new BirdDTO(idBird, name, overview, idBirdSpecies, quantity, 
                                    importPrice, salePrice, isBirdNest, 
                                    imageURL, status, period, age, idFatherBird, idMotherBird, 
                                    mutation, gender, type, videoURL, shortDescription, 
                                    achievement, reproductiveHistory, species);

                    if (this.birdList == null) {
                        this.birdList = new ArrayList<>();
                    }
                    this.birdList.add(bird);
                }
            }
        } finally {
            if(rs != null) {
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
    public void getSubImageByBirdID(String birdID)
            throws SQLException, NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        this.birdSubImageList = new ArrayList<>();
        try {
            con = DBConnection.makeConnection();
            if (con != null) {
                String sql = "Select urlImage From BirdImage \n" +
                            "  Where idBirdProduct = ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, birdID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String subImage = rs.getString("urlImage");
                    this.birdSubImageList.add(subImage);
                }
            }
        } finally {
            if(rs != null) {
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
    
    public BirdDTO getBirdByID(String birdID) 
            throws SQLException, NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        BirdDTO bird = null;
        try {
            con = DBConnection.makeConnection();
            if (con != null) {
                String sql = "SELECT bp.idBird\n" +
                        "      ,[name]\n" +
                        "      ,[overview]\n" +
                        "      ,[idBirdSpecies]\n" +
                        "      ,[quantity]\n" +
                        "      ,[importPrice]\n" +
                        "      ,[salePrice]\n" +
                        "      ,[isBirdNest]\n" +
                        "      ,[imageURL]\n" +
                        "      ,[status]\n" +
                        "      ,[period]\n" +
                        "      ,[Age]\n" +
                        "      ,[idFatherBird]\n" +
                        "      ,[idMotherBird]\n" +
                        "      ,[mutation]\n" +
                        "      ,[gender]\n" +
                        "      ,[type]\n" +
                        "      ,[videoURL]\n" +
                        "      ,[shortDescription]\n" +
                        "      ,[isPairing],\n" +
                        "        bf.achievement,\n" +
                        "	 bf.reproductiveHistory,\n" +
                        "	 birdTypeName\n" +
                        "  FROM [BIRD_FARM_SHOP].[dbo].[BirdProduct] bp\n" +
                        "  JOIN BirdProfile bf\n" +
                        "  ON bp.idBird = bf.idBird\n" +
                        "  JOIN BirdType bt\n" +
                        "  ON bp.idBirdSpecies = bt.idBirdType\n" +
                        "  Where bp.idBird = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, birdID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String idBird = rs.getString("idBird");
                    String name = rs.getString("name");
                    String overview = rs.getString("overview");
                    String idBirdSpecies = rs.getString("idBirdSpecies");
                    int quantity = rs.getInt("quantity");
                    double importPrice = rs.getDouble("importPrice");
                    double salePrice = rs.getDouble("salePrice");
                    boolean isBirdNest = rs.getBoolean("isBirdNest");
                    String imageURL = rs.getString("imageURL");
                    boolean status = rs.getBoolean("status");
                    String period = rs.getString("period");
                    String age = rs.getString("Age");
                    String idFatherBird = rs.getString("idFatherBird");
                    String idMotherBird = rs.getString("idMotherBird");
                    boolean mutation = rs.getBoolean("mutation");
                    String gender = rs.getString("gender");
                    int type = rs.getInt("type");
                    String videoURL = rs.getString("videoURL");
                    String shortDescription = rs.getString("shortDescription");
                    String achievement = rs.getString("achievement");
                    String reproductiveHistory = rs.getString("reproductiveHistory");
                    String species = rs.getString("birdTypeName");
                    bird
                            = new BirdDTO(idBird, name, overview, idBirdSpecies, quantity, 
                                    importPrice, salePrice, isBirdNest, 
                                    imageURL, status, period, age, idFatherBird, idMotherBird, 
                                    mutation, gender, type, videoURL, shortDescription, 
                                    achievement, reproductiveHistory, species);
                }
            }
        } finally {
            if(rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return bird;
    }
    
    public List<BirdDTO> searchByName(String txtSearch) 
            throws SQLException, NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBConnection.makeConnection();
            if (con != null) {
                String sql = "SELECT [idBird]\n" +
                            "      ,[name]\n" +
                            "      ,[overview]\n" +
                            "      ,[idBirdSpecies]\n" +
                            "      ,[quantity]\n" +
                            "      ,[importPrice]\n" +
                            "      ,[salePrice]\n" +
                            "      ,[isBirdNest]\n" +
                            "      ,[imageURL]\n" +
                            "      ,[status]\n" +
                            "      ,[period]\n" +
                            "      ,[Age]\n" +
                            "      ,[idFatherBird]\n" +
                            "      ,[idMotherBird]\n" +
                            "      ,[mutation]\n" +
                            "      ,[gender]\n" +
                            "      ,[type]\n" +
                            "      ,[videoURL]\n" +
                            "      ,[shortDescription]\n" +
                            "  FROM [BIRD_FARM_SHOP].[dbo].[BirdProduct]\n" +
                            "  Where [name] LIKE ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, "%" + txtSearch + "%");
                rs = stm.executeQuery();
                while (rs.next()) {
                    String idBird = rs.getString("idBird");
                    String name = rs.getString("name");
                    String overview = rs.getString("overview");
                    String idBirdSpecies = rs.getString("idBirdSpecies");
                    int quantity = rs.getInt("quantity");
                    double importPrice = rs.getDouble("importPrice");
                    double salePrice = rs.getDouble("salePrice");
                    boolean isBirdNest = rs.getBoolean("isBirdNest");
                    String imageURL = rs.getString("imageURL");
                    boolean status = rs.getBoolean("status");
                    String period = rs.getString("period");
                    String age = rs.getString("Age");
                    String idFatherBird = rs.getString("idFatherBird");
                    String idMotherBird = rs.getString("idMotherBird");
                    boolean mutation = rs.getBoolean("mutation");
                    String gender = rs.getString("gender");
                    int type = rs.getInt("type");
                    String videoURL = rs.getString("videoURL");
                    String shortDescription = rs.getString("shortDescription");
                    BirdDTO bird
                            = new BirdDTO(idBird, name, overview, idBirdSpecies, quantity, importPrice, 
                                    salePrice, isBirdNest, imageURL, 
                                    status, period, age, idFatherBird, idMotherBird, 
                                    mutation, gender, type, videoURL, shortDescription);

                    if (this.birdSearchList == null) {
                        this.birdSearchList = new ArrayList<>();
                    }
                    this.birdSearchList.add(bird);
                }
            }
        } finally {
            if(rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return birdSearchList;
    }
    
    public List<BirdDTO> getBirdByType(String idType) 
            throws SQLException, NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        BirdDTO bird = null;
        try {
            con = DBConnection.makeConnection();
            if (con != null) {
                String sql = "SELECT [idBird]\n" +
                            "      ,[name]\n" +
                            "      ,[overview]\n" +
                            "      ,[idBirdSpecies]\n" +
                            "      ,[quantity]\n" +
                            "      ,[importPrice]\n" +
                            "      ,[salePrice]\n" +
                            "      ,[isBirdNest]\n" +
                            "      ,[imageURL]\n" +
                            "      ,[status]\n" +
                            "      ,[period]\n" +
                            "      ,[Age]\n" +
                            "      ,[idFatherBird]\n" +
                            "      ,[idMotherBird]\n" +
                            "      ,[mutation]\n" +
                            "      ,[gender]\n" +
                            "      ,[type]\n" +
                            "      ,[videoURL]\n" +
                            "      ,[shortDescription]\n" +
                            "  FROM [BIRD_FARM_SHOP].[dbo].[BirdProduct]\n" +
                            "  Where type = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, idType);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String idBird = rs.getString("idBird");
                    String name = rs.getString("name");
                    String overview = rs.getString("overview");
                    String idBirdSpecies = rs.getString("idBirdSpecies");
                    int quantity = rs.getInt("quantity");
                    double importPrice = rs.getDouble("importPrice");
                    double salePrice = rs.getDouble("salePrice");
                    boolean isBirdNest = rs.getBoolean("isBirdNest");
                    String imageURL = rs.getString("imageURL");
                    boolean status = rs.getBoolean("status");
                    String period = rs.getString("period");
                    String age = rs.getString("Age");
                    String idFatherBird = rs.getString("idFatherBird");
                    String idMotherBird = rs.getString("idMotherBird");
                    boolean mutation = rs.getBoolean("mutation");
                    String gender = rs.getString("gender");
                    int type = rs.getInt("type");
                    String videoURL = rs.getString("videoURL");
                    String shortDescription = rs.getString("shortDescription");
                    bird
                            = new BirdDTO(idBird, name, overview, idBirdSpecies, 
                                    quantity, importPrice, salePrice, 
                                    isBirdNest, imageURL, status, 
                                    period, age, idFatherBird, idMotherBird, mutation, 
                                    gender, type, videoURL, shortDescription);
                    if (this.birdViewAllTypeList == null) {
                        this.birdViewAllTypeList = new ArrayList<>();
                    }
                    this.birdViewAllTypeList.add(bird);
                }
            }
        } finally {
            if(rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return birdViewAllTypeList;
    }
    
}
