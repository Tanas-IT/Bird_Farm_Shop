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
public class ManagerOrderDTO implements Serializable {

    private int idOrder;
    private String idUser;
    private String createdDate;
    private String status;
    private Double total;

    private String receiverAddress;
    private String note;
    private String receiverPhoneNumber;
    private String receiverName;
    private String name;
    private String imageURL;

    private int idOrderDetail;
    private String idBirdProduct;
    private int quantity;
    private Double price;

    private String fullName;
    private String phoneNumber;
    private String paymentName;

    public ManagerOrderDTO(int idOrder, String createdDate, String status, Double total, String receiverPhoneNumber, String fullName) {
        this.idOrder = idOrder;
        this.createdDate = createdDate;
        this.status = status;
        this.total = total;
        this.receiverPhoneNumber = receiverPhoneNumber;
        this.fullName = fullName;
    }

    public ManagerOrderDTO(int idOrder, String createdDate, String status, 
            String receiverAddress, String receiverPhoneNumber, String fullName, String paymentName) {
        this.idOrder = idOrder;
        this.createdDate = createdDate;
        this.status = status;
        this.receiverAddress = receiverAddress;
        this.receiverPhoneNumber = receiverPhoneNumber;
        this.fullName = fullName;
        this.paymentName = paymentName;
    }

    public ManagerOrderDTO() {
    }

    public ManagerOrderDTO(int idOrder, String createdDate, String receiverAddress,
            String receiverPhoneNumber, String name, String imageURL, int quantity,
            Double price, String fullName, String note, String paymentName) {
        this.idOrder = idOrder;
        this.createdDate = createdDate;
        this.receiverAddress = receiverAddress;
        this.receiverPhoneNumber = receiverPhoneNumber;
        this.name = name;
        this.imageURL = imageURL;
        this.quantity = quantity;
        this.price = price;
        this.fullName = fullName;
        this.note = note;
        this.paymentName = paymentName;
    }

    public String getPaymentName() {
        return paymentName;
    }

    public void setPaymentName(String paymentName) {
        this.paymentName = paymentName;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getImageURL() {
        return imageURL;
    }

    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
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
        return total;
    }

    public void setTotal(Double Total) {
        this.total = total;
    }

    public String getReceiverAddress() {
        return receiverAddress;
    }

    public void setReceiverAddress(String receiverAddress) {
        this.receiverAddress = receiverAddress;
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
