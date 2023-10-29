/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package birdfarm.controller.birdcomparator;

import birdfarm.dto.BirdDTO;
import java.util.Comparator;

/**
 *
 * @author ASUS
 */
public class BirdPriceDescendingComparator implements Comparator<BirdDTO> {
    @Override
    public int compare(BirdDTO b1, BirdDTO b2) {
      return Double.compare(b2.getSalePrice(), b1.getSalePrice());
    }
}