<%-- 
    Document   : contact
    Created on : Mar 21, 2021, 9:16:13 PM
    Author     : DuyNQ
--%>

<%@page import="dal.PostDAO"%>
<%@page import="model.Comment"%>
<%@page import="model.Post"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact</title>

    </head>
    <body>
        <header> <%@include file="header.jsp" %></header>
        <div class="brand_color">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="titlepage">
                            <h2>Give Your Feedback</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <% List<Post> listp = (List) request.getAttribute("listP");
            List<Comment> listc = (List) request.getAttribute("listC");
            PostDAO dao = new PostDAO();
            if (listp != null || listc != null) { %>
        

            <%  for (Post p : listp) {%>
            <div id="post">                
                <span class="p"><b><%= dao.getAccountNameById(p.getAccId())%></b>,
                <%= p.getDate()%>:  
                <%= p.getContent()%></span>

            </div>
            <div id="comment">
                <% for (Comment comment : listc) {
                        if (comment.getPid() == p.getId()) {%>
                        <span class="c"> <b><%= dao.getAccountNameById(comment.getAccId())%></b>,
                    <%= comment.getDate()%>:  
                    <%= comment.getContent()%></span><br>
                    <% }
                        }
                    %>
            </div>
            <div id="postText">
                <form action="contact" method="post">
                    <textarea id="rep" name="reply"> </textarea>
                    <input hidden name="pid" value="<%= p.getId()%>" />                           
                    <input type="submit" value="Reply" />                           
                </form>
            </div>        

            <% }%>

        
        <% }%>
        <div class="postText">
            <form action="contact" method="post">
                <textarea id="pp"  name="post" ></textarea>
                <input type="submit" value="Post" />                           
            </form>
        </div>
        <footer><%@include file="footer.jsp" %></footer>
    </body>
</html>
