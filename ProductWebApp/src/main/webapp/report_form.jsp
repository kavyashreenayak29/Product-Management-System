<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Generate Reports</title>
<style>
    body { font-family: Arial, sans-serif; margin: 20px; background-color: #f4f4f4; }
    h1 { color: #333; }
    .report-section { background-color: white; padding: 20px; border-radius: 8px; box-shadow: 0 0 10px rgba(0,0,0,0.1); margin-bottom: 20px; width: 500px; }
    label { display: block; margin-bottom: 5px; color: #555; }
    input[type="text"], input[type="number"], select {
        width: calc(100% - 22px);
        padding: 10px;
        margin-bottom: 15px;
        border: 1px solid #ddd;
        border-radius: 4px;
    }
    input[type="submit"] {
        background-color: #007bff;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
    }
    input[type="submit"]:hover { background-color: #0056b3; }
    .back-link { display: block; margin-top: 20px; color: #007bff; text-decoration: none; }
    .back-link:hover { text-decoration: underline; }
</style>
</head>
<body>
    <h1>Generate Reports</h1>

    <div class="report-section">
        <h2>Products with Price Greater Than a Value</h2>
        <form action="generateReport" method="post">
            <input type="hidden" name="reportType" value="priceGreaterThan">
            <label for="priceThreshold">Price Threshold:</label>
            <input type="text" id="priceThreshold" name="priceThreshold" placeholder="e.g., 50.00" pattern="[0-9]+(\.[0-9]{1,2})?" title="Enter a valid price (e.g., 50.00)" required><br/>
            <input type="submit" value="Generate Report">
        </form>
    </div>

    <div class="report-section">
        <h2>Products in a Specific Category</h2>
        <form action="generateReport" method="post">
            <input type="hidden" name="reportType" value="byCategory">
            <label for="category">Category:</label>
            <input type="text" id="category" name="category" placeholder="e.g., Electronics" required><br/>
            <input type="submit" value="Generate Report">
        </form>
    </div>

    <div class="report-section">
        <h2>Top N Products by Quantity</h2>
        <form action="generateReport" method="post">
            <input type="hidden" name="reportType" value="topNByQuantity">
            <label for="topN">Number of Products (N):</label>
            <input type="number" id="topN" name="topN" min="1" required><br/>
            <input type="submit" value="Generate Report">
        </form>
    </div>

    <a href="index.jsp" class="back-link">Back to Home</a>
</body>
</html>