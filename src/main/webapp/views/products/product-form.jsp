<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: oenga
  Date: 8/26/19
  Time: 5:30 PM
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
<div class="container login-container mt-5">
    <div class="row">
        <div class="col-md-6 login-form-1">
            <h2>
                <c:if test="${product != null}">
                    Edit Product
                </c:if>
                <c:if test="${product == null}">
                    Add New Product
                </c:if>
            </h2>
            <c:if test="${product != null}">
            <form action="update-product" method="post"></c:if>
                <c:if test="${product == null}">
                <form action="create-product" method="post"></c:if>

                    <c:if test="${product != null}">
                        <input type="hidden" name="productId" required value="${product.id}"/>
                    </c:if>
                    <div class="form-group">
                        <label for="productId">Product ID</label>
                        <input type="number" class="form-control" id="productId" required
                               name="productId" placeholder="Enter product ID" value="${product.id}" <c:if test="${product !=null}">readonly</c:if> required>
                    </div>
                    <div class="form-group">
                        <label for="productName">Product Name</label>
                        <input type="text" name="productName" required value="${product.name}" class="form-control"
                               id="productName" required
                               placeholder="Product Name">
                    </div>
                    <div class="form-group">
                        <label for="productDescription">Product Description</label>
                        <textarea class="form-control"  rows="5" id="productDescription" name="productDescription" required>${product.description}</textarea>
                    </div>
                    <button type="submit" class="btn btn-primary">Save</button>
                </form>
        </div>

    </div>
</div>

<%@include file="../layout/js.jsp"%>
</body>
</html>
