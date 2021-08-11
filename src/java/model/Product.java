/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author DuyNQ
 */
public class Product {
    private int id;
    private int price;
    private String img,gender,brand,category,material,size,color;

    public Product() {
    }

    public Product(int id,String img,  String gender, String brand, String category, String material, String size, String color, int price) {
        this.id = id;       
        this.price = price;
        this.img = img;
        this.gender = gender;
        this.brand = brand;
        this.category = category;
        this.material = material;
        this.size = size;
        this.color = color;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    
    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getMaterial() {
        return material;
    }

    public void setMaterial(String material) {
        this.material = material;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }
    
    public  String showPrice(int priceInt) {
        String price = (priceInt + "").trim();
        int l = price.length();
        String newPrice = "";
        if (price.length() <= 3) {
            newPrice = price;
        } else {
            for (int i = 0; i < l; i++) {
                if (i == l - 4 || i == l - 7 || i == l - 10 || i == l - 13) {
                    newPrice += price.charAt(i) + ".";
                } else {
                    newPrice += price.charAt(i);
                }
            }
        }
        return newPrice + " VND";
    }
     
    
}
