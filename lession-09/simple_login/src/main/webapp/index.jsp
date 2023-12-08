<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <style type="text/css">
        body{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            display: flex;
            height: 100vh;
            align-items: center;
            justify-content: center;
            background-color: #dddd;
        }
        .login {
            height: 200px;
            width: 300px;
            margin: 20px auto;
            padding: 10px;
            border: 3px solid black;
            text-align: center;
        }

        .login input {
            padding: 5px;
            margin: 5px;
        }
    </style>
</head>
<body>
<form action="${pageContext.request.contextPath}/login" method="post">
    <div class="login">
        <h2>Login</h2>
        <label>
            <input type="text" name="username" size="30" placeholder="username"/>
        </label>
        <br>
        <label>
            <input type="password" name="password" size="30" placeholder="password"/>
        </label>
        <br>
        <input type="submit" value="Sign in"/>
    </div>
</form>
</body>
</html>