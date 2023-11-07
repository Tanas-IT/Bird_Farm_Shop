/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package birdfarm.dto;

import java.io.Serializable;

/**
 *
 * @author HP
 */
public class ManagerProductDTO implements Serializable {

    private String idBird;
    private String name;
    private String overview;
    private int quantity;
    private Double importPrice;
    private Double salePrice;
    private String imageURL;
    private String period;
    private boolean status;
    private String videoURL;

    /*  SELECT b.idBird, b.[name], b.overview, 
                        b.quantity, b.importPrice, b.salePrice, 
                        b.imageURL, b.videoURL, b.period, b.status, b.shortDescription, b.type, 
                        from BirdProduct b
						Join BirdProfile bp on b.idBird = bp.[idBird]
                        WHERE b.idBird = 'BC01' */
    //============================
    private String shortDescription;
    private int type;
    private int idBirdSpecies;
    private String birdTypeName;
    private String age;
    private Double feeBirdNestMale;
    private Double feeBirdNestFemale;
    private String achievement;
    private String gender;
    private String birdFather;
    private String birdMother;
    //============================

    public ManagerProductDTO(String idBird, String name, String overview, int quantity, Double importPrice, Double salePrice, String imageURL, String period, boolean status, String videoURL, String shortDescription, int type, int idBirdSpecies, String birdTypeName, String age, Double feeBirdNestMale, Double feeBirdNestFemale, String achievement, String gender, String birdFather, String birdMother) {
        this.idBird = idBird;
        this.name = name;
        this.overview = overview;
        this.quantity = quantity;
        this.importPrice = importPrice;
        this.salePrice = salePrice;
        this.imageURL = imageURL;
        this.period = period;
        this.status = status;
        this.videoURL = videoURL;
        this.shortDescription = shortDescription;
        this.type = type;
        this.idBirdSpecies = idBirdSpecies;
        this.birdTypeName = birdTypeName;
        this.age = age;
        this.feeBirdNestMale = feeBirdNestMale;
        this.feeBirdNestFemale = feeBirdNestFemale;
        this.achievement = achievement;
        this.gender = gender;
        this.birdFather = birdFather;
        this.birdMother = birdMother;
    }

    public ManagerProductDTO(String name, int quantity, Double salePrice, String period, String idBird) {
        this.name = name;
        this.quantity = quantity;
        this.salePrice = salePrice;
        this.period = period;
        this.idBird = idBird;
    }
    public ManagerProductDTO(String name, int quantity, Double salePrice, String period, String idBird, String gender) {
        this.name = name;
        this.quantity = quantity;
        this.salePrice = salePrice;
        this.period = period;
        this.idBird = idBird;
        this.gender = gender;
    }

    public Double getFeeBirdNestMale() {
        return feeBirdNestMale;
    }

    public void setFeeBirdNestMale(Double feeBirdNestMale) {
        this.feeBirdNestMale = feeBirdNestMale;
    }

    public Double getFeeBirdNestFemale() {
        return feeBirdNestFemale;
    }

    public void setFeeBirdNestFemale(Double feeBirdNestFemale) {
        this.feeBirdNestFemale = feeBirdNestFemale;
    }

    public String getShortDescription() {
        return shortDescription;
    }

    public void setShortDescription(String shortDescription) {
        this.shortDescription = shortDescription;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public int getIdBirdSpecies() {
        return idBirdSpecies;
    }

    public void setIdBirdSpecies(int idBirdSpecies) {
        this.idBirdSpecies = idBirdSpecies;
    }

    public String getBirdTypeName() {
        return birdTypeName;
    }

    public void setBirdTypeName(String birdTypeName) {
        this.birdTypeName = birdTypeName;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getAchievement() {
        return achievement;
    }

    public void setAchievement(String achievement) {
        this.achievement = achievement;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getBirdFather() {
        return birdFather;
    }

    public void setBirdFather(String birdFather) {
        this.birdFather = birdFather;
    }

    public String getBirdMother() {
        return birdMother;
    }

    public void setBirdMother(String birdMother) {
        this.birdMother = birdMother;
    }

    public String getVideoURL() {
        return videoURL;
    }

    public void setVideoURL(String videoURL) {
        this.videoURL = videoURL;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Double getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(Double salePrice) {
        this.salePrice = salePrice;
    }

    public String getPeriod() {
        return period;
    }

    public void setPeriod(String period) {
        this.period = period;
    }

    public String getIdBird() {
        return idBird;
    }

    public void setIdBird(String idBird) {
        this.idBird = idBird;
    }

    public String getOverview() {
        return overview;
    }

    public void setOverview(String overview) {
        this.overview = overview;
    }

    public Double getImportPrice() {
        return importPrice;
    }

    public void setImportPrice(Double importPrice) {
        this.importPrice = importPrice;
    }

    public String getImageURL() {
        return imageURL;
    }

    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

}
