package org.example.productdiscountcalculator;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "DiscountServlet", value = "/discount")
public class DiscountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        float price = Float.parseFloat(req.getParameter("price"));
        double discount = Double.parseDouble(req.getParameter("discount"));
        float amount = (float) (price * discount * 0.01);

        PrintWriter writer = resp.getWriter();
        writer.println("<html>");
        writer.println("<h2>Discount Amount: " + amount + "</h2>");
        writer.println("<h2>Discount Price: " + price + "</h2>");
        writer.println("</html>");
    }
}
