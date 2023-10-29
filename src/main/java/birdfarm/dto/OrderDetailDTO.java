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
 * @author Minh
 */
public class OrderDetailDTO implements Serializable{
    private int idOrderDetail;
    private int idOrder;
    private String idBirdProduct;
    private int quantity;
    private double price;
    private double totalPrice;
    private BirdDTO bird;
    private Date createdDate;
    private String fullName;
    private CustomerDTO customer;
    private String status;
    private String note;
    private String receiverName;
    private String receiverAddress;
    private String receiverPhoneNumber;
    private String email;
  
                       
    public OrderDetailDTO() {
    }

    public OrderDetailDTO(int idOrderDetail, int idOrder, String idBirdProduct, int quantity, double price, double totalPrice) {
        this.idOrderDetail = idOrderDetail;
        this.idOrder = idOrder;
        this.idBirdProduct = idBirdProduct;
        this.quantity = quantity;
        this.price = price;
        this.totalPrice = totalPrice;
    }
     public OrderDetailDTO(int idOrder, int quantity, double price, double totalPrice, BirdDTO bird, Date createdDate, String fullName, String status, String note, String idBirdProduct) {
        this.idOrder = idOrder;
        this.quantity = quantity;
        this.price = price;
        this.totalPrice = totalPrice;
        this.bird = bird;
        this.createdDate = createdDate;
        this.fullName = fullName;
        this.status = status;
        this.note = note;
        this.idBirdProduct = idBirdProduct;
    }
    
    public OrderDetailDTO(int idOrder, BirdDTO bird, String receiverName, String email, String receiverPhoneNumber, double totalPrice) {
        this.idOrder = idOrder;
        this.bird = bird;
        this.receiverName = receiverName;
        this.email = email;
        this.receiverPhoneNumber = receiverPhoneNumber;
        this.totalPrice = totalPrice;
    }

    public OrderDetailDTO(int idOrder, double price, double totalPrice, BirdDTO bird, String status, String receiverName, String receiverPhoneNumber, String email) {
        this.idOrder = idOrder;
        this.price = price;
        this.totalPrice = totalPrice;
        this.bird = bird;
        this.status = status;
        this.receiverName = receiverName;
        this.receiverPhoneNumber = receiverPhoneNumber;
        this.email = email;
    }
    
public int getIdOrderDetail() {
        return idOrderDetail;
    }

    public void setIdOrderDetail(int idOrderDetail) {
        this.idOrderDetail = idOrderDetail;
    }

    public int getIdOrder() {
        return idOrder;
    }

    public void setIdOrder(int idOrder) {
        this.idOrder = idOrder;
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

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public BirdDTO getBird() {
        return bird;
    }

    public void setBird(BirdDTO bird) {
        this.bird = bird;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public CustomerDTO getCustomer() {
        return customer;
    }

    public void setCustomer(CustomerDTO customer) {
        this.customer = customer;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getReceiverName() {
        return receiverName;
    }

    public void setReceiverName(String receiverName) {
        this.receiverName = receiverName;
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

   
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
