<%-- 
    Document   : account
    Created on : Mar 11, 2021, 11:33:24 AM
    Author     : DuyNQ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account</title>
        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <link href="css/style_account.css" rel="stylesheet" type="text/css"/>
    
     
    </head>
    <body>
        <header> <%@include file="header.jsp" %></header>
        <% String error =(String) request.getAttribute("error"); //        
        %>
        <div class="brand_color">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="titlepage">
                            <h2>LogIn</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <section class="ftco-section">
            <div class="container">
                <%--<div class="row justify-content-center">
                    <div class="col-md-6 text-center mb-5">
                        <h2 class="heading-section">Login</h2>
                    </div>--%>
                </div>
                <div class="row justify-content-center">
                    <div class="col-md-12 col-lg-10">
                        <div class="wrap d-md-flex">
                            <div class="img" style="background-image: url(images/bg-4.jpg);">
                            </div>
                            <div class="login-wrap p-4 p-md-5">
                                <div class="d-flex">
                                    <div class="w-100">
                                        <h3 class="mb-4">Login </h3>
                                    </div>
                                    <div class="w-100">
                                        <p class="social-media d-flex justify-content-end">
                                            <%--   <a href="#" class="social-icon d-flex align-items-center justify-content-center"><span class="fa fa-facebook"></span></a>
                                            <a href="#" class="social-icon d-flex align-items-center justify-content-center"><span class="fa fa-twitter"></span></a>
                                            --%>                                        
                                        </p>
                                    </div>
                                </div>
                                <form action="account" class="signin-form" method="get">
                                    <div class="form-group mb-3">
                                        <label class="label" for="name">Username</label>
                                        <input type="text" class="form-control" value="<%= userr %>" placeholder="Username" name="user" required>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label class="label" for="password">Password</label>
                                        <input type="password" class="form-control" value="<%= passs %>"placeholder="Password" name="pass" required>
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" class="form-control btn btn-primary rounded submit px-3">Log In</button>
                                    </div>                                    
                                    <div class="error">
                                        <% if(error!=null){ %>
                                        <span><%= error %></span>
                                        <% } %>
                                    </div>
                                     <div class="form-group d-md-flex">
                                        <div class="w-50 text-left">                                            
                                        </div>                                        
                                    </div>
                                </form>
                                <p class="text-center">Not a member? <a data-toggle="tab" href="signUp">Sign Up</a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <script src="js/jquery.min.js"></script>
        <script src="js/popper.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>
       <footer><%@include file="footer.jsp" %></footer>
    </body>
    
</html>
