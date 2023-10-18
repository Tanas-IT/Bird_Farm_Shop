/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package birdfarm.shopping;

import birdfarm.dto.BirdDTO;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 *
 * @author Minh
 */
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CheckOutProduct {
      private String idBird;
    private String name;
    private String overview;
    private String idBirdSpecies;
    private int quantity;
    private double importPrice;
    private double salePrice;
    private double total;
    private boolean isBirdNest;
    private boolean hasBirdProfile;
    private String imageURL;
    private boolean status; // còn hàng hay hết hàng
    private String period;
    private String age;
    private String idFatherBird;
    private String idMotherBird;
    private boolean mutation;
    private String gender;
    private int type;
    private String videoURL;
    private String shortDescription;
    private ArrayList<String> subImageURL;
    private BirdDTO fatherBird;
    private BirdDTO motherBird;
    private String isBuy;

    public CheckOutProduct(String idBird, String name, String overview, String idBirdSpecies, int quantity, double importPrice, double salePrice, boolean isBirdNest, boolean hasBirdProfile, String imageURL, boolean status, String period, String age, String idFatherBird, String idMotherBird, boolean mutation, String gender, int type, String videoURL, String shortDescription, ArrayList<String> subImageURL) {
        this.idBird = idBird;
        this.name = name;
        this.overview = overview;
        this.idBirdSpecies = idBirdSpecies;
        this.quantity = quantity;
        this.importPrice = importPrice;
        this.salePrice = salePrice;
        this.isBirdNest = isBirdNest;
        this.hasBirdProfile = hasBirdProfile;
        this.imageURL = imageURL;
        this.status = status;
        this.period = period;
        this.age = age;
        this.idFatherBird = idFatherBird;
        this.idMotherBird = idMotherBird;
        this.mutation = mutation;
        this.gender = gender;
        this.type = type;
        this.videoURL = videoURL;
        this.shortDescription = shortDescription;
        this.subImageURL = subImageURL;
    }
     public CheckOutProduct(String idBird, String name, String overview, String idBirdSpecies, int quantity, double importPrice, double salePrice, boolean isBirdNest, boolean hasBirdProfile, String imageURL, boolean status, String period, String age, String idFatherBird, String idMotherBird, boolean mutation, String gender, int type, String videoURL, String shortDescription, ArrayList<String> subImageURL, String isBuy) {
        this.idBird = idBird;
        this.name = name;
        this.overview = overview;
        this.idBirdSpecies = idBirdSpecies;
        this.quantity = quantity;
        this.importPrice = importPrice;
        this.salePrice = salePrice;
        this.isBirdNest = isBirdNest;
        this.hasBirdProfile = hasBirdProfile;
        this.imageURL = imageURL;
        this.status = status;
        this.period = period;
        this.age = age;
        this.idFatherBird = idFatherBird;
        this.idMotherBird = idMotherBird;
        this.mutation = mutation;
        this.gender = gender;
        this.type = type;
        this.videoURL = videoURL;
        this.shortDescription = shortDescription;
        this.subImageURL = subImageURL;
        this.isBuy = isBuy;
    }
    
    
    public CheckOutProduct(String idBird, String name, String overview, int quantity, double importPrice, double salePrice, String imageURL, String age, boolean mutation, boolean isBirdNest, String gender) {
        this.idBird = idBird;
        this.name = name;
        this.overview = overview;
        this.quantity = quantity;
        this.importPrice = importPrice;
        this.salePrice = salePrice;
        this.imageURL = imageURL;
        this.age = age;
        this.mutation = mutation;
        this.isBirdNest = isBirdNest;
        this.gender = gender;
    }

    public CheckOutProduct(String name, int quantity, double salePrice, String imageURL) {
        this.name = name;
        this.quantity = quantity;
        this.salePrice = salePrice;
        this.imageURL = imageURL;
    }

    public CheckOutProduct(String idBird, String name, int quantity, double salePrice, String imageURL) {
        this.idBird = idBird;
        this.name = name;
        this.quantity = quantity;
        this.salePrice = salePrice;
        this.imageURL = imageURL;
    }

    public CheckOutProduct(String idBird, String name, String overview, String idBirdSpecies, int quantity, double importPrice, double salePrice, boolean isBirdNest, boolean hasBirdProfile, String imageURL, boolean status, String period, String age, String idFatherBird, String idMotherBird, boolean mutation, String gender, int type, String videoURL, String shortDescription) {
        this.idBird = idBird;
        this.name = name;
        this.overview = overview;
        this.idBirdSpecies = idBirdSpecies;
        this.quantity = quantity;
        this.importPrice = importPrice;
        this.salePrice = salePrice;
        this.isBirdNest = isBirdNest;
        this.hasBirdProfile = hasBirdProfile;
        this.imageURL = imageURL;
        this.status = status;
        this.period = period;
        this.age = age;
        this.idFatherBird = idFatherBird;
        this.idMotherBird = idMotherBird;
        this.mutation = mutation;
        this.gender = gender;
        this.type = type;
        this.videoURL = videoURL;
        this.shortDescription = shortDescription;
    }
    
    public ArrayList<BirdDTO> getRandomBirds(List<BirdDTO> danhSachChim, BirdDTO conChimHienTai, int soLuong) {
        ArrayList<BirdDTO> conChimNgauNhien = new ArrayList<>();
        Random random = new Random();
        
        while (conChimNgauNhien.size() < soLuong) {
            int index = random.nextInt(danhSachChim.size());
            BirdDTO chim = danhSachChim.get(index);
            
            if (!conChimNgauNhien.contains(chim) && !chim.equals(conChimHienTai) && chim.getType() != 4) {
                conChimNgauNhien.add(chim);
            }
        }
        return conChimNgauNhien;
    }

    /**
     * @return the idBird
     */
    public String getIdBird() {
        return idBird;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @return the overview
     */
    public String getOverview() {
        return overview;
    }

    /**
     * @return the idBirdSpecies
     */
    public String getIdBirdSpecies() {
        return idBirdSpecies;
    }

    /**
     * @return the quantity
     */
    public int getQuantity() {
        return quantity;
    }

    /**
     * @return the importPrice
     */
    public double getImportPrice() {
        return importPrice;
    }

    /**
     * @return the salePrice
     */
    public double getSalePrice() {
        return salePrice;
    }

    /**
     * @return the total
     */
    public double getTotal() {
        return total;
    }

    /**
     * @return the isBirdNest
     */
    public boolean isIsBirdNest() {
        return isBirdNest;
    }

    /**
     * @param isBirdNest the isBirdNest to set
     */
    public void setIsBirdNest(boolean isBirdNest) {
        this.isBirdNest = isBirdNest;
    }

    /**
     * @return the hasBirdProfile
     */
    public boolean isHasBirdProfile() {
        return hasBirdProfile;
    }

    /**
     * @return the imageURL
     */
    public String getImageURL() {
        return imageURL;
    }

    /**
     * @return the status
     */
    public boolean isStatus() {
        return status;
    }

    /**
     * @return the period
     */
    public String getPeriod() {
        return period;
    }

    /**
     * @return the age
     */
    public String getAge() {
        return age;
    }

    /**
     * @return the idFatherBird
     */
    public String getIdFatherBird() {
        return idFatherBird;
    }

    /**
     * @return the idMotherBird
     */
    public String getIdMotherBird() {
        return idMotherBird;
    }

    /**
     * @return the mutation
     */
    public boolean isMutation() {
        return mutation;
    }

    /**
     * @return the gender
     */
    public String getGender() {
        return gender;
    }

    /**
     * @return the type
     */
    public int getType() {
        return type;
    }

    /**
     * @return the videoURL
     */
    public String getVideoURL() {
        return videoURL;
    }

    /**
     * @return the shortDescription
     */
    public String getShortDescription() {
        return shortDescription;
    }

    /**
     * @return the subImageURL
     */
    public ArrayList<String> getSubImageURL() {
        return subImageURL;
    }

    /**
     * @return the fatherBird
     */
    public BirdDTO getFatherBird() {
        return fatherBird;
    }

    /**
     * @return the motherBird
     */
    public BirdDTO getMotherBird() {
        return motherBird;
    }

    /**
     * @return the isBuy
     */
    public String getIsBuy() {
        return isBuy;
    }
    
}

