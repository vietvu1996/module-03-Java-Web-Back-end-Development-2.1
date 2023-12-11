<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/11/2023
  Time: 9:04 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Create new Product</title>
</head>
<body>
<h1>Create new Product</h1>
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
            Product information
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
                <td>Price:</td>
                <td>
                    <label>
                        <input type="text" name="price" id="price">
                    </label>
                </td>
            </tr>

            <tr>
                <td>Description:</td>
                <td>
                    <label>
                        <input type="text" name="description" id="description">
                    </label>
                </td>
            </tr>

            <tr>
                <td>Manufacturer:</td>
                <td>
                    <label>
                        <input type="text" name="manufacture" id="manufacture">
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
