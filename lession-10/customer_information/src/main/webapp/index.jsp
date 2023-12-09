<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Customer" %>
<%@ page import="java.time.LocalDate" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Hiển thị danh sách khách hàng</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<%!

%>
<%
    List<Customer> customers = new ArrayList<>();
    customers.add(new Customer("Mai Văn Hoàn", LocalDate.of(1983, 8, 20), "Hà Nội", "/img/male01.jpg"));
    customers.add(new Customer("Nguyễn Văn Nam", LocalDate.of(1983, 8, 21), "Bắc Giang", "/img/male02.jpg"));
    customers.add(new Customer("Nguyễn Thái Hoà ", LocalDate.of(1983, 8, 22), "Nam Điịnh", "/img/kid01.jpg"));
    customers.add(new Customer("Trần Ngọc Mai", LocalDate.of(1983, 8, 17), "Hà Tây", "/img/female01.jpg"));
    customers.add(new Customer("Thái Thị Mỹ Hạnh", LocalDate.of(1983, 8, 19), "Hà Nội", "/img/female02.jpg"));

    System.out.println("customer-size:" + customers.size());
%>
<h1>Danh sách khách hàng</h1>
<table>
    <tr>
        <th>Tên</th>
        <th>Ngày Sinh</th>
        <th>Địa chỉ</th>
        <th>Ảnh</th>
    </tr>
    <c:forEach items="<%=customers%>" var="customer">
        <jsp:useBean id="DateTimeFormatter" scope="request" class="model.Customer"/>
        <tr>
            <td>
                    ${customer.name}
            </td>

            <td>
                    ${customer.address}
            </td>

            <td>
                <img src="${customer.imgFilePath}" alt="" width="50" height="50">
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>