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
        <li  class="active"><a href="${pageContext.request.contextPath}/calculator/liquidity-and-solvency">Ликвидность и платежеспособность</a></li>
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
<div class=" container body-content">
    <h2 id="title">Показатели ликвидности и платежеспособности</h2>
    <hr />
    <p>Данные показатели являются одними из основных при анализе ИП организации-эмитента долговых ценных бумаг, так как дефолт (неспособность производить своевременные процентные и основные выплаты по долговым обязательствам) вызывается кризисом ликвидности активов, когда ликвидных активов недостаточно для того, чтобы обслужить неотложные обязательства. Ликвидность может быть оценена по-разному, но по укрупненному балансу компании возможен лишь анализ общей ликвидности как обеспеченности краткосрочных обязательств оборотными активами. Наибольшее применение в качестве показателя ликвидности получил коэффициент текущей ликвидности, который определяется как отношение текущих активов к краткосрочным обязательствам : <br>
        Ктл = ОА / КО <br>
        где Ктл — коэффициент текущей ликвидности;<br>
        ОА — оборотные активы, тыс. руб.;<br>
        КО — краткосрочные обязательства, тыс. руб.
    </p>
    <br>
    <h3>Расчет показателей</h3>
    <hr />
    <div>
        <div class="form-row">
            <label for="elem1">Оборотные активы, тыс. руб.</label>
            <input type="number" class="form-control" id="elem1" required>
        </div>

        <div class="form-row">
            <label for="elem2">Краткосрочные обязательства, тыс. руб.</label>
            <input type="number" class="form-control" id="elem2" required>
        </div>

        <input style="margin-top: 10px" class="btn btn-primary btn-lg" id="butt" type="button" value="Рассчитать"/>
    </div>
    <br>
    <div class="container" id="result">
        <hr />
        <c:if test="${not empty error}">
            <h3 class="text-center" , style="color: red">Ошибка: ${error}</h3>
        </c:if>
        <h3 class="text-center">Результат: ${result}</h3>
        <br>
        <h4>Введенные данные:</h4>
        <p>Оборотные активы, тыс. руб. - ${value1}</p>
        <p>Краткосрочные обязательства, тыс. руб. - ${value2}</p>
    </div>
</div>
</body>

<script>
    let button = document.getElementById("butt");
    button.onclick = function() {
        let val = document.getElementById('elem1').value;
        let val2 = document.getElementById('elem2').value;
        window.location = "${pageContext.request.contextPath}".concat("/calculator/liquidity-and-solvency?OA="+val+"&KO="+val2);
    };
</script>

</html>



