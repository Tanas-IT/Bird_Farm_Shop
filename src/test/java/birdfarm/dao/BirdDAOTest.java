/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package birdfarm.dao;

import birdfarm.dto.BirdDTO;
import birdfarm.dto.BirdTypeDTO;
import java.util.List;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author ASUS
 */

public class BirdDAOTest {
    /**
     * Test of getBirdList method, of class BirdDAO.
     */
    @Test
    public void testGetBirdList() {
        System.out.println("getBirdList");
        BirdDAO instance = new BirdDAO();
        List<BirdDTO> expResult = null;
        List<BirdDTO> result = instance.getBirdList();
        assertEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    /**
     * Test of getBirdSubImageList method, of class BirdDAO.
     */
    @Test
    public void testGetBirdSubImageList() {
        System.out.println("getBirdSubImageList");
        BirdDAO instance = new BirdDAO();
        List<String> expResult = null;
        List<String> result = instance.getBirdSubImageList();
        assertEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    /**
     * Test of getBirdSearchList method, of class BirdDAO.
     */
    @Test
    public void testGetBirdSearchList() {
        System.out.println("getBirdSearchList");
        BirdDAO instance = new BirdDAO();
        List<BirdDTO> expResult = null;
        List<BirdDTO> result = instance.getBirdSearchList();
        assertEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    /**
     * Test of getBirdViewAllTypeList method, of class BirdDAO.
     */
    @Test
    public void testGetBirdViewAllTypeList() {
        System.out.println("getBirdViewAllTypeList");
        BirdDAO instance = new BirdDAO();
        List<BirdDTO> expResult = null;
        List<BirdDTO> result = instance.getBirdViewAllTypeList();
        assertEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    /**
     * Test of getBirdTypeList method, of class BirdDAO.
     */
    @Test
    public void testGetBirdTypeList() {
        System.out.println("getBirdTypeList");
        BirdDAO instance = new BirdDAO();
        List<BirdTypeDTO> expResult = null;
        List<BirdTypeDTO> result = instance.getBirdTypeList();
        assertEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    /**
     * Test of getBirdMaleList method, of class BirdDAO.
     */
    @Test
    public void testGetBirdMaleList() {
        System.out.println("getBirdMaleList");
        BirdDAO instance = new BirdDAO();
        List<BirdDTO> expResult = null;
        List<BirdDTO> result = instance.getBirdMaleList();
        assertEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    /**
     * Test of getBirdFemaleList method, of class BirdDAO.
     */
    @Test
    public void testGetBirdFemaleList() {
        System.out.println("getBirdFemaleList");
        BirdDAO instance = new BirdDAO();
        List<BirdDTO> expResult = null;
        List<BirdDTO> result = instance.getBirdFemaleList();
        assertEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    /**
     * Test of getAllBird method, of class BirdDAO.
     */
    @Test
    public void testGetAllBird() throws Exception {
        System.out.println("getAllBird");
        BirdDAO instance = new BirdDAO();
        instance.getAllBird();
        fail("The test case is a prototype.");
    }

    /**
     * Test of getSubImageByBirdID method, of class BirdDAO.
     */
    @Test
    public void testGetSubImageByBirdID() throws Exception {
        System.out.println("getSubImageByBirdID");
        String birdID = "";
        BirdDAO instance = new BirdDAO();
        instance.getSubImageByBirdID(birdID);
        fail("The test case is a prototype.");
    }

    /**
     * Test of getBirdByID method, of class BirdDAO.
     */
    @Test
    public void testGetBirdByID() throws Exception {
        System.out.println("getBirdByID");
        String birdID = "";
        BirdDAO instance = new BirdDAO();
        BirdDTO expResult = null;
        BirdDTO result = instance.getBirdByID(birdID);
        assertEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    /**
     * Test of getBirdPairing method, of class BirdDAO.
     */
    @Test
    public void testGetBirdPairing() throws Exception {
        System.out.println("getBirdPairing");
        String birdID = "";
        BirdDAO instance = new BirdDAO();
        BirdDTO expResult = null;
        BirdDTO result = instance.getBirdPairing(birdID);
        assertEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    /**
     * Test of getFatherAndMotherBird method, of class BirdDAO.
     */
    @Test
    public void testGetFatherAndMotherBird() throws Exception {
        System.out.println("getFatherAndMotherBird");
        String birdID = "";
        BirdDAO instance = new BirdDAO();
        BirdDTO expResult = null;
        BirdDTO result = instance.getFatherAndMotherBird(birdID);
        assertEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    /**
     * Test of searchByName method, of class BirdDAO.
     */
    @Test
    public void testSearchByName() throws Exception {
        System.out.println("searchByName");
        String txtSearch = "";
        BirdDAO instance = new BirdDAO();
        List<BirdDTO> expResult = null;
        List<BirdDTO> result = instance.searchByName(txtSearch);
        assertEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    /**
     * Test of getBirdByType method, of class BirdDAO.
     */
    @Test
    public void testGetBirdByType() throws Exception {
        System.out.println("getBirdByType");
        String idType = "";
        BirdDAO instance = new BirdDAO();
        List<BirdDTO> expResult = null;
        List<BirdDTO> result = instance.getBirdByType(idType);
        assertEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    /**
     * Test of getAllSpecies method, of class BirdDAO.
     */
    @Test
    public void testGetAllSpecies() throws Exception {
        System.out.println("getAllSpecies");
        BirdDAO instance = new BirdDAO();
        instance.getAllSpecies();
        fail("The test case is a prototype.");
    }

    /**
     * Test of updateQuantity method, of class BirdDAO.
     */
    @Test
    public void testUpdateQuantity() throws Exception {
        System.out.println("updateQuantity");
        BirdDTO productInCart = null;
        BirdDAO instance = new BirdDAO();
        boolean expResult = false;
        boolean result = instance.updateQuantity(productInCart);
        assertEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    /**
     * Test of getListMale method, of class BirdDAO.
     */
    @Test
    public void testGetListMale() throws Exception {
        System.out.println("getListMale");
        BirdDAO instance = new BirdDAO();
        List<BirdDTO> expResult = null;
        List<BirdDTO> result = instance.getListMale();
        assertEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    /**
     * Test of getListFemale method, of class BirdDAO.
     */
    @Test
    public void testGetListFemale() throws Exception {
        System.out.println("getListFemale");
        BirdDAO instance = new BirdDAO();
        List<BirdDTO> expResult = null;
        List<BirdDTO> result = instance.getListFemale();
        assertEquals(expResult, result);
        fail("The test case is a prototype.");
    }
    
}
