/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package birdfarm.dto;

/**
 *
 * @author ASUS
 */
public class PaymentDTO {
    private int idPayment;
    private String paymentMethod;
    
    public PaymentDTO() {
        
    }

    public PaymentDTO(int idPayment, String paymentMethod) {
        this.idPayment = idPayment;
        this.paymentMethod = paymentMethod;
    }

    /**
     * @return the idPayment
     */
    public int getIdPayment() {
        return idPayment;
    }

    /**
     * @param idPayment the idPayment to set
     */
    public void setIdPayment(int idPayment) {
        this.idPayment = idPayment;
    }

    /**
     * @return the paymentMethod
     */
    public String getPaymentMethod() {
        return paymentMethod;
    }

    /**
     * @param paymentMethod the paymentMethod to set
     */
    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }
    
    
}
