<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/11/2023
  Time: 9:08 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete Product</title>
</head>
<body>
<h1>Delete product</h1>
<p>
    <a href="${pageContext.request.contextPath}/products">Back to product list</a>
</p>
<form method="post">
    <h3>Are you sure?</h3>
    <fieldset>
        <legend>
            Product information
        </legend>
        <table>
            <tr>
                <td>Name:</td>
                <td>
                    ${requestScope["product"].getName()}
                </td>
            </tr>

            <tr>
                <td>Price:</td>
                <td>
                    ${requestScope["product"].getPrice()}
                </td>
            </tr>

            <tr>
                <td>Description:</td>
                <td>
                    ${requestScope["product"].getDescription()}
                </td>
            </tr>

            <tr>
                <td>Manufacturer:</td>
                <td>
                    ${requestScope["product"].getManufacture()}
                </td>
            </tr>

            <tr>
                <td>
                    <label>
                        <input type="submit" value="Delete product">
                    </label>
                </td>
                <td>
                    <a href="${pageContext.request.contextPath}/products">Back to product list</a>
                </td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
