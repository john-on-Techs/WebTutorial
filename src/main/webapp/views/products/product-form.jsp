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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/css/bootstrap.min.css" >
</head>
<body>
<%
    response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
    if(session.getAttribute("user")==null){
        response.sendRedirect("login");
    }
%>
<div class="container login-container">
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
                        <input type="hidden" name="productId" value="${product.id}"/>
                    </c:if>
                    <div class="form-group">
                        <label for="productId">Product ID</label>
                        <input type="number" class="form-control" id="productId"
                               name="productId" placeholder="Enter product ID" value="${product.id}" <c:if test="${product !=null}">readonly</c:if> required>
                    </div>
                    <div class="form-group">
                        <label for="productName">Product Name</label>
                        <input type="text" name="productName" value="${product.name}" class="form-control"
                               id="productName" required
                               placeholder="Product Name">
                    </div>
                    <div class="form-group">
                        <label for="productDescription">Product Description</label>
                        <textarea class="form-control" rows="5" id="productDescription" name="productDescription" required></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary">Save</button>
                </form>
        </div>

    </div>
</div>


<script src="${pageContext.request.contextPath}/styles/js/jquery-3.2.1.slim.min.js"></script>
<script src="${pageContext.request.contextPath}/styles/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/styles/js/bootstrap.min.js"></script>
</body>
</html>
