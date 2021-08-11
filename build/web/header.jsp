<%-- 
    Document   : header
    Created on : Jan 24, 2021, 9:02:09 AM
    Author     : DuyNQ
--%>

<%@page import="model.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Header Page</title>
        <!-- bootstrap css -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- style css -->              
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <!-- Responsive-->
        <link rel="stylesheet" href="css/responsive.css">
        <!-- fevicon -->
        <link rel="icon" href="images/fevicon.png" type="image/gif" />
        <!-- Scrollbar Custom CSS -->
        <link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css">

        <!-- Tweaks for older IEs-->
        <%-- <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">--%>
        <!-- owl stylesheets -->
        <%--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">--%>
        <%--<link rel="stylesheet" href="css/owl.carousel.min.css">--%>
        <%--<link rel="stylesheet" href="css/owl.theme.default.min.css">--%>
        <%-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen">      --%>                  
        <link href="css/css2.css" rel="stylesheet" type="text/css"/>
    </head>

    <body>
        <% Cookie[] c = request.getCookies();
            String userr = "";
            String passs = "";
            if (c != null) {
                for (int idx = 0; idx < c.length; idx++) {
                    if (c[idx].getName().equals("user")) {
                        userr = c[idx].getValue();
                    }
                    if (c[idx].getName().equals("pass")) {
                        passs = c[idx].getValue();
                    }
                }
            }
            Integer size = 0;
            if (session.getAttribute("size") != null) {
                size = (Integer) session.getAttribute("size");
            }
        %>
        <header>
            <!-- header inner -->
            <div class="header">

                <div class="container">
                    <div class="row">
                        <div class="col-xl-3 col-lg-3 col-md-3 col-sm-3 col logo_section">
                            <div class="full">
                                <div class="center-desk">
                                    <div class="logo">
                                        <a href="home"><img src="images/logo2.jpg"  ></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-9 col-lg-9 col-md-9 col-sm-9">
                            <div class="menu-area">
                                <div class="limit-box">
                                    <nav class="main-menu">
                                        <ul class="menu-area-main">
                                            <li class="active"> <a href="home">Home</a> </li>
                                            <li> <a href="search">Search</a> </li>
                                            <li><a href="accExist">Account</a></li>
                                            <li><a href="accExist?action=history">History</a></li>
                                                <% if (userr.equalsIgnoreCase("admin")) { %>
                                            <li><a href="home?action=up">Update</a></li> <% } %>
                                            <li><a href="contact">Contact Us</a></li>                                            
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 offset-md-6">
                            <div class="location_icon_bottum">
                                <ul>
                                    <li><img src="images/call2.png" />0123456789</li>
                                    <li><img src="images/email2.png" />duy@gmail.com</li>
                                        <% if (userr.trim().length() != 0) {%>                                                
                                    <li><a href="accExist"><%= userr%></a></li>
                                        <% }%>

                                    <li class="last">
                                        <a href="showCart.jsp"><img src="images/shopping-cart-32.ico" alt="icon" />(<%= size%>)</a>

                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- end header inner -->
        </header>
        <!-- end header -->
        <br/><br/><hr>
    </body>
</html>
