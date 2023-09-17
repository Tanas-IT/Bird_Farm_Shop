/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTODAO;

/**
 *
 * @author Admin
 */
public class DTO {
     private String idUser;
     private String userName;
     private String password;
     private String email;
     private String address;
     private String phoneNumber;
     private int idRole;    

    public DTO() {
    }

    public DTO(String idUser, String userName, String password, String email, String address, String phoneNumber, int idRole) {
        this.idUser = idUser;
        this.userName = userName;
        this.password = password;
        this.email = email;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.idRole = idRole;
    }

    public String getIdUser() {
        return idUser;
    }

    public void setIdUser(String idUser) {
        this.idUser = idUser;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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

    public int getIdRole() {
        return idRole;
    }

    public void setIdRole(int idRole) {
        this.idRole = idRole;
    }

    @Override
    public String toString() {
        return "DTO{" + "idUser=" + idUser + ", userName=" + userName + ", password=" + password + ", email=" + email + ", address=" + address + ", phoneNumber=" + phoneNumber + ", idRole=" + idRole + '}';
    }
    
    
}
