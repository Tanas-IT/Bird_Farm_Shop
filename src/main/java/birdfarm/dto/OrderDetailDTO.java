/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package birdfarm.dto;

/**
 *
 * @author Minh
 */
public class OrderDetailDTO {
    private int idOrderDetail;
    private int idOrder;
    private String idBirdProduct;
    private int quantity;
    private double price;
    private double totalPrice;

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
    
    
    
}
