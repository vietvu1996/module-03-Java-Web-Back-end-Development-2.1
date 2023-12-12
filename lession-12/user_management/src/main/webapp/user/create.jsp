<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/11/2023
  Time: 4:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>User Management Application</title>
</head>
<body>
<div style="text-align: center;">
    <h1>User Management</h1>
    <h2>
        <a href="${pageContext.request.contextPath}/users?action=users">List All Users</a>
    </h2>
</div>
<div align="center">
    <form method="post">
        <table border="1" cellpadding="5">
            <caption>
                <h2>Add New User</h2>
            </caption>
            <tr>
                <th>
                    User Name:
                </th>
                <td>
                    <label>
                        <input type="text" name="name" id="name" size="45"/>
                    </label>
                </td>
            </tr>

            <tr>
                <th>
                    User Email:
                </th>
                <td>
                    <label>
                        <input type="text" name="email" id="email" size="45"/>
                    </label>
                </td>
            </tr>

            <tr>
                <th>
                    Country:
                </th>
                <td>
                    <label>
                        <input type="text" name="country" id="country" size="15"/>
                    </label>
                </td>
            </tr>

            <tr>
                <td colspan="2" align="center">
                    <label>
                        <input type="submit" value="Save"/>
                    </label>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
