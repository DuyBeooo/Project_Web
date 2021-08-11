<%-- 
    Document   : test
    Created on : Mar 13, 2021, 2:31:37 PM
    Author     : DuyNQ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Test CSS</title>
        <style>

            .flex-container {
                display: flex;
                flex-wrap: nowrap;
                background-color: green;
            }

            .flex-container .box {
                background-color: #f1f1f1;
                width: 50%;
                margin: 10px;
                text-align: center;
                line-height: 75px;
                font-size: 30px;
            }

        </style>

    </head>
    <body>

        <form action="#" id="usrform">  
            Name: <input type="text" name="usrname">  
            <input type="submit">  
        </form>  
        <br>  
        <textarea rows="9" cols="70" name="comment" form="usrform"> 
Nhập văn bản...
        </textarea>
    </body>
</html>
