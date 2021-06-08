<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Welcome</title>
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container">
    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
        <h2>Добро пожаловать ${pageContext.request.userPrincipal.name} | <a onclick="document.forms['logoutForm'].submit()">Logout</a>
        </h2>
    </c:if>
</div>


<div>
    <security:authorize access="hasRole('User')" >
        Вы пользователь
    </security:authorize>
    <security:authorize access="hasRole('Admin')">
        Вы админ <br>
        <a href="/admin">Перейти в админ панель</a>
    </security:authorize>
</div>

<div>
    <br>
    <br>
    <h1>Система анализа инвестиционной привлекательности организации-эмитента</h1>
    <br>
    <br>
    <hr>
    <ul>
        <li> <a href="/calculator/liquidity-and-solvency">Показатели ликвидности и платежеспособности</a></li>
        <li><a href="/calculator/financial-stability">Показатели финансовой устойчивости</a></li>
        <li><a href="/calculator/asset-turnover">Показатели оборачиваемости активов</a></li>
        <li><a href="/calculator/profitability-of-economic-activity">Показатели рентабельности хозяйственной деятельности</a></li>
        <li><a href="/calculator/company-performance">Интегральный показатель инвестиционной привлекательности компании-эмитента ценных бумаг</a></li>
    </ul>
    <hr>
    <br>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>