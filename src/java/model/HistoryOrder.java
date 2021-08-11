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
public class HistoryOrder {
    private String productName;
    private String image;
    private int quantity;
    private int price;
    private String date;
    private String user;

    public HistoryOrder() {
    }

    public HistoryOrder(String productName,String image, int quantity, int price, String date) {
        this.productName = productName;
        this.image = image;
        this.quantity = quantity;
        this.price = price;
        this.date = date;        
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public HistoryOrder(String productName,String image, int quantity, int price, String date, String user) {
        this.productName = productName;
        this.image = image;
        this.quantity = quantity;
        this.price = price;
        this.date = date;
        this.user = user;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }
    
}
