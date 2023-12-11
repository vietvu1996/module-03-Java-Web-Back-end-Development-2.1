<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/11/2023
  Time: 9:22 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product List</title>
</head>
<body>
<h1>Customers</h1>
<p>
    <a href="${pageContext.request.contextPath}/products?action=create">Create new product</a>
</p>
<table border="1">
    <tr>
        <td>Name</td>
        <td>Price</td>
        <td>Description</td>
        <td>Manufacturer</td>
        <td>Find</td>
        <td>Edit</td>
        <td>Delete</td>
    </tr>
    <c:forEach items='${requestScope["products"]}' var="product">
        <tr>
            <td>
                <a href="${pageContext.request.contextPath}/products?action=view&id=${product.getId()}">${product.getName()}</a>
            </td>

            <td>
                    ${product.getPrice()}
            </td>

            <td>
                    ${product.getDescription()}
            </td>

            <td>
                    ${product.getManufacture()}
            </td>

            <td>
                <a href="${pageContext.request.contextPath}/products?action=find&name=${product.getName()}">Find</a>
            </td>
            <td>
                <a href="${pageContext.request.contextPath}/products?action=edit&id=${product.getId()}">edit</a>
            </td>
            <td>
                <a href="${pageContext.request.contextPath}/products?action=delete&id=${product.getId()}">delete</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
