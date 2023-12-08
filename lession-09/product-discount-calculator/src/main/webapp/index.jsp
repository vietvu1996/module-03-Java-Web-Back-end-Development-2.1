<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Product Discount Calculator</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>

<body>
<form action="${pageContext.request.contextPath}/discount" method="post">
    <div class="calculate">
        <h2>Discount Servlet</h2>
        <label>Product Description :</label><br/>
        <label>
            <input type="text" name="description"><br/>
        </label>

        <label>List Price :</label><br/>
        <label>
            <input type="text" name="price"><br/>
        </label>

        <label>Discount Percent :</label><br/>
        <label>
            <input type="text" name="discount"><br/>
        </label>

        <label>
            <input type="submit" id="submit" value="Calculate Discount"/>
        </label>
    </div>
</form>
</body>
</html>