package org.example.calculatorapplication.Controller;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "CalculatorServlet", value = "/calculate")
public class CalculatorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ArithmeticException {
        float first = Float.parseFloat(req.getParameter("firstOperand"));
        float second = Float.parseFloat(req.getParameter("secondOperand"));
        String operator = req.getParameter("operator");
        float result = 0;
        char operatorSymbol = ' ';

        switch (operator) {
            case ("add"):
                result = first + second;
                operatorSymbol = '+';
                break;

            case ("sub"):
                result = first - second;
                operatorSymbol = '-';
                break;

            case ("mul"):
                result = first * second;
                operatorSymbol = '*';
                break;

            case ("div"):
                result = first / second;
                operatorSymbol = '/';
                break;
        }

        PrintWriter writer = resp.getWriter();
        writer.println("<html>");
        writer.println("<h2>Result: " + result + "</h2>");
        writer.println("<p>" + first + " " + operatorSymbol + " " + second + " = " + result + "<p>");
        writer.println("</html>");
    }
}
