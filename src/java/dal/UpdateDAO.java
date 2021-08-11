/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;

/**
 *
 * @author DuyNQ
 */
public class UpdateDAO extends DBContext{
    public void updateProduct(int id,String brand,String category,String material,
            String size,String color,String price,String gender){
        if(brand.length()==0&&category.length()==0&&material.length()==0
                &&size.length()==0&&color.length()==0&&price.length()==0&&gender.equalsIgnoreCase("none")){
            return;
        }
        String sql = "";
        if(brand.length()!=0)
            sql += "  update product set brand='"+ brand +"' where product_id ="+id;
        if(category.length()!=0)
            sql += "  update product set category='"+ category +"' where product_id ="+id;
        if(material.length()!=0)
            sql += "  update product set material='"+ material +"' where product_id ="+id;
        if(size.length()!=0)
            sql += "  update product set size='"+ size +"' where product_id ="+id;
        if(color.length()!=0)
            sql += "  update product set color='"+ color +"' where product_id ="+id;
        if(price.length()!=0){
            try {
                int xprice = Integer.parseInt(price);
                sql += "  update product set price="+ xprice +"where product_id ="+id;
            } catch (Exception e) {               
            }
        }
        if(!(gender.equalsIgnoreCase("none")))
            sql += "  update product set gender='"+ gender +"' where product_id ="+id;       
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }
    
}
