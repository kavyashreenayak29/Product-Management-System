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

@WebServlet("/addProduct") // Maps this servlet to the URL /addProduct
public class AddProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductDAO productDAO;

    public void init() {
        productDAO = new ProductDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String productName = request.getParameter("productName");
        String category = request.getParameter("category");
        String priceStr = request.getParameter("price");
        String quantityStr = request.getParameter("quantity");

        String message = "";
        try {
            BigDecimal price = new BigDecimal(priceStr);
            int quantity = Integer.parseInt(quantityStr);

            Product product = new Product(productName, category, price, quantity);
            if (productDAO.addProduct(product)) {
                message = "Product added successfully!";
            } else {
                message = "Failed to add product. Please try again.";
            }
        } catch (NumberFormatException e) {
            message = "Invalid Price or Quantity format. Please enter numeric values.";
            e.printStackTrace();
        } catch (Exception e) {
            message = "An error occurred: " + e.getMessage();
            e.printStackTrace();
        }

        request.setAttribute("message", message);
        request.getRequestDispatcher("productadd.jsp").forward(request, response);
    }
}