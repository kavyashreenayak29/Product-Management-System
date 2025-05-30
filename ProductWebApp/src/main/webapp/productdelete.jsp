<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Product</title>
<style>
    body { font-family: Arial, sans-serif; margin: 20px; background-color: #f4f4f4; }
    h1 { color: #333; }
    form { background-color: white; padding: 20px; border-radius: 8px; box-shadow: 0 0 10px rgba(0,0,0,0.1); width: 400px; margin: 20px 0; }
    label { display: block; margin-bottom: 5px; color: #555; }
    input[type="text"] {
        width: calc(100% - 22px);
        padding: 10px;
        margin-bottom: 15px;
        border: 1px solid #ddd;
        border-radius: 4px;
    }
    input[type="submit"] {
        background-color: #dc3545;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
    }
    input[type="submit"]:hover { background-color: #c82333; }
    .message { margin-top: 15px; padding: 10px; border-radius: 5px; }
    .success { background-color: #d4edda; color: #155724; border: 1px solid #c3e6cb; }
    .error { background-color: #f8d7da; color: #721c24; border: 1px solid #f5c6cb; }
    .back-link { display: block; margin-top: 20px; color: #007bff; text-decoration: none; }
    .back-link:hover { text-decoration: underline; }
</style>
</head>
<body>
    <h1>Delete Product</h1>

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

    <form action="deleteProduct" method="get"> <%-- Using GET for simplicity for deletion from a form --%>
        <p>Enter Product ID to delete:</p>
        <label for="productId">Product ID:</label>
        <input type="text" id="productId" name="id" required><br/>
        <input type="submit" value="Delete Product">
    </form>

    <a href="index.jsp" class="back-link">Back to Home</a>
</body>
</html>