/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.HistoryOrder;

/**
 *
 * @author DuyNQ
 */
public class HistoryDAO extends DBContext{
    public List<HistoryOrder> getListHistory(String username){
        List<HistoryOrder> list = new ArrayList<>();
        String sql ="select * from history h ";
        if(!(username.equalsIgnoreCase("admin")))
            sql += " where h.[user] ='"+username+"'";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {                
//                 if(!(username.equalsIgnoreCase("admin")))
//                     list.add(new HistoryOrder(rs.getString(1),rs.getString(2),rs.getInt(3)
//                             ,rs.getInt(4),rs.getString(5)));
//                 else
                     list.add(new HistoryOrder(rs.getString(1),rs.getString(2),rs.getInt(3)
                             ,rs.getInt(4),rs.getString(5),rs.getString(6)));
            }
        } catch (Exception e) {
        }
        return list;
    }
}
