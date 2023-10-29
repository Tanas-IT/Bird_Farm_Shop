/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package birdfarm.dto;

import java.io.Serializable;
import java.sql.Date;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 *
 * @author HP
 */
@Builder
@Getter
@Setter
@ToString
public class DateDTO implements Serializable{
    private java.sql.Date start;
    private java.sql.Date end;
    
}
