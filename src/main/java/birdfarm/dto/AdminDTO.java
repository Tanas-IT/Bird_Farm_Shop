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
public class AdminDTO implements Serializable {
    private String idUser;
    private String userName;
    private String password;
    private String fullName;
    private String phoneNumber;
    private String roleName;
    
    private String methodName; 
    private int idPayment;

    public AdminDTO(String methodName, int idPayment) {
        this.methodName = methodName;
        this.idPayment = idPayment;
    }
    
    

    public AdminDTO(String idUser, String userName, String password, String fullName, String phoneNumber, String roleName) {
        this.idUser = idUser;
        this.userName = userName;
        this.password = password;
        this.fullName = fullName;
        this.phoneNumber = phoneNumber;
        this.roleName = roleName;
    }

    public AdminDTO(String idUser, String userName, String password, String fullName, String roleName) {
        this.idUser = idUser;
        this.userName = userName;
        this.password = password;
        this.fullName = fullName;
        this.roleName = roleName;
    }

    public AdminDTO() {
    }

    public String getMethodName() {
        return methodName;
    }

    public void setMethodName(String methodName) {
        this.methodName = methodName;
    }

    public int getIdPayment() {
        return idPayment;
    }

    public void setIdPayment(int idPayment) {
        this.idPayment = idPayment;
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

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }
    
}
