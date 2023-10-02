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

    private String name;
    private int quantity;
    private Double salePrice;
    private String lifeExpectancy;
    private String idBird;

    public AdminProductDTO(String name, int quantity, Double salePrice, String lifeExpectancy, String idBird) {
        this.name = name;
        this.quantity = quantity;
        this.salePrice = salePrice;
        this.lifeExpectancy = lifeExpectancy;
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

    public Double getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(Double salePrice) {
        this.salePrice = salePrice;
    }

    public String getLifeExpectancy() {
        return lifeExpectancy;
    }

    public void setLifeExpectancy(String lifeExpectancy) {
        this.lifeExpectancy = lifeExpectancy;
    }

    public String getIdBird() {
        return idBird;
    }

    public void setIdBird(String idBird) {
        this.idBird = idBird;
    }



}
