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
     private RoleDTO roleDTO;
    public UserDTO() {
        
    }

    public UserDTO(String idUser, String username, String password, String fullName, int idRole, RoleDTO roleDTO) {
        this.idUser = idUser;
        this.username = username;
        this.password = password;
        this.fullName = fullName;
        this.idRole = idRole;
        this.roleDTO = roleDTO;
    }
     public UserDTO(String idUser, String username, String password, String fullName, int idRole) {
        this.idUser = idUser;
        this.username = username;
        this.password = password;
        this.fullName = fullName;
        this.idRole = idRole;
    }
    /**
     * @return the idUser
     */
    public String getIdUser() {
        return idUser;
    }

    /**
     * @param idUser the idUser to set
     */
    public void setIdUser(String idUser) {
        this.idUser = idUser;
    }

    /**
     * @return the username
     */
    public String getUsername() {
        return username;
    }

    /**
     * @param username the username to set
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * @return the fullName
     */
    public String getFullName() {
        return fullName;
    }

    /**
     * @param fullName the fullName to set
     */
    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    /**
     * @return the idRole
     */
    public int getIdRole() {
        return idRole;
    }

    /**
     * @param idRole the idRole to set
     */
    public void setIdRole(int idRole) {
        this.idRole = idRole;
    }

    /**
     * @return the roleDTO
     */
    public RoleDTO getRoleDTO() {
        return roleDTO;
    }

    /**
     * @param roleDTO the roleDTO to set
     */
    public void setRoleDTO(RoleDTO roleDTO) {
        this.roleDTO = roleDTO;
    }

    @Override
    public String toString() {
        return "UserDTO{" + "idUser=" + getIdUser() + ", username=" + getUsername() + ", password=" + getPassword() + ", fullName=" + getFullName() + ", idRole=" + getIdRole() + '}';
    }
}
