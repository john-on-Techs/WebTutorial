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
    <%@include file="../layout/css.jsp"%>

</head>

<body>
<%@include file="/views/layout/header.jsp"%>
<%@include file="/views/accounts/check_login.jsp"%>
<div class="container mt-5">
    <div class="row">
        <div class="col-md-4 col-sm-6">

            <form action="create-receiving" method="post">
                <div class="form-group">
                    <label for="batchNo">Batch No:</label>
                    <input type="number" name="batchNo" class="form-control"
                           id="batchNo" required
                           placeholder="Batch No">
                </div>
                <div class="form-group">
                    <label for="productId">Product</label>
                    <select class="form-control" id="productId" name="productId" required>
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
                           placeholder="Buying Price">
                </div>
                <button type="submit">Save</button>
            </form>
        </div>
    </div>
</div>

<%@include file="../layout/js.jsp"%>
</body>
</html>
