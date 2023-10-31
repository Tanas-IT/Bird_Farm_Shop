/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package birdfarm.dto;

/**
 *
 * @author Admin
 */
public class UserDTO {
     private String idUser;
     private String username;
     private String password;
     private String fullName;
     private int idRole;    
     private String image;
     private String phoneNumber;
     private String address;
     private String email;
     private String roleName;
    public UserDTO() {
    }

    public UserDTO(String idUser, String username, String password, String fullName, int idRole) {
        this.idUser = idUser;
        this.username = username;
        this.password = password;
        this.fullName = fullName;
        this.idRole = idRole;
    }
    public UserDTO(String idUser, String username, String password, String fullName, int idRole, String image) {
        this.idUser = idUser;
        this.username = username;
        this.password = password;
        this.fullName = fullName;
        this.idRole = idRole;
        this.image = image;
    }

    public UserDTO(String idUser, String username, String password, String fullName, int idRole, String image, String roleName) {
        this.idUser = idUser;
        this.username = username;
        this.password = password;
        this.fullName = fullName;
        this.idRole = idRole;
        this.image = image;
        this.roleName = roleName;
    }

    public UserDTO(String idUser, String username, String password, String fullName, int idRole, String image, String phoneNumber, String address, String email) {
        this.idUser = idUser;
        this.username = username;
        this.password = password;
        this.fullName = fullName;
        this.idRole = idRole;
        this.image = image;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.email = email;
    }

    

   
    
    public String getIdUser() {
        return idUser;
    }

    public void setIdUser(String idUser) {
        this.idUser = idUser;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public int getIdRole() {
        return idRole;
    }

    public void setIdRole(int idRole) {
        this.idRole = idRole;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }
    
      /**
     * @return the image
     */
    public String getImage() {
        return image;
    }

    /**
     * @param image the image to set
     */
    public void setImage(String image) {
        this.image = image;
    }
    
    
    @Override
    public String toString() {
        return "UserDTO{" + "idUser=" + idUser + ", username=" + username + ", password=" + password + ", fullName=" + fullName + ", idRole=" + idRole + '}';
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
    
  


}
