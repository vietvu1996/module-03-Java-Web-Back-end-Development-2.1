<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/10/2023
  Time: 4:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Deleting customer</title>
</head>
<body>
<h1>Delete customer</h1>
<p>
    <a href="${pageContext.request.contextPath}/customers">Back to customer list</a>
</p>
<form method="post">
    <h3>Are you sure?</h3>
    <fieldset>
        <legend>
            Customer information
        </legend>
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

            <tr>
                <td>
                    <label>
                        <input type="submit" value="Delete customer">
                    </label>
                </td>
                <td>
                    <a href="${pageContext.request.contextPath}/customers">Back to customer list</a>
                </td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
