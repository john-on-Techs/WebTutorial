<%--
  Created by IntelliJ IDEA.
  User: oenga
  Date: 8/29/19
  Time: 11:51 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<form action="create-receiving" method="post">
    <div class="form-group">
        <label for="batchNo">Batch No:</label>
        <input type="number" name="batchNo" class="form-control"
               id="batchNo" required
               placeholder="Batch No">
    </div>
    <div class="form-group">
        <label for="productId">Product</label>
        <select class="form-control" id="productId" name="productId">
            <c:forEach items="${products}" var="product">
                <option value="${product.id}">${product.name}</option>
            </c:forEach>

        </select>
    </div>
    <div class="form-group">
        <label for="quantity">Quantity:</label>
        <input type="number" name="quantity" class="form-control"
               id="quantity" required
               placeholder="Quantity">
    </div>
    <div class="form-group">
        <label for="sellingPrice">Selling Price:</label>
        <input type="number" name="sellingPrice" class="form-control"
               id="sellingPrice" required
               placeholder="Selling Price">
    </div>
    <div class="form-group">
        <label for="buyingPrice">Buying Price:</label>
        <input type="number" name="buyingPrice" class="form-control"
               id="buyingPrice" required
               placeholder="Selling Price">
    </div>
    <button type="submit">Save</button>
</form>

<script src="${pageContext.request.contextPath}/styles/js/jquery-3.2.1.slim.min.js"></script>
<script src="${pageContext.request.contextPath}/styles/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/styles/js/bootstrap.min.js"></script>
</body>
</html>
