<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: oenga
  Date: 8/29/19
  Time: 5:35 PM
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
    response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
    if(session.getAttribute("user")==null){
        response.sendRedirect("login");
    }
%>



<div class="container">

    <c:if test="${sales!= null}">
    <table class=" table">
        <caption>List of Sales</caption>
        <thead>
        <tr>
            <th scope="col">#ID</th>
            <th scope="col">Date</th>
            <th scope="col">Product ID</th>
            <th scope="col">Selling Price</th>
            <th scope="col">Quantity</th>

        </tr>
        </thead>
        <tbody>

        <c:forEach items="${sales}" var="sale">
            <tr>
                <td>${sale.id}</td>
                <td>${sale.date}</td>
                <td>${sale.productId}</td>
                <td>${sale.sellingPrice}</td>
                <td>${sale.quantity}</td>

            </tr>
        </c:forEach>
        </tbody>
    </table>
    </c:if>
    <a href="create-sale" class="badge badge-primary">Sale Product</a>



<script src="${pageContext.request.contextPath}/styles/js/jquery-3.2.1.slim.min.js"></script>
<script src="${pageContext.request.contextPath}/styles/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/styles/js/bootstrap.min.js"></script>
</body>
</html>
