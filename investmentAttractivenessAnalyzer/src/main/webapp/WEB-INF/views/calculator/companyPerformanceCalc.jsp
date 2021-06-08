<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Показатели ликвидности и платежеспособности</title>
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="${contextPath}/resources/js/bootstrap.min.js"></script>

</head>

<body>

<nav class="row navbar navbar-inverse" style="margin-bottom: 0">
    <ul class="nav navbar-nav" style="margin-left: 15px">
        <li><a href="${pageContext.request.contextPath}/">Домой</a></li>
        <security:authorize access="hasRole('ROLE_ADMIN')">
            <li><a href="${pageContext.request.contextPath}/admin">Управление пользователями</a></li>
        </security:authorize>
        <li><a href="${pageContext.request.contextPath}/calculator/liquidity-and-solvency">Ликвидность и платежеспособность</a></li>
        <li><a href="${pageContext.request.contextPath}/calculator/financial-stability">Финансовая способность</a></li>
        <li><a href="${pageContext.request.contextPath}/calculator/asset-turnover">Оборачиваемость активов</a></li>
        <li><a href="${pageContext.request.contextPath}/calculator/profitability-of-economic-activity">Рентабельность хоз деятельности</a></li>
        <li  class="active"><a href="${pageContext.request.contextPath}/calculator/company-performance">Инвестиционная привлекательность</a></li>
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

<div class=" container body-content">
    <h2 id="title">Показатели результативности работы фирмы</h2>
    <hr />
    <p> Финансовое положение компании, ее ликвидность и платежеспособность во многом зависят от скорости оборачиваемости средств, вложенных в ее активы.<br>
        На основе отобранных показателей представляется возможным расчет итогового (интегрального) показателя оценки инвестиционной привлекательности компании.<br>
    </p>
    <br>
    <h3>Расчет показателей</h3>
    <hr />

    <div>
        <div class="form-row">
            <label for="elem1">Количество финансовых коэффициентов, участвующих в расчете</label>
            <input type="number" class="form-control" id="elem1" required>
        </div>

        <div class="form-row">
            <label for="elem2">Значение финансового коэффициента i у организации j.</label>
            <input type="number" class="form-control" id="elem2" required>
        </div>

        <div class="form-row">
            <label for="elem3">Эталонное значение финансового коэффициента i.</label>
            <input type="number"class="form-control" id="elem3" required>
        </div>

        <input style="margin-top: 10px" class="btn btn-primary btn-lg" id="butt" type="button" value="Расчитать"/>
    </div>
    <br>
    <div class="container" id="result">
        <hr />
            <h3 class="text-center">Результат: ${result}</h3>
            <br>
            <h4>Введенные данные:</h4>
            <p>Количество финансовых коэффициентов, участвующих в расчете - ${value1}</p>
            <p>Значение финансового коэффициента i у организации j - ${value2}</p>
            <p>Эталонное значение финансового коэффициента i - ${value3}</p>
    </div>
</div>
</body>

<script>
    let button = document.getElementById("butt");
    button.onclick = function() {
        let val = document.getElementById('elem1').value;
        let val2 = document.getElementById('elem2').value;
        let val3 = document.getElementById('elem3').value;
        window.location = "${pageContext.request.contextPath}".concat("/calculator/company-performance?N="+val+"&XIJ="+val2+"&XIET="+val3);
    };
</script>


</html>
