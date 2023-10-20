<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<%@ page import="java.text.NumberFormat" %>


<html>
<body>
<h2><c:set var="myCurrency" value="${1234.56}" />

    <!-- Vòng lặp c:forEach với biến var là "myCurrency" -->
    <c:forEach var="c" items="${myCurrency}">
    <c:set var="moneyValue" value="${myObject.moneyValue}" />
        <%
            // Lấy giá trị tiền tệ từ biến var trong vòng lặp
            double moneyValue = Double.parseDouble(c.toString());
            
            // Tạo một đối tượng NumberFormat để định dạng giá trị tiền tệ
            NumberFormat currencyFormat = NumberFormat.getCurrencyInstance();
    
            // Định dạng giá trị tiền tệ
            String formattedMoneyValue = currencyFormat.format(moneyValue);
        %>
    
        <%= formattedMoneyValue %>
    </c:forEach>

</h2>
</body>
</html>
