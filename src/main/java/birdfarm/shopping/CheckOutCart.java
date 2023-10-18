package birdfarm.shopping;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.util.HashMap;
import java.util.Map;
import birdfarm.dao.BirdDAO;
import birdfarm.dao.OrderBirdDAO;
import birdfarm.shopping.CheckOutProduct;

/**
 *
 * @author 1005h
 */
public class CheckOutCart {

    private Map<String, CheckOutProduct> cart;

    public CheckOutCart() {
    }

    public CheckOutCart(Map<String, CheckOutProduct> cart) {
        this.cart = cart;
    }

    public Map<String, CheckOutProduct> getCart() {
        return cart;
    }

    public void setCart(Map<String, CheckOutProduct> cart) {
        this.cart = cart;
    }

    public boolean add(CheckOutProduct bird) {
        boolean check = false;
        try {
//            neu gio hang chua co thi tao moi
            if (this.cart == null) {
                this.cart = new HashMap<>();
            }
//            neu san pham da co trong gio hang thi cap nhat quantity
            if (this.cart.containsKey(bird.getIdBird())) {
                int currentQuantity = this.cart.get(bird.getIdBird()).getQuantity();
                //Cap nhat quantity san pham
                bird.setQuantity(currentQuantity + bird.getQuantity());
                OrderBirdDAO dao = new OrderBirdDAO();
                //Kiem tra so san pham trong kho hang
                boolean checkQuantity = dao.checkQuantityProduct(bird.getIdBird(), bird.getQuantity());
                //Neu vuot qua so luong cho phep thi block
                if (!checkQuantity) {
                    bird.setQuantity(currentQuantity);
                } else {
                    this.cart.put(bird.getIdBird(), bird);
                    check = true;
                }
            } else {
                OrderBirdDAO dao = new OrderBirdDAO();
                //Kiem tra so san pham trong kho hang
                boolean checkQuantity = dao.checkQuantityProduct(bird.getIdBird(), bird.getQuantity());
                //Neu vuot qua so luong cho phep thi block
                if (!checkQuantity) {
                    check = false;
                } else {
                    this.cart.put(bird.getIdBird(), bird);
                    check = true;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public boolean edit(String id, CheckOutProduct product, int quantity) {
        boolean check = false;
        try {
            if (this.cart != null) {
                if (this.cart.containsKey(id)) {
                    OrderBirdDAO dao = new OrderBirdDAO();
                    //Kiem tra so san pham trong kho hang
                    boolean checkQuantity = dao.checkQuantityProduct(product.getIdBird(), quantity);
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
