/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Product;

import java.io.Serializable;

/**
 *
 * @author 1005h
 */
public class ProductDTO implements Serializable{
    private String productID;
    private String productName;
    private double productPrice;
    private int productQuantity;
    private String productImage;

    public ProductDTO() {
        this.productID = "";
        this.productName = "";
        this.productPrice = 0;
        this.productQuantity = 0;
        this.productImage = "";
    }

    public ProductDTO(String productID, String productName, double productPrice, int productQuantity, String productImage) {
        this.productID = productID;
        this.productName = productName;
        this.productPrice = productPrice;
        this.productQuantity = productQuantity;
        this.productImage = productImage;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public double getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(double productPrice) {
        this.productPrice = productPrice;
    }

    public int getProductQuantity() {
        return productQuantity;
    }

    public void setProductQuantity(int productQuantity) {
        this.productQuantity = productQuantity;
    }

    public String getProductImage() {
        return productImage;
    }

    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }

    
}
