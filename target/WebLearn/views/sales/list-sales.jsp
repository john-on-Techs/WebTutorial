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
    <%@include file="../layout/css.jsp"%>
</head>
<body>
<%@include file="../accounts/check_login.jsp"%>
<%@include file="../layout/header.jsp"%>
<div class="container mt-5">

    <c:if test="${sales!= null}">
    <table class=" table table-hover table-striped">
        <caption>List of Sales</caption>
        <thead class="thead-dark">
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


        <%@include file="../layout/js.jsp"%>
        <c:if test="${message!=null}">
        <c:if test="${type!=null}">
        <script>
            $(document).ready(function () {
                swal.fire({
                    position: 'top-end',
                    type: '${type}',
                    title: '${message}',
                    showConfirmButton: false,
                    timer: 1500
                });
                <%
                request.getServletContext().removeAttribute("type");
                request.getServletContext().removeAttribute("message");

                %>
            });
        </script>
        </c:if>
        </c:if>
</body>
</html>
