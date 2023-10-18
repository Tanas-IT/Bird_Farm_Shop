/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package birdfarm.payment;

/**
 *
 * @author 1005h
 */
public class Payment_COD_DTO {
    private double amount; //so tien thanh toan
    private String payDate; // thoi gian thanh toan
    private String orderInfo; // noi dung thanh toan
    private String orderCode; // ma don hang
    private String status; //Tinh trang

    public Payment_COD_DTO() {
    }

    public Payment_COD_DTO(double amount, String payDate, String orderInfo, String orderCode) {
        this.amount = amount;
        this.payDate = payDate;
        this.orderInfo = orderInfo;
        this.orderCode = orderCode;
        this.status = "FAILED";
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public String getPayDate() {
        return payDate;
    }

    public void setPayDate(String payDate) {
        this.payDate = payDate;
    }

    public String getOrderInfo() {
        return orderInfo;
    }

    public void setOrderInfo(String orderInfo) {
        this.orderInfo = orderInfo;
    }

    public String getOrderCode() {
        return orderCode;
    }

    public void setOrderCode(String orderCode) {
        this.orderCode = orderCode;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    
}
