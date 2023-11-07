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
public class ManagerCreateErrorDTO implements Serializable {

    private String idBirdIsExisted;

    public String getIdBirdIsExisted() {
        return idBirdIsExisted;
    }

    public void setIdBirdIsExisted(String idBirdIsExisted) {
        this.idBirdIsExisted = idBirdIsExisted;
    }

}
