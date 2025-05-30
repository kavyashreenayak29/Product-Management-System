<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add New Product</title>
<style>
    body { font-family: Arial, sans-serif; margin: 20px; background-color: #f4f4f4; }
    h1 { color: #333; }
    form { background-color: white; padding: 20px; border-radius: 8px; box-shadow: 0 0 10px rgba(0,0,0,0.1); width: 400px; margin: 20px 0; }
    label { display: block; margin-bottom: 5px; color: #555; }
    input[type="text"], input[type="number"] {
        width: calc(100% - 22px);
        padding: 10px;
        margin-bottom: 15px;
        border: 1px solid #ddd;
        border-radius: 4px;
    }
    input[type="submit"] {
        background-color: #28a745;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
    }
    input[type="submit"]:hover { background-color: #218838; }
    .message { margin-top: 15px; padding: 10px; border-radius: 5px; }
    .success { background-color: #d4edda; color: #155724; border: 1px solid #c3e6cb; }
    .error { background-color: #f8d7da; color: #721c24; border: 1px solid #f5c6cb; }
    .back-link { display: block; margin-top: 20px; color: #007bff; text-decoration: none; }
    .back-link:hover { text-decoration: underline; }
</style>
</head>
<body>
    <h1>Add New Product</h1>

    <%
        String message = (String) request.getAttribute("message");
        if (message != null && !message.isEmpty()) {
            String messageClass = message.contains("successfully") ? "success" : "error";
    %>
            <div class="message <%= messageClass %>">
                <%= message %>
            </div>
    <%
        }
    %>

    <form action="addProduct" method="post">
        <label for="productName">Product Name:</label>
        <input type="text" id="productName" name="productName" required><br/>

        <label for="category">Category:</label>
        <input type="text" id="category" name="category" required><br/>

        <label for="price">Price:</label>
        <input type="text" id="price" name="price" pattern="[0-9]+(\.[0-9]{1,2})?" title="Enter a valid price (e.g., 12.99)" required><br/>

        <label for="quantity">Quantity:</label>
        <input type="number" id="quantity" name="quantity" min="0" required><br/>

        <input type="submit" value="Add Product">
    </form>

    <a href="index.jsp" class="back-link">Back to Home</a>
</body>
</html>