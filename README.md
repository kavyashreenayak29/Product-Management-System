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

🚀 Features & Modules
ProductAdd: Add new products

ProductUpdate: Update product details

ProductDelete: Remove products

ProductDisplay: List all products

Reports:

Products with price greater than a specified value

Products in a specific category

Top N products by sales or quantity

🖥️ Prerequisites
Java Development Kit (JDK) 8+

Apache Tomcat 9.0+

XAMPP

MySQL JDBC Driver

Java IDE (Eclipse or IntelliJ)

Web Browser (Chrome, Firefox, Edge)

⚙️ Setup Instructions
1️⃣ Download the Project
Organize the project files as per the Project Structure.

2️⃣ Configure MySQL Database
Start your MySQL server.

Run the Database Structure SQL in your MySQL client or terminal.

Update DB credentials in ProductDAO.java:
connection = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/product_management",
    "your_username",
    "your_password");
3️⃣ Add JDBC Driver
Download MySQL Connector/J (JDBC Driver).

Place the JAR file in WEB-INF/lib.

Add the JAR to your project’s build path.

4️⃣ Deploy to Apache Tomcat
Create a Dynamic Web Project in your IDE.

Copy files to the correct folders.

Deploy the project to Tomcat and start the server.

5️⃣ Run the Application
Open your browser and go to:
http://localhost:8080/ProductWebApp/
📄 Technical Features
🔒 Input Validation
Client-side: JavaScript & Bootstrap validation

Server-side: Java Servlets validation

Database-level: Constraints (NOT NULL, PRIMARY KEY, AUTO_INCREMENT)

🔥 Error Handling
try-catch for database operations

Input validation for incorrect or missing fields

🖼️ Sample Screenshots (Optional)
Home Page

Add Product

Update Product

Delete Product

Display Products

Reports (Products by Price, Category, Top N)


