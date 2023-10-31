/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package birdfarm.dto;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class BirdDTO implements Serializable{
    private String idBird;
    private String name;
    private String overview;
    private String idBirdSpecies;
    private int quantity;
    private double importPrice;
    private double salePrice;
    private String imageURL;
    private boolean status; // còn hàng hay hết hàng
    private String period;
    private String age;
    private String idFatherBird;
    private String idMotherBird;
    private boolean mutation;
    private String gender;
    private int type;
    private String videoURL;
    private String shortDescription;
    private ArrayList<String> subImageURL;
    private BirdDTO fatherBird;
    private BirdDTO motherBird;
    private String achievement;
    private String reproductiveHistory;
    private String birdSpecies;
    private double total;
    private boolean isPairing;
    private int quantityOfUser;
    private double feeBirdNestMale;
    private double feeBirdNestFemale;
    private double fee;
    
    public BirdDTO(String idBird, String name, String overview, String idBirdSpecies, int quantity, double importPrice, double salePrice, String imageURL, boolean status, String period, String age, String idFatherBird, String idMotherBird, boolean mutation, String gender, int type, String videoURL, String shortDescription, ArrayList<String> subImageURL) {
        this.idBird = idBird;
        this.name = name;
        this.overview = overview;
        this.idBirdSpecies = idBirdSpecies;
        this.quantity = quantity;
        this.importPrice = importPrice;
        this.salePrice = salePrice;
        this.imageURL = imageURL;
        this.status = status;
        this.period = period;
        this.age = age;
        this.idFatherBird = idFatherBird;
        this.idMotherBird = idMotherBird;
        this.mutation = mutation;
        this.gender = gender;
        this.type = type;
        this.videoURL = videoURL;
        this.shortDescription = shortDescription;
        this.subImageURL = subImageURL;
    }
    
    
    public BirdDTO(String idBird, String name, String overview, int quantity, double importPrice, double salePrice, String imageURL, String age, boolean mutation, String gender) {
        this.idBird = idBird;
        this.name = name;
        this.overview = overview;
        this.quantity = quantity;
        this.importPrice = importPrice;
        this.salePrice = salePrice;
        this.imageURL = imageURL;
        this.age = age;
        this.mutation = mutation;
        this.gender = gender;
    }

    public BirdDTO(String name, int quantity, double salePrice, String imageURL) {
        this.name = name;
        this.quantity = quantity;
        this.salePrice = salePrice;
        this.imageURL = imageURL;
    }
    public BirdDTO(String idBird, String name, int quantity, double salePrice, String imageURL) {
        this.idBird = idBird;
        this.name = name;
        this.quantity = quantity;
        this.salePrice = salePrice;
        this.imageURL = imageURL;
    }
    public BirdDTO(String idBird, String name, int quantity, double salePrice, String imageURL, int type, int quantityOfUser) {
        this.idBird = idBird;
        this.name = name;
        this.quantity = quantity;
        this.salePrice = salePrice;
        this.imageURL = imageURL;
        this.type = type;
        this.quantityOfUser = quantityOfUser;
    }
    public BirdDTO(String idBird, String name, String overview, String idBirdSpecies, int quantity, double importPrice, double salePrice, String imageURL, boolean status, String period, String age, String idFatherBird, String idMotherBird, boolean mutation, String gender, int type, String videoURL, String shortDescription) {
        this.idBird = idBird;
        this.name = name;
        this.overview = overview;
        this.idBirdSpecies = idBirdSpecies;
        this.quantity = quantity;
        this.importPrice = importPrice;
        this.salePrice = salePrice;
        this.imageURL = imageURL;
        this.status = status;
        this.period = period;
        this.age = age;
        this.idFatherBird = idFatherBird;
        this.idMotherBird = idMotherBird;
        this.mutation = mutation;
        this.gender = gender;
        this.type = type;
        this.videoURL = videoURL;
        this.shortDescription = shortDescription;
    }

    public BirdDTO(String idBird, String name, String overview, String idBirdSpecies, int quantity, double importPrice, double salePrice, String imageURL, boolean status, String period, String age, String idFatherBird, String idMotherBird, boolean mutation, String gender, int type, String videoURL, String shortDescription, String achievement, String reproductiveHistory, String birdSpecies, boolean isPairing) {
        this.idBird = idBird;
        this.name = name;
        this.overview = overview;
        this.idBirdSpecies = idBirdSpecies;
        this.quantity = quantity;
        this.importPrice = importPrice;
        this.salePrice = salePrice;
        this.imageURL = imageURL;
        this.status = status;
        this.period = period;
        this.age = age;
        this.idFatherBird = idFatherBird;
        this.idMotherBird = idMotherBird;
        this.mutation = mutation;
        this.gender = gender;
        this.type = type;
        this.videoURL = videoURL;
        this.shortDescription = shortDescription;
        this.achievement = achievement;
        this.reproductiveHistory = reproductiveHistory;
        this.birdSpecies = birdSpecies;
        this.isPairing = isPairing;
    }
    
    
            
    public BirdDTO(String idBird, String name, String overview, String idBirdSpecies, int quantity, double importPrice, double salePrice, String imageURL, boolean status, String period, String age, String idFatherBird, String idMotherBird, boolean mutation, String gender, int type, String videoURL, String shortDescription, String achievement, String reproductiveHistory, String birdSpecies) {
        this.idBird = idBird;
        this.name = name;
        this.overview = overview;
        this.idBirdSpecies = idBirdSpecies;
        this.quantity = quantity;
        this.importPrice = importPrice;
        this.salePrice = salePrice;
        this.imageURL = imageURL;
        this.status = status;
        this.period = period;
        this.age = age;
        this.idFatherBird = idFatherBird;
        this.idMotherBird = idMotherBird;
        this.mutation = mutation;
        this.gender = gender;
        this.type = type;
        this.videoURL = videoURL;
        this.shortDescription = shortDescription;
        this.achievement = achievement;
        this.reproductiveHistory = reproductiveHistory;
        this.birdSpecies = birdSpecies;
    }
public BirdDTO(String name, String shortDescription, String imageURL) {
        this.name = name;
        this.shortDescription = shortDescription;
        this.imageURL = imageURL;
    }

    public BirdDTO(String name, String imageURL, boolean mutation, String shortDescription, String achievement, String reproductiveHistory) {
        this.name = name;
        this.imageURL = imageURL;
        this.mutation = mutation;
        this.shortDescription = shortDescription;
        this.achievement = achievement;
        this.reproductiveHistory = reproductiveHistory;
    }
    
    public BirdDTO(String idBird,int quantity, double salePrice, String oBirdName, String shortDescription, String oBirdUrl) {
        this.idBird = idBird;
        this.quantity = quantity;
        this.salePrice = salePrice;
        this.name = oBirdName;
        this.shortDescription = shortDescription;
        this.imageURL = oBirdUrl;
    }

    public BirdDTO(String idBird, String name, double salePrice, String imageURL, String period, String age, boolean mutation, String shortDescription, String achievement, String reproductiveHistory, String birdSpecies, boolean isPairing, double feeBirdNestMale, double feeBirdNestFemale) {
        this.idBird = idBird;
        this.name = name;
        this.salePrice = salePrice;
        this.imageURL = imageURL;
        this.period = period;
        this.age = age;
        this.mutation = mutation;
        this.shortDescription = shortDescription;
        this.achievement = achievement;
        this.reproductiveHistory = reproductiveHistory;
        this.birdSpecies = birdSpecies;
        this.isPairing = isPairing;
        this.feeBirdNestMale = feeBirdNestMale;
        this.feeBirdNestFemale = feeBirdNestFemale;
    }

    public BirdDTO(String idBird, String name, String idBirdSpecies, double salePrice, String imageURL, boolean status, String period, String age, boolean mutation, String gender, int type, String shortDescription, String achievement, String reproductiveHistory, String birdSpecies, boolean isPairing, double feeBirdNestMale, double feeBirdNestFemale) {
        this.idBird = idBird;
        this.name = name;
        this.idBirdSpecies = idBirdSpecies;
        this.salePrice = salePrice;
        this.imageURL = imageURL;
        this.status = status;
        this.period = period;
        this.age = age;
        this.mutation = mutation;
        this.gender = gender;
        this.type = type;
        this.shortDescription = shortDescription;
        this.achievement = achievement;
        this.reproductiveHistory = reproductiveHistory;
        this.birdSpecies = birdSpecies;
        this.isPairing = isPairing;
        this.feeBirdNestMale = feeBirdNestMale;
        this.feeBirdNestFemale = feeBirdNestFemale;
    }
                    
    
public ArrayList<BirdDTO> getRandomBirds(List<BirdDTO> danhSachChim, BirdDTO conChimHienTai, int soLuong) {
        ArrayList<BirdDTO> conChimNgauNhien = new ArrayList<>();
        Random random = new Random();
        
        while (conChimNgauNhien.size() < soLuong) {
            int index = random.nextInt(danhSachChim.size());
            BirdDTO chim = danhSachChim.get(index);
            
            if (!conChimNgauNhien.contains(chim) && !chim.equals(conChimHienTai) && chim.getType() != 4) {
                conChimNgauNhien.add(chim);
            }
        }
        return conChimNgauNhien;
    }
}
