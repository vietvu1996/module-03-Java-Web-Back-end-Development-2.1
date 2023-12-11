<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/11/2023
  Time: 9:15 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Product</title>
</head>
<body>
<h1>
    Edit Product
</h1>
<p>
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>
<p>
    <a href="${pageContext.request.contextPath}/products">Back to product list</a>
</p>
<form method="post">
    <fieldset>
        <legend>
            Customer information
        </legend>
        <table>
            <tr>
                <td>Name:</td>
                <td>
                    <label>
                        <input type="text" name="name" id="name" value="${requestScope["products"].getName()}">
                    </label>
                </td>
            </tr>

            <tr>
                <td>Price:</td>
                <td>
                    <label>
                        <input type="text" name="price" id="price" value="${requestScope["products"].getPrice()}">
                    </label>
                </td>
            </tr>

            <tr>
                <td>Description:</td>
                <td>
                    <label>
                        <input type="text" name="description" id="description" value="${requestScope["products"].getDescription()}">
                    </label>
                </td>
            </tr>
            <tr>
                <td>Manufacturer:</td>
                <td>
                    <label>
                        <input type="text" name="manufacture" id="manufacture" value="${requestScope["products"].getManufacturer()}">
                    </label>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <label>
                        <input type="submit" value="Update Customer">
                    </label>
                </td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
