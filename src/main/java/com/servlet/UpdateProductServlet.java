package com.servlet;

import com.dao.ProductDAO;
import com.model.Product;
import java.io.IOException;
import java.math.BigDecimal;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/updateProduct")
public class UpdateProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductDAO productDAO;

    public void init() {
        productDAO = new ProductDAO();
    }

    // Handles GET requests to display the update form with existing product data
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("id"));
        Product product = productDAO.getProductById(productId);
        if (product != null) {
            request.setAttribute("product", product);
            request.getRequestDispatcher("productupdate.jsp").forward(request, response);
        } else {
            request.setAttribute("message", "Product not found for ID: " + productId);
            request.getRequestDispatcher("productdisplay.jsp").forward(request, response);
        }
    }

    // Handles POST requests to process the update
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String productIdStr = request.getParameter("productId");
        String productName = request.getParameter("productName");
        String category = request.getParameter("category");
        String priceStr = request.getParameter("price");
        String quantityStr = request.getParameter("quantity");

        String message = "";
        try {
            int productId = Integer.parseInt(productIdStr);
            BigDecimal price = new BigDecimal(priceStr);
            int quantity = Integer.parseInt(quantityStr);

            Product product = new Product(productId, productName, category, price, quantity);
            if (productDAO.updateProduct(product)) {
                message = "Product updated successfully!";
            } else {
                message = "Failed to update product. Please check the Product ID and try again.";
            }
        } catch (NumberFormatException e) {
            message = "Invalid Product ID, Price, or Quantity format. Please enter numeric values.";
            e.printStackTrace();
        } catch (Exception e) {
            message = "An error occurred: " + e.getMessage();
            e.printStackTrace();
        }

        request.setAttribute("message", message);
        // After update, redirect to display all products or show success on update page
        response.sendRedirect("displayProducts?message=" + java.net.URLEncoder.encode(message, "UTF-8"));
    }
}