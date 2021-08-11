<%-- 
    Document   : showCart
    Created on : Mar 19, 2021, 6:14:00 PM
    Author     : DuyNQ
--%>

<%@page import="dal.ProductDAO"%>
<%@page import="model.Product"%>
<%@page import="model.Item"%>
<%@page import="model.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart Detail</title>
      
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="brand_color">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="titlepage">
                            <h2>Your Shopping Cart</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%
            Cart cart =(Cart) session.getAttribute("cart");
            if(cart!=null && cart.getList().size()!= 0 ){
        %>
        <div class="tableCart">
        <table >
            <tr>                
                <th>Images</th>
                <th>Name</th>
                <th>Quantity</th>
                <th>Price</th>
                <th>Delete</th>
            </tr>
            <% for (Item i : cart.getList()) {
            %>
            <tr>
                <td><img src="<%= i.getProduct().getImg()%>" width="70px"/></td>
                <td><%= i.getProduct().getBrand() + i.getProduct().getId()%></td>
                <td><%= i.getQuantity()%></td>
                <td><%= i.getProduct().showPrice(i.getPrice())%></td>
                <td><a href="deleteItem?idDelete=<%= i.getProduct().getId()%>" class="fa fa-times"></a></td>                
            </tr>            
            <%
                }%>
        </table>
        </div>
        <% Product product = new Product();%>
        <hr><br><div class="total"><h2>Total money: <%= product.showPrice(cart.getTotalMoney())%></h2></div><hr><br>
        <div id="check"><button class="add"><a  href="accExist?action=buy">Check out</a></button></div>
        <%  }
        %>
        <%@include file="footer.jsp" %>
    </body>
</html>
