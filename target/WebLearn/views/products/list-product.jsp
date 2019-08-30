<%--
  Created by IntelliJ IDEA.
  User: oenga
  Date: 8/26/19
  Time: 5:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Title</title>
    <%@include file="../layout/css.jsp"%>

</head>
<body>
<%@include file="../accounts/check_login.jsp"%>
<%@include file="../layout/header.jsp"%>
<div class="container mt-5">

    <c:if test="${products!= null}">
    <table class=" table table-hover table-striped">
        <caption>List of Products</caption>
        <thead class="thead-dark">
        <tr>
            <th scope="col">#ID</th>
            <th scope="col">Name</th>
            <th scope="col">Description</th>
            <th scope="col">Update</th>
            <th>Delete</th>
        </tr>
        </thead>
        <tbody>

        <c:forEach items="${products}" var="product">
            <tr>
                <td>${product.id}</td>
                <td>${product.name}</td>
                <td>${product.description}</td>
                <td><a href="update-product?productId=${product.id}" role="button" class="btn btn-primary">Edit</a></td>
                <td>
                    <form action="delete-product" method="post" >
                        <input type="hidden" name="productId" value="${product.id}"/>
                        <button class="btn btn-danger" type="submit" id="delete">Delete</button>
                    </form>
                </td>

            </tr>
        </c:forEach>


        </tbody>
    </table>
    </c:if>
    <a href="create-product" class="badge badge-primary">Add New Product</a>

<%@include file="../layout/js.jsp"%>
    <script>
        $(document).ready(function () {

        });
        $("#delete").click(function (e) {
            e.preventDefault();
            var form =$(this).parents('form');
            swal({
                title:'Are you sure?',
                text:'You will not be able to recover this operation!',
                type:'warning',
                showCancelButton:true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, delete it!',
                cancelButtonText: 'No, cancel please!',
                closeOnConfirm: false,

            },function (isConfirm) {
                if(isConfirm){
                    form.submit();
                }else{
                    swal(
                        'Cancelled',
                        'Your  product is safe :)',
                        'error'
                    );
                }

            });
        });
    </script>

</body>
</html>
