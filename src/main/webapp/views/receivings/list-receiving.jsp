<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: oenga
  Date: 8/29/19
  Time: 4:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/css/bootstrap.min.css">

</head>
<body>

<%
    response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
    if (session.getAttribute("user") == null) {
        response.sendRedirect("login");
    }

%>

<div class="container">

    <c:if test="${receivings!= null}">
    <table class=" table">
        <caption>List of Receiving</caption>
        <thead>
        <tr>
            <th scope="col">#ID</th>
            <th scope="col">Batch No</th>
            <th scope="col">Product ID</th>
            <th scope="col">Date</th>
            <th scope="col">Quantity</th>
            <th scope="col">Buying Price</th>
            <th scope="col">Selling Price</th>
            <th></th>
            <th></th>

        </tr>
        </thead>
        <tbody>

        <c:forEach items="${receivings}" var="receiving">
            <tr>
                <td>${receiving.receiveId}</td>
                <td>${receiving.batchNo}</td>
                <td>${receiving.productId}</td>
                <td>${receiving.date}</td>
                <td>${receiving.quantity}</td>
                <td>${receiving.buyingPrice}</td>
                <td>${receiving.sellingPrice}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    </c:if>
    <a href="create-receiving" class="badge badge-primary">Receive Products</a>


    <script src="${pageContext.request.contextPath}/styles/js/jquery-3.2.1.slim.min.js"></script>
    <script src="${pageContext.request.contextPath}/styles/js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/styles/js/bootstrap.min.js"></script>
</body>
</html>
