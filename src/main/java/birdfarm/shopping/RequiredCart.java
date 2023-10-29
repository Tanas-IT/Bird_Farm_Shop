/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package birdfarm.shopping;

import birdfarm.dto.BirdDTO;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Minh
 */
public class RequiredCart {
    private Map<String, BirdDTO> rcart;

    public RequiredCart() {
    }

    public RequiredCart(Map<String, BirdDTO> rcart) {
        this.rcart = rcart;
    }

    public Map<String, BirdDTO> getRcart() {
        return rcart;
    }

    public void setRcart(Map<String, BirdDTO> rcart) {
        this.rcart = rcart;
    }
     public boolean add(BirdDTO bird) {
        boolean check = false;
        try {
//            neu gio hang chua co thi tao moi
            if (this.rcart == null) {
                this.rcart = new HashMap<>();
                this.rcart.put(bird.getIdBird(), bird);
                return true;
            }
             // Check if the cart already contains the maximum number of IDs
        if (this.rcart.size() >= 2) {
            System.out.println("The cart already contains the maximum number of items.");
            return false;
        }
        
        // Check if the cart already contains the bird ID
        if (this.rcart.containsKey(bird.getIdBird())) {
            System.out.println("The cart already contains the selected bird.");
            return false;
        }
        
        // Check if the quantity of the bird is already 1
        if (bird.getQuantity() > 1) {
            System.out.println("The selected bird is already in the cart.");
            return false;
        }
        if(this.rcart.size() >= 0 && this.rcart.size() <=1) {
            for(String key: this.rcart.keySet()) {
                if(this.rcart.get(key).getBirdSpecies().equals(bird.getBirdSpecies())) {
                    this.rcart.put(bird.getIdBird(), bird);
                    check = true;
                }
            }
           
        }
         

        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }
    
    
}
