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
    
    private String fullName; 
    private String phoneNumber;



    public ManagerOrderDTO(int idOrder, String createdDate, String receiverPhoneNumber, String fullName) {
        this.idOrder = idOrder;
        this.createdDate = createdDate;
        this.receiverPhoneNumber = receiverPhoneNumber;
        this.fullName = fullName;
    }

    public ManagerOrderDTO(int idOrder, String createdDate, String receiverAddress, String receiverPhoneNumber, String name, int quantity, Double price, String fullName) {
        this.idOrder = idOrder;
        this.createdDate = createdDate;
        this.receiverAddress = receiverAddress;
        this.receiverPhoneNumber = receiverPhoneNumber;
        this.name = name;
        this.quantity = quantity;
        this.price = price;
        this.fullName = fullName;
    }

    public int getIdOrder() {
        return idOrder;
    }

    public void setIdOrder(int idOrder) {
        this.idOrder = idOrder;
    }

    public String getIdUser() {
        return idUser;
    }

    public void setIdUser(String idUser) {
        this.idUser = idUser;
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Double getTotal() {
        return Total;
    }

    public void setTotal(Double Total) {
        this.Total = Total;
    }

    public Double getDeliveryCost() {
        return deliveryCost;
    }

    public void setDeliveryCost(Double deliveryCost) {
        this.deliveryCost = deliveryCost;
    }

    public String getDeliveryDate() {
        return deliveryDate;
    }

    public void setDeliveryDate(String deliveryDate) {
        this.deliveryDate = deliveryDate;
    }

    public int getUsePoint() {
        return usePoint;
    }

    public void setUsePoint(int usePoint) {
        this.usePoint = usePoint;
    }

    public String getReceiverAddress() {
        return receiverAddress;
    }

    public void setReceiverAddress(String receiverAddress) {
        this.receiverAddress = receiverAddress;
    }

    public String getNote() {
        return Note;
    }

    public void setNote(String Note) {
        this.Note = Note;
    }

    public String getReceiverPhoneNumber() {
        return receiverPhoneNumber;
    }

    public void setReceiverPhoneNumber(String receiverPhoneNumber) {
        this.receiverPhoneNumber = receiverPhoneNumber;
    }

    public String getReceiverName() {
        return receiverName;
    }

    public void setReceiverName(String receiverName) {
        this.receiverName = receiverName;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getIdOrderDetail() {
        return idOrderDetail;
    }

    public void setIdOrderDetail(int idOrderDetail) {
        this.idOrderDetail = idOrderDetail;
    }

    public String getIdBirdProduct() {
        return idBirdProduct;
    }

    public void setIdBirdProduct(String idBirdProduct) {
        this.idBirdProduct = idBirdProduct;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
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

 
    
}
