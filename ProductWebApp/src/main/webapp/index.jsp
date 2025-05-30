<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Management System</title>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
<style>
    body {
        font-family: 'Poppins', sans-serif;
        background-color: #f0f2f5;
        margin: 0;
        padding: 0;
    }
    .main-content {
        display: flex;
        justify-content: center;
        align-items: center;
        height: calc(100vh - 120px); /* Adjusted height for header + footer */
    }
    .container {
        background-color: white;
        padding: 40px;
        border-radius: 15px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        text-align: center;
        max-width: 400px;
        width: 90%;
    }
    h1 {
        color: #333;
        margin-bottom: 30px;
    }
    ul {
        list-style-type: none;
        padding: 0;
        margin: 0;
    }
    li {
        margin-bottom: 15px;
    }
    a {
        display: inline-block;
        padding: 12px 20px;
        background-color: #007bff;
        color: white;
        text-decoration: none;
        border-radius: 8px;
        font-weight: 600;
        transition: all 0.3s ease;
        width: 100%;
        box-sizing: border-box;
    }
    a:hover {
        background-color: #0056b3;
        transform: translateY(-3px);
        box-shadow: 0 4px 10px rgba(0,0,0,0.2);
    }
</style>
</head>
<body>

<%@ include file="header.jsp" %>

<div class="main-content">
    <div class="container">
        <h1>Welcome to Product Management System</h1>
        <ul>
            <li><a href="productadd.jsp">Add New Product</a></li>
            <li><a href="displayProducts">View All Products</a></li>
            <li><a href="productupdate.jsp">Update Product Details</a></li>
            <li><a href="productdelete.jsp">Delete Product</a></li>
            <li><a href="showReportForm">Generate Reports</a></li>
        </ul>
    </div>
</div>



</body>
</html>
