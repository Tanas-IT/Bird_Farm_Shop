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
public class ManagerOrderDTO implements Serializable{
    private int idOrder;
    private String idUser;
    private String createdDate;
    private String status;
    private Double Total;
    private Double deliveryCost;
    private String deliveryDate;
    private int usePoint;
    private String receiverAddress;
    private String Note;
    private String receiverPhoneNumber;
    private String receiverName;
    private String name;
    
    private int idOrderDetail;
    private String idBirdProduct;
    private int quantity;
    private Double price;
    private Double total;
    
    private String fullName; 
    private String phoneNumber;

    public ManagerOrderDTO(String createdDate, Double Total, Double deliveryCost, String receiverAddress, String receiverPhoneNumber, String receiverName, String name, int quantity, Double price) {
        this.createdDate = createdDate;
        this.Total = Total;
        this.deliveryCost = deliveryCost;
        this.receiverAddress = receiverAddress;
        this.receiverPhoneNumber = receiverPhoneNumber;
        this.receiverName = receiverName;
        this.name = name;
        this.quantity = quantity;
        this.price = price;
    }


    
    
    
}
