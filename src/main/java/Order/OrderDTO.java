/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Order;

import java.util.Date;

/**
 *
 * @author 1005h
 */
public class OrderDTO {
    private String orderID;
    private String orderCode;
    private String userID;
    private String orderDate;
    private double orderTotal;
    private String paymentMethod;
    private boolean paymentStatus;

    public OrderDTO() {
    }

    public OrderDTO(String orderID, String orderCode, String userID, String orderDate, double orderTotal, String paymentMethod, boolean paymentStatus) {
        this.orderID = orderID;
        this.orderCode = orderCode;
        this.userID = userID;
        this.orderDate = orderDate;
        this.orderTotal = orderTotal;
        this.paymentMethod = paymentMethod;
        this.paymentStatus = paymentStatus;
    }

    public OrderDTO(String orderCode, String userID, String orderDate, double orderTotal, boolean paymentStatus) {
        this.orderCode = orderCode;
        this.userID = userID;
        this.orderDate = orderDate;
        this.orderTotal = orderTotal;
        this.paymentStatus = paymentStatus;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public String getOrderCode() {
        return orderCode;
    }

    public void setOrderCode(String orderCode) {
        this.orderCode = orderCode;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public double getOrderTotal() {
        return orderTotal;
    }

    public void setOrderTotal(double orderTotal) {
        this.orderTotal = orderTotal;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public boolean getPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(boolean paymentStatus) {
        this.paymentStatus = paymentStatus;
    }
}
