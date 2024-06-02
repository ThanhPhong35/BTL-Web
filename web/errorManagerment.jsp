<%-- 
    Document   : errorManagerment
    Created on : Sep 13, 2023, 10:49:04 AM
    Author     : YOU
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error Managerment</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <style>
        body{
            height: 100vh;
            width: 100vw;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #c13434;      
        }
        *{
            margin: 0;
            padding: 0;
            text-decoration: none;
            list-style-type: none;
        }
        .warning{
            width: 600px;
            padding: 20px;
            background-color: #f3f3f3;
            text-align: center;
            font-size: 30px;   
        }
        
        .warning i{
            padding-right: 10px;
            color: #c13434;
        }
        .warning a{
            display: block;
            width: max-content;
            color: white;
            padding: 10px;
            border-radius: 10px;
            margin-top: 40px;
            background-color: #1e4298;
            margin: auto;
        }
    </style>
    <body>
        <div class="warning">
            
            <i class="fa-solid fa-triangle-exclamation"></i>
            ${requestScope.ms}
            <a href="home"> OK </a>
        </div>
    </body>
</html>
