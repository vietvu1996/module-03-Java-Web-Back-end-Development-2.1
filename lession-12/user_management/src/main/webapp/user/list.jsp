<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/11/2023
  Time: 3:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Management Application</title>
</head>
<body>
<div style="text-align: center;">
    <h1>User Management</h1>
    <h2>
        <a href="${pageContext.request.contextPath}/users?action=create">Add New User</a>
    </h2>
</div>
<div align="center">
    <table border="1" cellpadding="5">
        <caption><h2>
            List of Users
        </h2></caption>
        <tr>
            <td>ID</td>
            <td>Name</td>
            <td>Email</td>
            <td>Country</td>
            <td>Actions</td>
        </tr>

        <c:forEach var="user" items="${listUser}">
            <tr>
                <td>
                    <c:out value="${user.id}"/>
                </td>

                <td>
                    <c:out value="${user.name}"/>
                </td>

                <td>
                    <c:out value="${user.email}"/>
                </td>

                <td>
                    <c:out value="${user.country}"/>
                </td>

                <td>
                    <a href="${pageContext.request.contextPath}/users?action=update&id=${user.id}">Edit</a>
                    <a href="${pageContext.request.contextPath}/users?action=delete&id=${user.id}">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
