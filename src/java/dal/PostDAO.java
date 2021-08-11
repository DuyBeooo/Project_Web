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
import java.util.ArrayList;
import java.util.List;
import model.Comment;
import model.Post;

/**
 *
 * @author DuyNQ
 */
public class PostDAO extends DBContext {

    public List<Post> getListPost() {
        List<Post> list = new ArrayList<>();
        String sql = "select * from Post p order by p.pid desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Post(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Comment> getListComment() {
        List<Comment> list = new ArrayList<>();
        String sql = "select * from Comment c order by c.cid desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Comment(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4),
                        rs.getInt(5)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public int getAccountIdByName(String name) {
        int id = 0;
        String sql = "select a.account_id from Account a where a.name = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                id = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return id;
    }

    public String getAccountNameById(int aid) {
        String name="";
        String sql = "select a.name from Account a where a.account_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, aid);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                name = rs.getString(1);
            }
        } catch (Exception e) {
        }
        return name;
    }

    public void addPost(String content, int aid) {
        LocalDate curDate = java.time.LocalDate.now();
        LocalTime curTime = java.time.LocalTime.now();
        String date = curDate.toString() + " , " + curTime.toString();
        String sql = "insert into Post values (?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, content);
            st.setString(2, date);
            st.setInt(3, aid);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void addComment(int pid, String content, int aid) {
        LocalDate curDate = java.time.LocalDate.now();
        LocalTime curTime = java.time.LocalTime.now();
        String date = curDate.toString() + " , " + curTime.toString();
        String sql = "insert into Comment values (?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, pid);
            st.setString(2, content);
            st.setString(3, date);
            st.setInt(4, aid);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }
}
