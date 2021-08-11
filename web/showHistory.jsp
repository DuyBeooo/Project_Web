<%-- 
    Document   : showHistory
    Created on : Mar 20, 2021, 11:51:20 PM
    Author     : DuyNQ
--%>

<%@page import="model.HistoryOrder"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>History</title>
    </head>
    <body>
         <%@include file="header.jsp" %>
        <div class="brand_color">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="titlepage">
                            <h2>History Order</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>        
        <% List<HistoryOrder> list = (List)request.getAttribute("orderList"); 
            if(list.size()!=0){
        %>
       <div class="history">
        <table>
            <tr>                
                <th>Product Name</th>
                <th>Image</th>
                <th>Quantity</th>
                <th>Price</th>
                <th>Date</th>
                <th>User</th>
            </tr>
            <% for (HistoryOrder h : list) {
            %>
            <tr>
                <td><%= h.getProductName() %></td>
                <td><img src="<%= h.getImage() %>" width="100px"/></td>
                <td><%= h.getQuantity() %></td>
                <td><%= h.getPrice() %></td>
                <td><%= h.getDate() %></td>
                <td><%= h.getUser() %></td>                
            </tr>            
            <%
                }%>
        </table>
        </div>
        <% } %>
                <%@include file="footer.jsp" %>
    </body>
</html>
