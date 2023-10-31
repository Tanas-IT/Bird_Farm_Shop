/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package birdfarm.dao;

import birdfarm.dto.BirdDTO;
import birdfarm.dto.BirdTypeDTO;
import birdfarm.dto.RequiredOrderDetailDTO;
import birdfarm.util.DBConnection;
import java.sql.Connection;
import java.sql.Date;
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
    private List<BirdTypeDTO> birdTypeList;
    private List<BirdDTO> birdMaleList;
    private List<BirdDTO> birdFemaleList;
    private static final String UPDATE_QUANTITY = "UPDATE BirdProduct SET quantity=? WHERE [idBird]=?";

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

    public List<BirdTypeDTO> getBirdTypeList() {
        return birdTypeList;
    }

    public List<BirdDTO> getBirdMaleList() {
        return birdMaleList;
    }

    public List<BirdDTO> getBirdFemaleList() {
        return birdFemaleList;
    }

   
    
        
    public void getAllBird()
            throws SQLException, NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBConnection.makeConnection();
            if (con != null) {
                String sql = " SELECT bp.idBird\n" +
"                              ,[name]\n" +
"                              ,[overview]\n" +
"                              ,[idBirdSpecies]\n" +
"                              ,[quantity]\n" +
"                              ,[importPrice]\n" +
"                              ,[salePrice]\n" +
"                              ,[imageURL]\n" +
"                              ,[status]\n" +
"                              ,[period]\n" +
"                              ,bf.Age\n" +
"                              ,bf.[idFatherBird]\n" +
"                              ,bf.[idMotherBird]\n" +
"                              ,bf.mutation\n" +
"                              ,bf.gender\n" +
"                              ,[type]\n" +
"                              ,[videoURL]\n" +
"                              ,[shortDescription]\n" +
"                              ,[isPairing],\n" +
"                                bf.achievement,\n" +
"                        	 bf.reproductiveHistory,\n" +
"                        	 birdTypeName\n" +
"                          FROM [BIRD_FARM_SHOP].[dbo].[BirdProduct] bp\n" +
"                          JOIN BirdProfile bf\n" +
"                          ON bp.idBird = bf.idBird\n" +
"                          JOIN BirdType bt\n" +
"                          ON bp.idBirdSpecies = bt.idBirdType Where quantity > 0";
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
                                    importPrice, salePrice, 
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
                String sql = "SELECT bp.[idBird]\n" +
                    "       ,[name]\n" +
                    "       ,[overview]\n" +
                    "       ,[idBirdSpecies]\n" +
                    "       ,[quantity]\n" +
                    "       ,[importPrice]\n" +
                    "       ,[salePrice]\n" +
                    "       ,[imageURL]\n" +
                    "       ,[status]\n" +
                    "       ,[period]\n" +
                    "       ,bf.Age\n" +
                    "       ,bf.idFatherBird\n" +
                    "       ,bf.idMotherBird\n" +
                    "       ,bf.mutation\n" +
                    "       ,bf.gender\n" +
                    "       ,[type]\n" +
                    "       ,[videoURL]\n" +
                    "       ,[shortDescription]\n" +
                    "       ,[isPairing],\n" +
                    "       bf.achievement,\n" +
                    "       bf.reproductiveHistory,\n" +
                    "       birdTypeName\n" +
                    "       FROM [BIRD_FARM_SHOP].[dbo].[BirdProduct] bp\n" +
                    "       JOIN BirdProfile bf\n" +
                    "       ON bp.idBird = bf.idBird\n" +
                    "       JOIN BirdType bt\n" +
                    "       ON bp.idBirdSpecies = bt.idBirdType\n" +
                    "       Where bp.idBird = ?";
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
                    boolean isPairing = rs.getBoolean("isPairing");
                    bird
                            = new BirdDTO(idBird, name, overview, idBirdSpecies, quantity, 
                                    importPrice, salePrice, 
                                    imageURL, status, period, age, idFatherBird, idMotherBird, 
                                    mutation, gender, type, videoURL, shortDescription, 
                                    achievement, reproductiveHistory, species, isPairing);
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
     public BirdDTO getBirdPairing(String birdID) 
            throws SQLException, NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        BirdDTO bird = null;
        try {
            con = DBConnection.makeConnection();
            if (con != null) {
                String sql = " SELECT bp.[idBird]\n" +
"                           ,[name]\n" +
"                           ,[idBirdSpecies]\n" +
"                           ,[salePrice]\n" +
"                           ,[imageURL]\n" +
"                          ,[status]\n" +
"                          ,[period]\n" +
"                           ,bf.Age\n" +
"                           ,bf.mutation\n" +
"                           ,bf.gender\n" +
"                           ,[type]\n" +
"                           ,[shortDescription]\n" +
"                           ,[isPairing],\n" +
"                           bf.achievement,\n" +
"                           bf.reproductiveHistory,\n" +
"                           bf.[feeBirdNestMale],\n" +
"                           bf.[feeBirdNestFemale],\n" +
"                           birdTypeName\n" +
"                           FROM [BIRD_FARM_SHOP].[dbo].[BirdProduct] bp\n" +
"                           JOIN BirdProfile bf\n" +
"                           ON bp.idBird = bf.idBird\n" +
"                           JOIN BirdType bt\n" +
"                          ON bp.idBirdSpecies = bt.idBirdType\n" +
"                           Where bp.idBird = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, birdID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String idBird = rs.getString("idBird");
                    String name = rs.getString("name");
                    String idBirdSpecies = rs.getString("idBirdSpecies");
                    double salePrice = rs.getDouble("salePrice");
                    String imageURL = rs.getString("imageURL");
                    boolean status = rs.getBoolean("status");
                    String period = rs.getString("period");
                    String age = rs.getString("Age");
                    boolean mutation = rs.getBoolean("mutation");
                    String gender = rs.getString("gender");
                    int type = rs.getInt("type");
                    String shortDescription = rs.getString("shortDescription");
                    String achievement = rs.getString("achievement");
                    String reproductiveHistory = rs.getString("reproductiveHistory");
                    String species = rs.getString("birdTypeName");
                    boolean isPairing = rs.getBoolean("isPairing");
                    double feeBirdNestMale = rs.getDouble("feeBirdNestMale");
                    double feeBirdNestFemale = rs.getDouble("feeBirdNestFemale");
                    bird
                            = new BirdDTO(idBird, name, idBirdSpecies, salePrice, imageURL, 
                                    status, period, age, mutation, gender, type, shortDescription, 
                                    achievement, reproductiveHistory, species, 
                                    isPairing, feeBirdNestMale, feeBirdNestFemale);
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
    public BirdDTO getFatherAndMotherBird (String birdID) 
            throws SQLException, NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        BirdDTO bird = null;
        try {
            con = DBConnection.makeConnection();
            if (con != null) {
                String sql = "SELECT " +
                    "       [name]\n" +
                    "       ,[imageURL]\n" +
                    "       ,bf.mutation\n" +
                    "       ,[shortDescription],\n" +
                    "       bf.achievement,\n" +
                    "       bf.reproductiveHistory\n" +
                    "       FROM [BIRD_FARM_SHOP].[dbo].[BirdProduct] bp\n" +
                    "       JOIN BirdProfile bf\n" +
                    "       ON bp.idBird = bf.idBird\n" +
                    "       JOIN BirdType bt\n" +
                    "       ON bp.idBirdSpecies = bt.idBirdType\n" +
                    "       Where bp.idBird = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, birdID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String name = rs.getString("name");
                    String imageURL = rs.getString("imageURL");
                    boolean mutation = rs.getBoolean("mutation");
                    String shortDescription = rs.getString("shortDescription");
                    String achievement = rs.getString("achievement");
                    String reproductiveHistory = rs.getString("reproductiveHistory");
                    bird
                            = new BirdDTO(name, imageURL,mutation, shortDescription, 
                                    achievement, reproductiveHistory);
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
                String sql = " SELECT  bp.[idBird]\n" +
                            "       ,[name]\n" +
                            "       ,[overview]\n" +
                            "       ,[idBirdSpecies]\n" +
                            "       ,[quantity]\n" +
                            "       ,[importPrice]\n" +
                            "       ,[salePrice]\n" +
                            "       ,[imageURL]\n" +
                            "       ,[status]\n" +
                            "       ,[period]\n" +
                            "       ,[type]\n" +
                            "       ,[videoURL]\n" +
                            "       ,[shortDescription]\n" +
                "                  ,bf.[Age],\n" +
                "                  bf.[idFatherBird],\n" +
                "                  bf.[idMotherBird],\n" +
                "                  bf.[mutation],\n" +
                "                  bf.[gender]\n" +
                "                  FROM [BIRD_FARM_SHOP].[dbo].[BirdProduct] bp\n" +
                "		   Join BirdProfile bf \n" +
                "		   ON bp.idBird = bf.idBird  \n" +
                "                 Where [name] LIKE ?";
                // Join lại với BirdProfile
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
                                    salePrice, imageURL, 
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
                String sql = "SELECT bp.[idBird],\n" +
                    "		  [name],\n" +
                    "          [overview],\n" +
                    "          [idBirdSpecies],\n" +
                    "          [quantity],\n" +
                    "          [importPrice],\n" +
                    "          [salePrice],\n" +
                    "          [imageURL],\n" +
                    "          [status],\n" +
                    "          [period],\n" +
                    "          bf.[Age],\n" +
                    "          bf.[idFatherBird],\n" +
                    "          bf.[idMotherBird],\n" +
                    "          bf.[mutation],\n" +
                    "          bf.[gender],\n" +
                    "          [type],\n" +
                    "          [videoURL],\n" +
                    "          [shortDescription]\n" +
                    "          FROM [BIRD_FARM_SHOP].[dbo].[BirdProduct] bp\n" +
                    "          Join BirdProfile bf \n" +
                    "        　ON bp.idBird = bf.idBird  \n" +
                    "          Where type = ?";
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
                                    imageURL, status, 
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
    
    public void getAllSpecies() 
            throws SQLException, NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBConnection.makeConnection();
            if (con != null) {
                String sql = " Select idBirdType, birdTypeName \n" +
                            "  From BirdType  ";
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int idBirdType = rs.getInt("idBirdType");
                    String birdTypeName = rs.getString("birdTypeName");
                    BirdTypeDTO birdType = new BirdTypeDTO(idBirdType, birdTypeName);
                    if(this.birdTypeList == null) {
                        this.birdTypeList = new ArrayList<>();
                    }
                    this.birdTypeList.add(birdType);
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
    public boolean updateQuantity(BirdDTO productInCart) throws SQLException {
        BirdDTO product = null;
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            product = getBirdByID(productInCart.getIdBird());
            if (product.getQuantity() >= productInCart.getQuantity()) {
                int newQuantity = product.getQuantity() - productInCart.getQuantityOfUser();
                conn = DBConnection.makeConnection();
                ptm = conn.prepareStatement(UPDATE_QUANTITY);
                ptm.setInt(1, newQuantity);
                ptm.setString(2, product.getIdBird());
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
    
    public List<BirdDTO> getListMale()  
            throws SQLException, NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        this.birdMaleList = null;
        try {
            con = DBConnection.makeConnection();
            if (con != null) {
                String sql = "Select bp.idBird, achievement, reproductiveHistory, Age, mutation,\n" +
"                        feeBirdNestMale,feeBirdNestFemale,bp.name, \n" +
"                        bp.shortDescription, bt.birdTypeName, bp.salePrice, \n" +
"                        bp.isPairing, bp.imageURL, bp.period \n" +
"                        From BirdProfile bf\n" +
"                        Join BirdProduct bp\n" +
"                        ON bf.idBird = bp.idBird \n" +
"                        Join BirdType bt\n" +
"                        On bp.idBirdSpecies = bt.idBirdType\n" +
"                        Where bf.gender = N'Trống' AND bp.type =4 AND isPairing = 'False'";
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String idBird = rs.getString("idBird");
                    String achievement = rs.getString("achievement");
                    String reproductiveHistory = rs.getString("reproductiveHistory");
                    String age = rs.getString("Age");
                    boolean mutation = rs.getBoolean("mutation");
                    double feeBirdNestMale = rs.getDouble("feeBirdNestMale");
                    double feeBirdNestFemale = rs.getDouble("feeBirdNestFemale");
                    String name = rs.getString("name");
                    String shortDescription = rs.getString("shortDescription");
                    String birdTypeName = rs.getString("birdTypeName");
                    double salePrice = rs.getDouble("salePrice");
                    boolean isPairing = rs.getBoolean("isPairing");
                    String imageURL = rs.getString("imageURL");
                    String period = rs.getString("period");
                    BirdDTO bird = new BirdDTO(idBird, name, salePrice, imageURL, period, age, mutation,shortDescription,achievement, reproductiveHistory,birdTypeName,isPairing,feeBirdNestMale, feeBirdNestFemale);
                    if(this.birdMaleList == null) {
                        this.birdMaleList = new ArrayList<>();
                    }
                    this.birdMaleList.add(bird);
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
        return birdMaleList;
    }
     public List<BirdDTO> getListFemale()  
            throws SQLException, NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBConnection.makeConnection();
            if (con != null) {
                String sql = " Select bp.idBird, achievement, reproductiveHistory, Age, mutation,\n" +
"                        feeBirdNestMale,feeBirdNestFemale,bp.name, \n" +
"                        bp.shortDescription, bt.birdTypeName, bp.salePrice, \n" +
"                        bp.isPairing, bp.imageURL, bp.period \n" +
"                        From BirdProfile bf\n" +
"                        Join BirdProduct bp\n" +
"                        ON bf.idBird = bp.idBird \n" +
"                        Join BirdType bt\n" +
"                        On bp.idBirdSpecies = bt.idBirdType\n" +
"                        Where bf.gender = N'Mái' AND bp.type =4 AND isPairing = 'False'";
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String idBird = rs.getString("idBird");
                    String achievement = rs.getString("achievement");
                    String reproductiveHistory = rs.getString("reproductiveHistory");
                    String age = rs.getString("Age");
                    boolean mutation = rs.getBoolean("mutation");
                    double feeBirdNestMale = rs.getDouble("feeBirdNestMale");
                    double feeBirdNestFemale = rs.getDouble("feeBirdNestFemale");
                    String name = rs.getString("name");
                    String shortDescription = rs.getString("shortDescription");
                    String birdTypeName = rs.getString("birdTypeName");
                    double salePrice = rs.getDouble("salePrice");
                    boolean isPairing = rs.getBoolean("isPairing");
                    String imageURL = rs.getString("imageURL");
                    String period = rs.getString("period");
                    BirdDTO bird = new BirdDTO(idBird, name, salePrice, imageURL, period, age, mutation,shortDescription,achievement, reproductiveHistory,birdTypeName,isPairing,feeBirdNestMale, feeBirdNestFemale);
                    if(this.birdFemaleList == null) {
                        this.birdFemaleList = new ArrayList<>();
                    }
                    this.birdFemaleList.add(bird);
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
        return birdFemaleList;
    }
}
