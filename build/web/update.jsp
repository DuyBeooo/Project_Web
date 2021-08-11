<%-- 
    Document   : update
    Created on : Mar 21, 2021, 2:27:19 PM
    Author     : DuyNQ
--%>

<%@page import="java.util.List"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update</title>
         
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="brand_color">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="titlepage">
                            <h2> List Product </h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>       <hr><br> 
        <% List<Product> listt = (List<Product>) request.getAttribute("data"); %>
        <div class="update">
        <table >
            <tr>                
                <th>Image</th>
                <th>Gender</th>
                <th>Brand</th>
                <th>Category</th>
                <th>Material</th>
                <th>Size</th>
                <th>Color</th>
                <th>Price</th>                
                <th>Action</th>                
            </tr>
            <% for (Product p : listt) {
                    %>
                    <tr>
                        <td><img src="<%= p.getImg() %>"  /></td>
                        <td><%= p.getGender() %></td>
                        <td><%= p.getBrand() %></td>
                        <td><%= p.getCategory() %></td>
                        <td><%= p.getMaterial() %></td>
                        <td><%= p.getSize() %></td>
                        <td><%= p.getColor() %></td>
                        <td><%= p.showPrice(p.getPrice()) %></td>
                        <td><a href="showDetail?action=updateDetail&id=<%= p.getId() %>"><button id="up">Update</button></a></td>
                    </tr>
            <%
                }
            %>
        </table>
        </div>
    <%@include file="footer.jsp" %>
    </body>
</html>
