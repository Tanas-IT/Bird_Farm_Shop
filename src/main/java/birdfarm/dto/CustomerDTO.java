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
public class CustomerDTO {
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

    public String getIdCustomer() {
        return idCustomer;
    }

    public void setIdCustomer(String idCustomer) {
        this.idCustomer = idCustomer;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

   
}
