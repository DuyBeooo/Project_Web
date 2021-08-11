/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.*;
import java.util.*;
import model.Account;

/**
 *
 * @author DuyNQ
 */
public class AccountDAO extends DBContext{
    public Account getAccount(String name,String pass){
        Account a = null;
        String sql = " select * from Account a where a.name ='"+name+"' and a.pass='"+pass+"' ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if(rs.next())
                a = new Account(rs.getInt(1),rs.getString(2),rs.getString(3));
        } catch (Exception e) {
        }
        return a;
    }
    
    public boolean checkAccountExist(String name){
        String sql=" select a.name from Account a";
         try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                if(name.equalsIgnoreCase(rs.getString(1)))
                    return true;// existed
            }                
        } catch (Exception e) {
        }
        return false;// not existed
    }
    
    public void signUpAccount(String name, String pass){
        String sql =" insert into Account values ('"+name+"','"+pass+"')";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public String getCaptcha(){
        String list ="QWERTYUIOPASDFGHJKLZXCVBNMqwertyuiopasdfghjklzxcvbnm1234567890";
        StringBuilder sb = new StringBuilder();
        Random rd = new Random();
        int lengthCapcha =  4;
        for (int i = 0; i < lengthCapcha; i++) {
            int index = rd.nextInt(list.length());
            sb.append(list.charAt(index));
        }
        return sb+"";
    }
}
