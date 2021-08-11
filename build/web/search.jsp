<%-- 
    Document   : search
    Created on : Mar 10, 2021, 8:18:20 PM
    Author     : DuyNQ
--%>

<%@page import="model.Product"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Page</title>             
        <link href="css/jquery.mCustomScrollbar.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/owl.carousel.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/responsive.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>
        <header> <%@include file="header.jsp" %></header>
        <div class="brand_color">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="titlepage">
                            <h2>Search Product</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br>
        <%
            List<Object> listGender = (List<Object>) request.getAttribute("listGender");
            List<Object> listBrand = (List<Object>) request.getAttribute("listBrand");
            List<Object> listCategory = (List<Object>) request.getAttribute("listCategory");
            List<Object> listMaterial = (List<Object>) request.getAttribute("listMaterial");
        %>


        <div class="showAllSearch">    
        <form action="search" method="post">                       
                <div class="showAllSearch search">
                    <select class="select" name="gender">
                        <option value="Gender"  selected>Gender</option>
                        <% for (Object o : listGender) {
                        %>
                        <option value="<%= o%>"><%= o%></option>
                        <%
                            }
                        %>
                    </select>
                </div>
                <div class="showAllSearch search">
                    <select class="select" name="brand">
                        <option value="Brand"  selected>Brand</option>
                        <% for (Object o : listBrand) {
                        %>
                        <option value="<%= o%>"><%= o%></option>
                        <%
                            }
                        %>
                    </select>
                </div>
                <div class="showAllSearch search">
                    <select class="select" name="category">
                        <option value="Category" selected>Category</option>
                        <% for (Object o : listCategory) {
                        %>
                        <option value="<%= o%>"><%= o%></option>
                        <%
                            }
                        %>
                    </select>
                </div>
                <div class="showAllSearch search">
                    <select class="select" name="material">
                        <option value="Material" selected>Material</option>
                        <% for (Object o : listMaterial) {
                        %>
                        <option value="<%= o%>"><%= o%></option>
                        <%
                            }
                        %>
                    </select>
                </div>
                <div class="showAllSearch search">
                    <select class="select" name="price">
                        <option value="price" selected>Price</option> 
                        <option value="1-10" >1.000.000VND to 10.000.000VND</option> 
                        <option value="10-20" >10.000.000VND to 20.000.000VND</option> 
                        <option value="20-30" >20.000.000VND to 30.000.000VND</option> 
                        <option value="30-40" >30.000.000VND to 40.000.000VND</option> 
                        <option value="40-50" >40.000.000VND to 50.000.000VND</option> 
                        <option value=">50" >50.000.000VND to ???</option> 
                    </select>
                </div>

            
            <div class="showAllSearch search"><input type="submit" value="Search" /></div>
        </form>
        </div>

        <%@include file="showList.jsp" %>
        <footer><%@include file="footer.jsp" %></footer>      
    </body>
</html>
