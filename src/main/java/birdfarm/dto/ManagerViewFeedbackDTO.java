/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package birdfarm.dto;


import java.io.Serializable;
import java.sql.Date;

/**
 *
 * @author HP
 */
public class ManagerViewFeedbackDTO implements Serializable{
    private String idUser;
    private String fullName;
    private String roleName;
    private String phoneNumber;
    private String email;
    private String content;
    private String createdDate;

    public ManagerViewFeedbackDTO(String fullName, String roleName, String phoneNumber, String email, String content) {
        this.fullName = fullName;
        this.roleName = roleName;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.content = content;
    }

    public ManagerViewFeedbackDTO(String fullName, String roleName, String phoneNumber, String email, String content, String createdDate) {
        this.fullName = fullName;
        this.roleName = roleName;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.content = content;
        this.createdDate = createdDate;
    }

    public String getIdUser() {
        return idUser;
    }

    public void setIdUser(String idUser) {
        this.idUser = idUser;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }
    
    
}
