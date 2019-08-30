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
    <%@include file="../layout/css.jsp"%>

</head>
<body>

<%@include file="/views/layout/header.jsp"%>
<%@include file="/views/accounts/check_login.jsp"%>


<div class="container mt-5">

    <c:if test="${receivings!= null}">
    <table class=" table table-hover table-striped">
        <caption>List of Receiving</caption>
        <thead class="thead-dark">
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


        <%@include file="../layout/js.jsp"%>
</body>
</html>
