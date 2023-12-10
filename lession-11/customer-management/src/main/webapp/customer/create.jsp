<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/10/2023
  Time: 4:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Create new Customer</title>
    <style>

    </style>
</head>
<body>
<h1>Create new customer</h1>
<p>
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>
<p>
    <a href="${pageContext.request.contextPath}/customers">Back to customer list</a>
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
                        <input type="text" name="name" id="name">
                    </label>
                </td>
            </tr>
            <tr>
                <td>Email:</td>
                <td>
                    <label>
                        <input type="text" name="email" id="email">
                    </label>
                </td>
            </tr>

            <tr>
                <td>Address:</td>
                <td>
                    <label>
                        <input type="text" name="address" id="address">
                    </label>
                </td>
            </tr>

            <tr>
                <td></td>
                <td>
                    <label>
                        <input type="submit" value="Create customer">
                    </label>
                </td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
