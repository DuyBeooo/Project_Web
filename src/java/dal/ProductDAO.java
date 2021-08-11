/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.*;
import java.util.*;
import model.Product;

/**
 *
 * @author DuyNQ
 */
public class ProductDAO extends DBContext{
     
     public List<Product> getListProducts(){
         List<Product> list = new ArrayList<>();
         String sql = "select * from product";
         try {
             PreparedStatement st = connection.prepareStatement(sql);
             ResultSet rs = st.executeQuery();
             while (rs.next()) {                 
                 int id = rs.getInt(1);
                 String img = rs.getString(2);                 
                 String gender = rs.getString(3);
                 String brand = rs.getString(4);
                 String category = rs.getString(5);
                 String material = rs.getString(6);
                 String size = rs.getString(7);
                 String color = rs.getString(8);
                 int price = rs.getInt(9);
                 Product p = new Product(id, img,  gender, brand, 
                         category, material, size, color, price);
                 list.add(p);
             }
         } catch (Exception e) {
         }
         return list;
     }
     
     public List<Product> sort(List<Product> list, String x){
         if(x.equalsIgnoreCase("1")){
              Collections.sort(list, new Comparator<Product>() {
             @Override             
             public int compare(Product o1, Product o2) {                 
                 return (int) (o1.getPrice() - o2.getPrice());
             }
         
     });
         }
         else if(x.equalsIgnoreCase("2")){
              Collections.sort(list, new Comparator<Product>() {
             @Override             
             public int compare(Product o1, Product o2) {                 
                 return (int)(o2.getPrice() - o1.getPrice());
             }
         
     });
         }
         else if(x.equalsIgnoreCase("3")){
              Collections.sort(list, new Comparator<Product>() {
             @Override             
             public int compare(Product o1, Product o2) {                 
                 return o1.getId() - o2.getId();
             }
         
     });
         }
         else if(x.equalsIgnoreCase("4")){
              Collections.sort(list, new Comparator<Product>() {
             @Override             
             public int compare(Product o1, Product o2) {                 
                 return o2.getId() - o1.getId();
             }
         
     });
         }
         else return list;
         return list;
     }
     
     public List<Object> listGender(){
         List<Object> list = new ArrayList<>();
         String sql =" select distinct  p.gender from product p";
         try {
             PreparedStatement st = connection.prepareStatement(sql);
             ResultSet rs = st.executeQuery();
             while (rs.next()) {                 
                 list.add(rs.getString(1));
             }
         } catch (Exception e) {
         }
         return list;
     }
     
     public List<Object> listBrand(){
         List<Object> list = new ArrayList<>();
         String sql =" select distinct  p.brand from product p";
         try {
             PreparedStatement st = connection.prepareStatement(sql);
             ResultSet rs = st.executeQuery();
             while (rs.next()) {                 
                 list.add(rs.getString(1));
             }
         } catch (Exception e) {
         }
         return list;
     }
     
     public List<Object> listCategory(){
         List<Object> list = new ArrayList<>();
         String sql =" select distinct  p.category from product p";
         try {
             PreparedStatement st = connection.prepareStatement(sql);
             ResultSet rs = st.executeQuery();
             while (rs.next()) {                 
                 list.add(rs.getString(1));
             }
         } catch (Exception e) {
         }
         return list;
     }
     public List<Object> listMaterial(){
         List<Object> list = new ArrayList<>();
         String sql =" select distinct  p.Material from product p";
         try {
             PreparedStatement st = connection.prepareStatement(sql);
             ResultSet rs = st.executeQuery();
             while (rs.next()) {                 
                 list.add(rs.getString(1));
             }
         } catch (Exception e) {
         }
         return list;
     }
     
     public List<Product> listSearch(String gender,String brand,String category,String material,String price){
         List<Product> list = new ArrayList<>();
         String sql =" select * from product p  where 1=1 ";
         if( !(gender.equalsIgnoreCase("Gender")) )
             sql += " and p.gender ='"+gender+"' ";
         if( !(brand.equalsIgnoreCase("Brand")) )
             sql += " and p.brand ='"+brand+"' ";
         if( !(category.equalsIgnoreCase("Category")))
             sql += " and p.category ='"+category+"' ";
         if( !(material.equalsIgnoreCase("Material")))
             sql += " and p.material ='"+material+"' " ;
         if(!(price.equals("price"))){
             if(price.equals("1-10"))
                 sql += " and p.price > 1000000 and p.price < 10000000";
             if(price.equals("10-20"))
                 sql += " and p.price > 10000000 and p.price < 20000000";
             if(price.equals("20-30"))
                 sql += " and p.price > 20000000 and p.price < 30000000";
             if(price.equals("30-40"))
                 sql += " and p.price > 30000000 and p.price < 40000000";
             if(price.equals("40-50"))
                 sql += " and p.price > 40000000 and p.price < 50000000";
             if(price.equals(">50"))
                 sql += " and p.price > 50000000 ";
         }
         try {
             PreparedStatement st = connection.prepareStatement(sql);
             ResultSet rs = st.executeQuery();
             while (rs.next()) {                 
                 int id = rs.getInt(1);
                 String img = rs.getString(2);                 
                 String genderx = rs.getString(3);
                 String brandx = rs.getString(4);
                 String categoryx = rs.getString(5);
                 String materialx = rs.getString(6);
                 String size = rs.getString(7);
                 String color = rs.getString(8);
                 int xprice = rs.getInt(9);
                 Product p = new Product(id, img,  genderx, brandx, 
                         categoryx, materialx, size, color, xprice);
                 list.add(p);
             }
         } catch (Exception e) {
             System.out.println(e+"");
         }
         
         return list;
     }
     
     public Product getProductById(int id){
         Product p = new Product();
         String sql = "select * from product p where p.product_id = "+id;
         try {
             PreparedStatement st = connection.prepareStatement(sql);
             ResultSet rs = st.executeQuery();
             if(rs.next()){                
                 String img = rs.getString(2);                 
                 String genderx = rs.getString(3);
                 String brandx = rs.getString(4);
                 String categoryx = rs.getString(5);
                 String materialx = rs.getString(6);
                 String size = rs.getString(7);
                 String color = rs.getString(8);
                 int price = rs.getInt(9);
                 p = new Product(id, img, genderx, brandx, 
                         categoryx, materialx, size, color, price);
             }
         } catch (Exception e) {
         }
         return p;
     }
}
