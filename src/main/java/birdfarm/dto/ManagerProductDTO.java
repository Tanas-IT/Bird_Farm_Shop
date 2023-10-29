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
public class ManagerProductDTO implements Serializable{
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


    public ManagerProductDTO(String idBird, String name, String overview, int quantity, Double importPrice, Double salePrice, String imageURL, String period, boolean status, String videoURL) {
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
    }
  
    
    public ManagerProductDTO(String name, int quantity, Double salePrice, String period, String idBird) {
        this.name = name;
        this.quantity = quantity;
        this.salePrice = salePrice;
        this.period = period;
        this.idBird = idBird;
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
