package com.servlet;

import com.dao.ProductDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/deleteProduct")
public class DeleteProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductDAO productDAO;

    public void init() {
        productDAO = new ProductDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Typically, delete is done via GET from a link on displayProducts.jsp
        // Or you can have a dedicated form for entering ID.
        // For simplicity, assuming ID comes from a link.
        String productIdStr = request.getParameter("id");
        String message = "";

        if (productIdStr != null && !productIdStr.isEmpty()) {
            try {
                int productId = Integer.parseInt(productIdStr);
                if (productDAO.deleteProduct(productId)) {
                    message = "Product deleted successfully!";
                } else {
                    message = "Failed to delete product. Product not found or an error occurred.";
                }
            } catch (NumberFormatException e) {
                message = "Invalid Product ID format.";
                e.printStackTrace();
            }
        } else {
            message = "Product ID is required for deletion.";
        }

        // Redirect back to the display products page with a message
        response.sendRedirect("displayProducts?message=" + java.net.URLEncoder.encode(message, "UTF-8"));
    }

    // You might also implement doPost if you have a form for deletion
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response); // Reuse doGet logic for simplicity if delete is via form submit
    }
}