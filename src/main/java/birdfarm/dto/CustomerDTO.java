/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package birdfarm.dto;

import java.io.Serializable;

/**
 *
 * @author ASUS
 */
public class CustomerDTO implements Serializable{
    private String idCustomer;
    private String address;
    private String phoneNumber;
    private String email;
    private String image;
    public CustomerDTO() {
        
    }

    public CustomerDTO(String idCustomer, String address, String phoneNumber, String email, String image) {
        this.idCustomer = idCustomer;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.image = image;
    }
    public CustomerDTO(String idCustomer, String address, String phoneNumber, String email) {
        this.idCustomer = idCustomer;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.email = email;
    }

    public CustomerDTO(String address, String phoneNumber, String email) {
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.email = email;
    }

    /**
     * @return the idCustomer
     */
    public String getIdCustomer() {
        return idCustomer;
    }

    /**
     * @param idCustomer the idCustomer to set
     */
    public void setIdCustomer(String idCustomer) {
        this.idCustomer = idCustomer;
    }

    /**
     * @return the address
     */
    public String getAddress() {
        return address;
    }

    /**
     * @param address the address to set
     */
    public void setAddress(String address) {
        this.address = address;
    }

    /**
     * @return the phoneNumber
     */
    public String getPhoneNumber() {
        return phoneNumber;
    }

    /**
     * @param phoneNumber the phoneNumber to set
     */
    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }
    
    public String getImage() {
        return image;
    }

    /**
     * @param image the email to set
     */
    public void setImage(String image) {
        this.image = image;
    }
    
}
