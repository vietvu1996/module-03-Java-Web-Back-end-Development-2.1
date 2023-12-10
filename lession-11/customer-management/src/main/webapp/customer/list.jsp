<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/10/2023
  Time: 4:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Customer List</title>
</head>
<body>
<h1>Customers</h1>
<p>
    <a href="${pageContext.request.contextPath}/customers?action=create">Create new customer</a>
</p>
<table border="1">
    <tr>
        <td>Name</td>
        <td>Email</td>
        <td>Address</td>
        <td>Edit</td>
        <td>Delete</td>
    </tr>
    <c:forEach items='${requestScope["customers"]}' var="customer">
        <tr>
            <td>
                <a href="${pageContext.request.contextPath}/customers?action=view&id=${customer.getId()}">${customer.getName()}</a>
            </td>
            <td>
                    ${customer.getEmail()}
            </td>
            <td>
                    ${customer.getAddress()}
            </td>
            <td>
                <a href="${pageContext.request.contextPath}/customers?action=edit&id=${customer.getId()}">edit</a>
            </td>
            <td>
                <a href="${pageContext.request.contextPath}/customers?action=delete&id=${customer.getId()}">delete</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
