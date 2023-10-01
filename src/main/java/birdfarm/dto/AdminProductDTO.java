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
public class AdminProductDTO implements Serializable {

    private String idBird;
    private String name;
    private int quantity;
    private float salePrice;
    private boolean isBirdNest;
    private boolean status;

    public AdminProductDTO() {
    }

    public AdminProductDTO(String idBird, String name, int quantity, float salePrice, boolean isBirdNest, boolean status) {
        this.idBird = idBird;
        this.name = name;
        this.quantity = quantity;
        this.salePrice = salePrice;
        this.isBirdNest = isBirdNest;
        this.status = status;
    }

    public String getIdBird() {
        return idBird;
    }

    public void setIdBird(String idBird) {
        this.idBird = idBird;
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

    public float getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(float salePrice) {
        this.salePrice = salePrice;
    }

    public boolean isIsBirdNest() {
        return isBirdNest;
    }

    public void setIsBirdNest(boolean isBirdNest) {
        this.isBirdNest = isBirdNest;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
    
    

}
