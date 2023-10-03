/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Shopping;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import Product.ProductDAO;
import Product.ProductDTO;

/**
 *
 * @author 1005h
 */
public class Cart {

    private Map<String, ProductDTO> cart;

    public Cart() {
    }

    public Cart(Map<String, ProductDTO> cart) {
        this.cart = cart;
    }

    public Map<String, ProductDTO> getCart() {
        return cart;
    }

    public void setCart(Map<String, ProductDTO> cart) {
        this.cart = cart;
    }

    public boolean add(ProductDTO product) {
        boolean check = false;
        try {
//            neu gio hang chua co thi tao moi
            if (this.cart == null) {
                this.cart = new HashMap<>();
            }
//            neu san pham da co trong gio hang thi cap nhat quantity
            if (this.cart.containsKey(product.getProductID())) {
                int currentQuantity = this.cart.get(product.getProductID()).getProductQuantity();
                //Cap nhat quantity san pham
                product.setProductQuantity(currentQuantity + product.getProductQuantity());
                ProductDAO dao = new ProductDAO();
                //Kiem tra so san pham trong kho hang
                boolean checkQuantity = dao.checkQuantityProduct(product.getProductID(), product.getProductQuantity());
                //Neu vuot qua so luong cho phep thi block
                if (!checkQuantity) {
                    product.setProductQuantity(currentQuantity);
                } else {
                    this.cart.put(product.getProductID(), product);
                    check = true;
                }
            } else {
                ProductDAO dao = new ProductDAO();
                //Kiem tra so san pham trong kho hang
                boolean checkQuantity = dao.checkQuantityProduct(product.getProductID(), product.getProductQuantity());
                //Neu vuot qua so luong cho phep thi block
                if (!checkQuantity) {
                    check = false;
                } else {
                    this.cart.put(product.getProductID(), product);
                    check = true;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public boolean remove(String id) {
        boolean check = false;
        try {
            if (this.cart != null) {
                if (this.cart.containsKey(id)) {
                    this.cart.remove(id);
                    check = true;
                }
            }
        } catch (Exception e) {
        }
        return check;
    }

    public boolean edit(String id, ProductDTO product, int quantity) {
        boolean check = false;
        try {
            if (this.cart != null) {
                if (this.cart.containsKey(id)) {
                    ProductDAO dao = new ProductDAO();
                    //Kiem tra so san pham trong kho hang
                    boolean checkQuantity = dao.checkQuantityProduct(product.getProductID(), quantity);
                    //Neu vuot qua so luong cho phep thi block
                    if (!checkQuantity) {
                        check = false;
                    }
                    if (checkQuantity) {
                        this.cart.replace(id, product);
                        check = true;
                    }
                }
            }
        } catch (Exception e) {
        }
        return check;
    }

}
