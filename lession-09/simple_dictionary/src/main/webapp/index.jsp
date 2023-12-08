<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Simple Dictionary</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            display: flex;
            height: 100vh;
            align-items: center;
            justify-content: center;
            background-color: #dddd;
        }

        .dictionary {
            height: 250px;
            width: 300px;
            margin: 20px auto;
            padding: 10px;
            border: 3px solid black;
            text-align: center;
        }

        .dictionary input {
            padding: 5px;
            margin: 5px;
        }
    </style>
</head>
<body>
<div class="dictionary">
    <h2>Vietnamese Dictionary</h2>
    <form action="${pageContext.request.contextPath}/translate" method="post">
        <label>
            <input type="text" name="txtSearch" placeholder="Enter your word: "/>
        </label>
        <label>
            <input type="submit" id="submit" value="search"/>
        </label>
    </form>
</div>
</body>
</html>