# Product Management System

A **dynamic web application** designed to manage product inventory efficiently in an organization. Built using **JSP, Servlets, and MySQL**, it follows the **MVC architecture** to ensure clean code structure and smooth functionality.

---

## 🚀 Project Purpose

The system manages product inventory, including:
- Adding new products
- Updating product details
- Deleting obsolete products
- Viewing product lists
- Generating reports such as:
  - Products with price above a certain amount
  - Products in a specific category
  - Top-selling products or products with highest quantity

---

## 🛠️ Project Structure

ProductWebApp/
├── WebContent/
│ ├── index.jsp
│ ├── productadd.jsp
│ ├── productupdate.jsp
│ ├── productdelete.jsp
│ ├── productdisplay.jsp
│ ├── reports.jsp
│ ├── report_form.jsp
│ └── report_result.jsp
├── src/
│ ├── com/
│ ├── dao/
│ │ └── ProductDAO.java
│ ├── model/
│ │ └── Product.java
│ └── servlet/
│ ├── AddProductServlet.java
│ ├── UpdateProductServlet.java
│ ├── DeleteProductServlet.java
│ ├── DisplayProductsServlet.java
│ ├── ReportServlet.java
│ └── ReportCriteriaServlet.java
└── WEB-INF/web.xml

---

## 📋 Database Structure

```sql
CREATE DATABASE IF NOT EXISTS product_management;
USE product_management;

CREATE TABLE IF NOT EXISTS Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100) NOT NULL,
    Category VARCHAR(50) NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    Quantity INT NOT NULL
);


