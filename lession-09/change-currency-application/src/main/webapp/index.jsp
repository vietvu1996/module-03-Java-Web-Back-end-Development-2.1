<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Currency Converter</title>
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

        .convert {
            height: 250px;
            width: 300px;
            margin: 20px auto;
            padding: 10px;
            border: 3px solid black;
            text-align: center;
        }

        .convert input {
            padding: 5px;
            margin: 5px;
        }
    </style>
</head>
<body>
<form action="${pageContext.request.contextPath}/convert" method="post">
    <div class="convert">
        <h2>Currency Converter</h2>
        <label>Rate: </label><br/>
        <label>
            <input type="text" name="rate" placeholder="RATE" value="23000"/>
        </label><br/>
        <label>USD: </label><br/>
        <label>
            <input type="text" name="usd" placeholder="USD" value="0"/><br/>
        </label>
        <label>
            <input type="submit" id="submit" value="Converter"/>
        </label>
    </div>
</form>
</body>
</html>