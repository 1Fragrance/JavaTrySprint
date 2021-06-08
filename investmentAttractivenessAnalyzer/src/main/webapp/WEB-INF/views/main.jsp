<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Добро пожаловать</title>
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="${contextPath}/resources/js/bootstrap.min.js"></script>

    <style>
        .blocks .btn
        {
            padding: 15px 10px;
            margin-bottom: 10px;
            margin-top: 10px;
        }
        .blocks {border-spacing:5px;}
    </style>
</head>
<body>


<nav class="row navbar navbar-inverse" style="margin-bottom: 0">
        <ul class="nav navbar-nav" style="margin-left: 15px">
            <li class="active"><a href="${pageContext.request.contextPath}/">Домой</a></li>
            <security:authorize access="hasRole('ROLE_ADMIN')">
                <li><a href="${pageContext.request.contextPath}/admin">Управление пользователями</a></li>
            </security:authorize>
            <li><a href="${pageContext.request.contextPath}/calculator/liquidity-and-solvency">Ликвидность и платежеспособность</a></li>
            <li><a href="${pageContext.request.contextPath}/calculator/financial-stability">Финансовая способность</a></li>
            <li><a href="${pageContext.request.contextPath}/calculator/asset-turnover">Оборачиваемость активов</a></li>
            <li><a href="${pageContext.request.contextPath}/calculator/profitability-of-economic-activity">Рентабельность хоз деятельности</a></li>
            <li><a href="${pageContext.request.contextPath}/calculator/company-performance">Инвестиционная привлекательность</a></li>
        </ul>
        <form id="logoutForm" method="POST" action="${contextPath}/logout">
        <ul class="nav navbar-nav" style="position:absolute;right:0">
            <c:if test="${pageContext.request.userPrincipal.name != null}">
                <li>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <a>${pageContext.request.userPrincipal.name}</a>
                </li>
                <li>
                    <input type ="submit" value ="Выход" class="btn btn-danger" style="margin-top: 10px; margin-right: 25px;">
                </li>
            </c:if>
        </ul>
        </form>
</nav>
<div class="container">
    <div class="jumbotron text-center">
        <h1 style="font-size: 4rem">Система анализа инвестиционной привлекательности</h1>
        <br>
    </div>
</div>

<div class="container text-center">
    <div class="btn-group-vertical blocks text-center">
        <security:authorize access="hasRole('ROLE_ADMIN')">
            <button class="btn btn-danger btn-lg" type="button" onclick=location.href="${pageContext.request.contextPath}/admin">Управление пользователями</button>
        </security:authorize>
        <button class="btn btn-primary btn-lg" type="button" onclick=location.href="${pageContext.request.contextPath}/calculator/liquidity-and-solvency">Расчитать показатели ликвидности и платежеспособности</button>
        <button class="btn btn-primary btn-lg" type="button" onclick=location.href="${pageContext.request.contextPath}/calculator/financial-stability">Расчитать показатели финансовой устойчивости</button>
        <button class="btn btn-primary btn-lg" type="button" onclick=location.href="${pageContext.request.contextPath}/calculator/asset-turnover">Расчитать показатели оборачиваемости активов</button>
        <button class="btn btn-primary btn-lg" type="button" onclick=location.href="${pageContext.request.contextPath}/calculator/profitability-of-economic-activity">Расчитать показатели рентабельности хозяйственной деятельности</button>
        <button class="btn btn-primary btn-lg" type="button" onclick=location.href="${pageContext.request.contextPath}/calculator/company-performance">Расчитать интегральный показатель инвестиционной привлекательности компании-эмитента ценных бумаг</button>
    </div>
</div>
</body>
</html>