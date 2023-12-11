<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/11/2023
  Time: 9:31 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View Product</title>
</head>
<body>
<h1>Product details</h1>
<p>
    <a href="${pageContext.request.contextPath}/products">Back to product list</a>
</p>
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
</table>
</body>
</html>
