/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package birdfarm.dto;

/**
 *
 * @author ASUS
 */
public class BirdTypeDTO {
    private int idBirdType;
    private String birdTypeName;
    
    public BirdTypeDTO() {
        
    }

    public BirdTypeDTO(int idBirdType, String birdTypeName) {
        this.idBirdType = idBirdType;
        this.birdTypeName = birdTypeName;
    }
    
    /**
     * @return the idBirdType
     */
    public int getIdBirdType() {
        return idBirdType;
    }

    /**
     * @param idBirdType the idBirdType to set
     */
    public void setIdBirdType(int idBirdType) {
        this.idBirdType = idBirdType;
    }

    /**
     * @return the birdTypeName
     */
    public String getBirdTypeName() {
        return birdTypeName;
    }

    /**
     * @param birdTypeName the birdTypeName to set
     */
    public void setBirdTypeName(String birdTypeName) {
        this.birdTypeName = birdTypeName;
    }
    
    
}
