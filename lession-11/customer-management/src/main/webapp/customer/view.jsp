<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/10/2023
  Time: 4:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>View customer</title>
</head>
<body>
<h1>Customer details</h1>
<p>
    <a href="${pageContext.request.contextPath}/customers">Back to customer list</a>
</p>
<table>
    <tr>
        <td>Name:</td>
        <td>
            ${requestScope["customer"].getName()}
        </td>
    </tr>

    <tr>
        <td>Email:</td>
        <td>
            ${requestScope["customer"].getEmail()}
        </td>
    </tr>

    <tr>
        <td>Address:</td>
        <td>
            ${requestScope["customer"].getAddress()}
        </td>
    </tr>
</table>
</body>
</html>