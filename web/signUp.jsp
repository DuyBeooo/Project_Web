<%-- 
    Document   : signUp.jsp
    Created on : Mar 16, 2021, 8:19:30 PM
    Author     : DuyNQ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up</title>
        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="css/style_account.css" rel="stylesheet" type="text/css"/>   
    </head>
   
    <body>
        <header> <%@include file="header.jsp" %></header>
        <div class="brand_color">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="titlepage">
                            <h2>Sign Up</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>        
        <% String captcha = (String)request.getAttribute("captcha"); 
           String message = (String) request.getAttribute("mess"); 
        %>        
        <section class="ftco-section">
            <div class="container">               
                <div class="row justify-content-center">
                    <div class="col-md-12 col-lg-10">
                        <div class="wrap d-md-flex">
                            <div class="img" style="background-image: url(images/bg-7.jpg);">
                            </div>
                            <div class="login-wrap p-4 p-md-5">
                                <div class="d-flex">
                                    <div class="w-100">
                                        <h3 class="mb-4">Sign Up</h3>
                                    </div>                                   
                                </div>
                                <form action="signUp" class="signin-form" method="post">
                                    <div class="form-group mb-3">
                                        <label class="label" for="name">Enter Username</label>
                                        <input type="text" class="form-control" name="userSignUp"  >
                                    </div>
                                    <div class="form-group mb-3">
                                        <label class="label" for="password">Enter Password</label>
                                        <input type="password" class="form-control" name="passSignUp1" >
                                    </div>
                                     <div class="form-group mb-3">
                                        <label class="label" for="password">Enter Password Again</label>
                                        <input type="password" class="form-control" name="passSignUp2">
                                    </div>
                                    <div class="form-group mb-3">
                                        <label class="label" for="password">Enter Captcha code </label>
                                        <input type="text" class="form-control" value="<%= captcha %>" name="captchaSignUp1" readonly >
                                        <input type="text" class="form-control" name="captchaSignUp2" >
                                    </div>
                                        <% if(message != null){ %>
                                        <h2><%= message %></h2>
                                    <% } %>
                                    <div class="form-group">
                                        <button type="submit" class="form-control btn btn-primary rounded submit px-3">Sign Up</button>
                                    </div>                                    
                                    <div class="form-group d-md-flex">
                                        <div class="w-50 text-left">                                            
                                        </div>                                        
                                    </div>
                                </form>                                
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
