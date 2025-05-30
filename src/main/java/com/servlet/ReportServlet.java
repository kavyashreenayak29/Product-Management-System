package com.servlet;

import com.dao.ProductDAO;
import com.model.Product;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/generateReport")
public class ReportServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductDAO productDAO;

    public void init() {
        productDAO = new ProductDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String reportType = request.getParameter("reportType");
        List<Product> reportProducts = null;
        String message = "";

        try {
            if ("priceGreaterThan".equals(reportType)) {
                String priceThresholdStr = request.getParameter("priceThreshold");
                if (priceThresholdStr != null && !priceThresholdStr.isEmpty()) {
                    BigDecimal priceThreshold = new BigDecimal(priceThresholdStr);
                    reportProducts = productDAO.getProductsByPriceGreaterThan(priceThreshold);
                    request.setAttribute("reportTitle", "Products with Price Greater Than $" + priceThreshold);
                } else {
                    message = "Please enter a valid price threshold.";
                }
            } else if ("byCategory".equals(reportType)) {
                String category = request.getParameter("category");
                if (category != null && !category.isEmpty()) {
                    reportProducts = productDAO.getProductsByCategory(category);
                    request.setAttribute("reportTitle", "Products in Category: " + category);
                } else {
                    message = "Please enter a category.";
                }
            } else if ("topNByQuantity".equals(reportType)) {
                String nStr = request.getParameter("topN");
                if (nStr != null && !nStr.isEmpty()) {
                    int n = Integer.parseInt(nStr);
                    reportProducts = productDAO.getTopNByQuantity(n);
                    request.setAttribute("reportTitle", "Top " + n + " Products by Quantity");
                } else {
                    message = "Please enter a valid number for Top N products.";
                }
            } else {
                message = "Invalid report type selected.";
            }
        } catch (NumberFormatException e) {
            message = "Invalid numeric input for report criteria.";
            e.printStackTrace();
        } catch (Exception e) {
            message = "An error occurred while generating the report: " + e.getMessage();
            e.printStackTrace();
        }

        request.setAttribute("reportProducts", reportProducts);
        request.setAttribute("message", message);
        request.getRequestDispatcher("report_result.jsp").forward(request, response);
    }
}