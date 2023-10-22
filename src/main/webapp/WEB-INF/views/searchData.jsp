<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page import="java.text.NumberFormat" %>
<%
    NumberFormat currencyFormat = NumberFormat.getCurrencyInstance();
%>
<c:forEach var="p" items="${list}">
    <!--1 item-->
    <div class="col-lg-3 col-md-6 mb-4">
        <div class="card">
            <div class="bg-image hover-zoom ripple ripple-surface ripple-surface-light" data-mdb-ripple-color="light">
                <img src="${p.imgURL}" class="w-100" />
                <a href="product?masp=${p.masp}">
                    <div class="mask">
                        <div class="d-flex justify-content-start align-items-end h-100">
                            <c:if test="${not empty p.tag}">
                                <h5><span class="badge bg-dark ms-2">${p.tag}</span></h5>
                            </c:if>
                            <c:if test="${p.giamgia != 0.0}">
                                <h5>
                                    <span class="badge sale-badge ms-2">

                                        <c:set var="number" value="${p.giamgia}" />
                                        <c:set var="stringValue" value="${String.format('%.0f', number)}" />Sale
                                        ${stringValue} %
                                    </span>
                                </h5>
                            </c:if>
                        </div>
                    </div>
                    <div class="hover-overlay">
                        <div class="mask" style="background-color: rgba(251, 251, 251, 0.15);"></div>
                    </div>
                </a>
            </div>
            <div class="card-body">
                <a href="product?masp=${p.masp}" class="text-reset">
                    <h5 class="card-title mb-2">${p.tensp}</h5>
                </a>
                <a href="product?masp=${p.masp}" class="text-reset ">
                    <p>${p.mota}</p>
                </a>
                <h6 class="mb-3 price">
                    <c:set var="currentMoney" value="${p.giasp}" />
                    <c:set var="moneyValue" value="${p.giasp*(1-(p.giamgia/100))}" />
                    <% double currentValue=0.0; if (pageContext.getAttribute("currentMoney") !=null) {
                        currentValue=Double.parseDouble(pageContext.getAttribute("currentMoney").toString()); } String
                        formattedCurrentMoneyValue=currencyFormat.format(currentValue); %>
                        <c:if test="${p.giamgia == 0.0}">
                            <%= formattedCurrentMoneyValue %>
                                <br>
                                <strong class="ms-2 sale" style="opacity: 0%;">
                                    H:>
                                </strong>
                        </c:if>

                        <c:if test="${p.giamgia != 0.0}">
                            <s>
                                <%= formattedCurrentMoneyValue %>
                            </s><br>
                            <strong class="ms-2 sale">
                                <% double moneyValueDouble=0.0; if (pageContext.getAttribute("moneyValue") !=null) {
                                    moneyValueDouble=Double.parseDouble(pageContext.getAttribute("moneyValue").toString());
                                    } String formattedMoneyValue=currencyFormat.format(moneyValueDouble); %>
                                    <%= formattedMoneyValue %>
                            </strong>
                        </c:if>

                </h6>
            </div>
        </div>
    </div>
    <!--item 1-->
</c:forEach>