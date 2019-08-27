<%@ page import="java.util.ArrayList" %><%--
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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

</head>
<body>
<header>

</header>
<div class="alert alert-secondary" role="alert">

<div class="container">


    <table class=" table">
        <caption>List of Products</caption>
        <thead>
        <tr>
            <th scope="col">#ID</th>
            <th scope="col">Name</th>
            <th scope="col">Description</th>
            <th scope="col">Update|Delete</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${products}" var="product" >
            <tr>
                <td>${product.id}</td>
                <td>${product.name}</td>
                <td>${product.description}</td>
                <td> <a href="update-product?productId=${product.id}" role="button" class="btn btn-primary">Edit</a>
                    <form action="delete-product" method="post">
                        <input type="hidden" name="productId" value="${product.id}"/>
                        <button class="btn btn-danger">Delete</button>
                    </form>

            </tr>
        </c:forEach>



        </tbody>
    </table>
    <a href="create-product" class="badge badge-primary">Add New Product</a>
<%--    SHOW PRODUCT FORM--%>
    <!-- Button trigger modal -->
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
        Add new Product
    </button>

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="create-product" method="post">
                        <div class="form-group">
                            <label for="productId">Product ID</label>
                            <input type="number" class="form-control" id="productId" aria-describedby="emailHelp"
                                   placeholder="Enter product ID">
                        </div>
                        <div class="form-group">
                            <label for="productName">Product Name</label>
                            <input type="text" class="form-control" id="productName" placeholder="Product Name">
                        </div>

                        <div class="form-group">
                            <label for="productDescription">Product Description</label>
                            <textarea class="form-control " id="productDescription"
                                      placeholder="Required product description" required>
                    </textarea>
                        </div>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </div>
        </div>
    </div>
</div>


<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>
