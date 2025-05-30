<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- ADDED THIS LINE --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Report Results</title>
<style>
    body { font-family: Arial, sans-serif; margin: 20px; background-color: #f4f4f4; }
    h1 { color: #333; }
    h2 { color: #555; margin-top: 30px; }
    table { width: 100%; border-collapse: collapse; margin-top: 20px; background-color: white; box-shadow: 0 0 10px rgba(0,0,0,0.1); }
    th, td { border: 1px solid #ddd; padding: 10px; text-align: left; }
    th { background-color: #007bff; color: white; }
    tr:nth-child(even) { background-color: #f2f2f2; }
    .message { margin-top: 15px; padding: 10px; border-radius: 5px; }
    .success { background-color: #d4edda; color: #155724; border: 1px solid #c3e6cb; }
    .error { background-color: #f8d7da; color: #721c24; border: 1px solid #f5c6cb; }
    .no-results { margin-top: 20px; color: #666; }
    .back-link { display: block; margin-top: 20px; color: #007bff; text-decoration: none; }
    .back-link:hover { text-decoration: underline; }
</style>
</head>
<body>
    <h1>Report Results</h1>

    <%-- Display message from servlet --%>
    <c:if test="${not empty message}">
        <div class="message error">
            <c:out value="${message}" />
        </div>
    </c:if>

    <c:if test="${empty message}">
        <h2><c:out value="${reportTitle}" /></h2>
        <c:choose>
            <c:when test="${not empty reportProducts}">
                <table>
                    <thead>
                        <tr>
                            <th>Product ID</th>
                            <th>Product Name</th>
                            <th>Category</th>
                            <th>Price</th>
                            <th>Quantity</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="product" items="${reportProducts}">
                            <tr>
                                <td><c:out value="${product.productId}" /></td>
                                <td><c:out value="${product.productName}" /></td>
                                <td><c:out value="${product.category}" /></td>
                                <td><c:out value="${product.price}" /></td>
                                <td><c:out value="${product.quantity}" /></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:when>
            <c:otherwise>
                <p class="no-results">No products found for this report criteria.</p>
            </c:otherwise>
        </c:choose>
    </c:if>

    <a href="showReportForm" class="back-link">Back to Reports</a>
    <a href="index.jsp" class="back-link">Back to Home</a>
</body>
</html>