/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.LocalTime;
import model.Account;
import model.Cart;
import model.Item;

/**
 *
 * @author DuyNQ
 */
public class OrderDAO extends DBContext {

    public void addToOrder(Account a, Cart c) {
        LocalDate curDate = java.time.LocalDate.now();
        LocalTime curTime = java.time.LocalTime.now();
        String date = curDate.toString()+" , "+curTime.toString();
        try {
            // them vao bang order
            String sql = "insert into [order] values (?,?,?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, date);
            st.setInt(2, a.getId());
            st.setDouble(3, c.getTotalMoney());
            st.executeUpdate();
            // lay id moi nhat
            String sql1 = "select top 1 o.id  from [Order] o order by o.id desc";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            ResultSet rs = st1.executeQuery();
            int oid = 0;
            while(rs.next()){
                oid = rs.getInt("id");
            }           
            //them vao bang order line            
            for (Item i : c.getList()) {
                String sql2 = "insert into orderline values (?,?,?,?)";
                PreparedStatement st2 = connection.prepareStatement(sql2);
                st2.setInt(1, oid);
                st2.setInt(2, i.getProduct().getId());
                st2.setInt(3, i.getQuantity());
                st2.setInt(4, i.getProduct().getPrice());
                st2.executeUpdate();
                addToHistoryOrder(i, date, a);
            }
        } catch (Exception e) {
        }
    }
    
    public void addToHistoryOrder(Item i, String date,Account account){
        String sql = "insert into history values (?,?,?,?,?,?)";        
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1,i.getProduct().getBrand()+" "+i.getProduct().getId());
            st.setString(2,i.getProduct().getImg());
            st.setInt(3,i.getQuantity());
            st.setInt(4,i.getProduct().getPrice());
            st.setString(5,date);
            st.setString(6,account.getName());
            st.executeUpdate();
        } catch (Exception e) {
        }
    }
}
