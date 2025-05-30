<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- ADDED THIS LINE --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Products</title>
<style>
    body { font-family: Arial, sans-serif; margin: 20px; background-color: #f4f4f4; }
    h1 { color: #333; }
    table { width: 100%; border-collapse: collapse; margin-top: 20px; background-color: white; box-shadow: 0 0 10px rgba(0,0,0,0.1); }
    th, td { border: 1px solid #ddd; padding: 10px; text-align: left; }
    th { background-color: #007bff; color: white; }
    tr:nth-child(even) { background-color: #f2f2f2; }
    .actions a {
        display: inline-block;
        padding: 5px 10px;
        margin: 2px;
        border-radius: 4px;
        text-decoration: none;
        color: white;
    }
    .edit-btn { background-color: #ffc107; color: #333; }
    .delete-btn { background-color: #dc3545; }
    .edit-btn:hover { background-color: #e0a800; }
    .delete-btn:hover { background-color: #c82333; }
    .message { margin-top: 15px; padding: 10px; border-radius: 5px; }
    .success { background-color: #d4edda; color: #155724; border: 1px solid #c3e6cb; }
    .error { background-color: #f8d7da; color: #721c24; border: 1px solid #f5c6cb; }
    .no-products { margin-top: 20px; color: #666; }
    .back-link { display: block; margin-top: 20px; color: #007bff; text-decoration: none; }
    .back-link:hover { text-decoration: underline; }
</style>
</head>
<body>
    <h1>All Products</h1>

    <%-- Display messages from other servlets (e.g., add, update, delete) --%>
    <c:if test="${not empty message}">
        <div class="message <c:out value="${fn:contains(message, 'successfully') ? 'success' : 'error'}" />">
            <c:out value="${message}" />
        </div>
    </c:if>

    <c:choose>
        <c:when test="${not empty products}">
            <table>
                <thead>
                    <tr>
                        <th>Product ID</th>
                        <th>Product Name</th>
                        <th>Category</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="product" items="${products}">
                        <tr>
                            <td><c:out value="${product.productId}" /></td>
                            <td><c:out value="${product.productName}" /></td>
                            <td><c:out value="${product.category}" /></td>
                            <td><c:out value="${product.price}" /></td>
                            <td><c:out value="${product.quantity}" /></td>
                            <td class="actions">
                                <a href="updateProduct?id=<c:out value="${product.productId}" />" class="edit-btn">Edit</a>
                                <a href="deleteProduct?id=<c:out value="${product.productId}" />" class="delete-btn" onclick="return confirm('Are you sure you want to delete this product?');">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:when>
        <c:otherwise>
            <p class="no-products">No products found.</p>
        </c:otherwise>
    </c:choose>

    <a href="index.jsp" class="back-link">Back to Home</a>
</body>
</html>