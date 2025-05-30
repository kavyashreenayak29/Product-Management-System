package com.model;

import java.math.BigDecimal; // Import for Price

public class Product {
    private int productId;
    private String productName;
    private String category;
    private BigDecimal price; // Use BigDecimal for currency for precision
    private int quantity;

    // Default Constructor
    public Product() {
    }

    // Parameterized Constructor (for creating new products)
    public Product(String productName, String category, BigDecimal price, int quantity) {
        this.productName = productName;
        this.category = category;
        this.price = price;
        this.quantity = quantity;
    }

    // Parameterized Constructor (for retrieving from DB, including ID)
    public Product(int productId, String productName, String category, BigDecimal price, int quantity) {
        this.productId = productId;
        this.productName = productName;
        this.category = category;
        this.price = price;
        this.quantity = quantity;
    }

    // Getters and Setters
    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "Product{" +
               "productId=" + productId +
               ", productName='" + productName + '\'' +
               ", category='" + category + '\'' +
               ", price=" + price +
               ", quantity=" + quantity +
               '}';
    }
}