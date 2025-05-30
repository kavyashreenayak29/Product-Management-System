
# Product Management System

A dynamic web application designed to manage products effectively in an organization. Built using **JSP, Servlets, and MySQL**, it follows the **MVC architecture** to ensure clean code structure and smooth functionality.

---

## 🚀 Features

- **Manage Products**: Start by adding new products to the system  
- **Update Product Details**: Edit the details of existing products easily  
- **Delete Product Records**: Remove a product from the system using its unique ID  
- **Display All Products**: View all products in a table format  
- **Generate Reports** based on different criteria:
  - Show products above a given price  
  - List products by category  
  - View top N products by sales or inventory  
- **Input Checks**: Both client-side (JavaScript) and server-side (Servlet) validations  
- **Responsive Design**: Looks great on all devices using Bootstrap  
- **Database Integration**: Uses MySQL with JDBC for backend connectivity  

---

## 📋 Prerequisites

Make sure the following are installed:

- Java Development Kit (JDK) 8+  
- Apache Tomcat 9.0+  
- XAMPP  
- MySQL JDBC Driver  
- Java IDE (Eclipse or IntelliJ)  
- Web Browser (Chrome, Firefox, Edge)  

---

## 🛠️ Project Structure

```
ProductWebApp/
├── src/
│   ├── dao/
│   │   └── ProductDAO.java
│   ├── model/
│   │   └── Product.java
│   └── servlet/
│       ├── AddProductServlet.java
│       ├── UpdateProductServlet.java
│       ├── DeleteProductServlet.java
│       ├── DisplayProductsServlet.java
│       ├── ReportServlet.java
│       └── ReportCriteriaServlet.java
├── WebContent/
│   ├── index.jsp
│   ├── productadd.jsp
│   ├── productupdate.jsp
│   ├── productdelete.jsp
│   ├── productdisplay.jsp
│   ├── reports.jsp
│   ├── report_form.jsp
│   ├── report_result.jsp
│   └── css/
│       └── styles.css
├── WEB-INF/
│   └── web.xml
└── README.md
```

---

## Database Setup

### 1. Create Product Database

```sql
CREATE DATABASE IF NOT EXISTS product_management;
USE product_management;
```

### 2. Create Products Table

```sql
CREATE TABLE IF NOT EXISTS Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100) NOT NULL,
    Category VARCHAR(50) NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    Quantity INT NOT NULL,
    DateAdded DATE NOT NULL
);
```

---

## ⚙️ Installation & Setup

### Step 1: Download the Project  
Organize project files according to the structure above.

### Step 2: Configure Database

1. Start MySQL server  
2. Run the SQL setup scripts  
3. Update DB credentials in `ProductDAO.java`:

```java
connection = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/product_management",
    "your_username",
    "your_password");
```

### Step 3: Add JDBC Driver

1. Download MySQL Connector/J  
2. Place the JAR file in `WEB-INF/lib`  
3. Add it to build path in IDE  

### Step 4: Deploy to Tomcat

1. Create a Dynamic Web Project in your IDE  
2. Copy files to corresponding folders  
3. Deploy to Tomcat and start server  

### Step 5: Run the App

```
http://localhost:8080/ProductWebApp/
```

---

## 🖼️ Screenshots

### Home Page  
![Home](Sample_Screenshots/Home.png)

### Add Product Page  
![Add](Sample_Screenshots/Add2.png)

### Update Product  
![Update](Sample_Screenshots/Update2.png)

### Delete Product  
![Delete](Sample_Screenshots/Delete2.png)

### Display Products  
![Display](Sample_Screenshots/Display2.png)

### Generate Report  
#### Products above a price threshold  
![Report](Sample_Screenshots/Report1.png)

---

## 🔧 Technical Features

### Validation

- **Client-side**: JavaScript, Bootstrap  
- **Server-side**: Java servlets  
- **DB-level**: Constraints like NOT NULL, PRIMARY KEY, AUTO_INCREMENT  

### Error Handling

- Try-catch for DB operations  
- Invalid input management  

---

## 📌 Notes

- Replace `"your_username"` and `"your_password"` in the connection string with your MySQL credentials.
- Add sample data to the database to test features.
- Screenshots should be updated with product-related visuals.

---

Happy coding! 🚀
