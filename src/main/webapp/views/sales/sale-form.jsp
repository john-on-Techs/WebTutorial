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
    <div class="row">
        <div class="col-md-4 col-sm-6">
            <form action="create-sale" method="post">

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

                <button type="submit">Save</button>
            </form>

        </div>
    </div>
</div>

<%@include file="../layout/js.jsp"%>
<c:if test="${message!=null}">
    <c:if test="${type!=null}">
        <script>
            $(document).ready(function () {
                swal.fire(
                    'Message',
                    '${message}',
                    '${type}'
                );
            });
        </script>
    </c:if>
</c:if>
</body>
</html>
