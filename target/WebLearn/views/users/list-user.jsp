<%--
  Created by IntelliJ IDEA.
  User: oenga
  Date: 8/29/19
  Time: 7:28 PM
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

    <c:if test="${users!= null}">
    <table class=" table table-hover table-striped table-sm table-responsive">
        <caption>List of Users</caption>
        <thead class="thead-dark">
        <tr>
            <th scope="col">#ID</th>
            <th scope="col">Name</th>
            <th>Update</th>
            <th>Delete</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${users}" var="dbUser" >
            <tr>
                <td>${dbUser.id}</td>
                <td>${dbUser.name}</td>

                <td> <a href="update-user?userId=${dbUser.id}" role="button" class="btn btn-primary">Edit</a></td>
                <td><form action="delete-user" method="post" id="delete-form">
                    <input type="hidden" name="userId" value="${dbUser.id}"/>
                    <button class="btn btn-danger" type="submit">Delete</button>
                </form></td>

            </tr>
        </c:forEach>
        </tbody>
    </table>
    </c:if>
    <a href="create-user" class="badge badge-primary">Add New User</a>
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
        <script>
            $(document).ready(function (e) {
                $("#delete-form").submit(function (event) {
                    event.preventDefault();
                    var form =this;

                    swal.fire({
                        title:'Are you sure?',
                        text:'You will not be able to recover this operation!',
                        type:'warning',
                        showCancelButton:true,
                        confirmButtonColor: '#3085d6',
                        cancelButtonColor: '#d33',
                        confirmButtonText: 'Yes, delete it!',
                        cancelButtonText: 'No, cancel please!',
                        closeOnConfirm: false,
                    }).then((result) => {
                        if (result.value) {
                            form.submit();

                        }
                    });
                });
            });
        </script>
</body>
</html>
