/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package birdfarm.dto;

import java.io.Serializable;

/**
 *
 * @author Admin
 */
public class BirdPairingDTO implements Serializable{
    private String name;
    private String overview;
    private int idBirdType;
    private float salePrice;
    private String imageURL;
    private String age;
    private boolean mutation;

    public BirdPairingDTO() {
    }

    public BirdPairingDTO(String name, String overview, int idBirdType, float salePrice, String imageURL, String age, boolean mutation) {
        this.name = name;
        this.overview = overview;
        this.idBirdType = idBirdType;
        this.salePrice = salePrice;
        this.imageURL = imageURL;
        this.age = age;
        this.mutation = mutation;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getOverview() {
        return overview;
    }

    public void setOverview(String overview) {
        this.overview = overview;
    }

    public int getIdBirdType() {
        return idBirdType;
    }

    public void setIdBirdType(int idBirdType) {
        this.idBirdType = idBirdType;
    }

    public float getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(float salePrice) {
        this.salePrice = salePrice;
    }

    public String getImageURL() {
        return imageURL;
    }

    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public boolean isMutation() {
        return mutation;
    }

    public void setMutation(boolean mutation) {
        this.mutation = mutation;
    }

    @Override
    public String toString() {
        return "BirdPairingDTO{" + "name=" + name + ", overview=" + overview + ", idBirdType=" + idBirdType + ", salePrice=" + salePrice + ", imageURL=" + imageURL + ", age=" + age + ", mutation=" + mutation + '}';
    }
    
    
    
}
