/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package birdfarm.dto;

/**
 *
 * @author 1005h
 */
  public class OrderDTO {
    private int idOrder;
    private String idUser;
    private String createdDate;
    private String status;
    private double total;
    // private double deliveryCost;
    // private String deliveryDate;
    private String receiverAddress;
    private String note;
    private String receiverPhoneNumber;
    private String receiverName;
    private int paymentId;
    private boolean isPay;
    private String orderCode;
    private String BirdName;
    private String BirdId;

    public OrderDTO(String idUser, String createdDate, String status, double total, String receiverAddress, String note, String receiverPhoneNumber, String receiverName, int paymentId, boolean isPay, String orderCode) {
        this.idUser = idUser;
        this.createdDate = createdDate;
        this.status = status;
        this.total = total;
        this.receiverAddress = receiverAddress;
        this.note = note;
        this.receiverPhoneNumber = receiverPhoneNumber;
        this.receiverName = receiverName;
        this.paymentId = paymentId;
        this.isPay = isPay;
        this.orderCode = orderCode;
    }

    public OrderDTO(int idOrder, String createdDate, String status, double total, String BirdName, String BirdId) {
        this.idOrder = idOrder;
        this.createdDate = createdDate;
        this.status = status;
        this.total = total;
        this.BirdName = BirdName;
        this.BirdId = BirdId;
    }
    

    public OrderDTO(String idUser, String createdDate, String status, double total, String receiverAddress, String note, String receiverPhoneNumber, String receiverName, int paymentId, boolean isPay) {
        this.idUser = idUser;
        this.createdDate = createdDate;
        this.status = status;
        this.total = total;
        this.receiverAddress = receiverAddress;
        this.note = note;
        this.receiverPhoneNumber = receiverPhoneNumber;
        this.receiverName = receiverName;
        this.paymentId = paymentId;
        this.isPay = isPay;
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

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getReceiverAddress() {
        return receiverAddress;
    }

    public void setReceiverAddress(String receiverAddress) {
        this.receiverAddress = receiverAddress;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
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

    public int getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(int paymentId) {
        this.paymentId = paymentId;
    }

    public boolean getIsPay() {
        return isPay;
    }

    public void setIsPay(boolean isPay) {
        this.isPay = isPay;
    }

    public String getOrderCode() {
        return orderCode;
    }

    public void setOrderCode(String orderCode) {
        this.orderCode = orderCode;
    }
        
        
}
