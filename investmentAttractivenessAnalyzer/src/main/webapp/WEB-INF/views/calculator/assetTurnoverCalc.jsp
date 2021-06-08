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
        <li  class="active"><a href="${pageContext.request.contextPath}/calculator/asset-turnover">Оборачиваемость активов</a></li>
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
    <h2 id="title">Показатели оборачиваемости активов</h2>
    <hr />
    <p> Финансовое положение компании, ее ликвидность и платежеспособность во многом зависят от скорости оборачиваемости средств, вложенных в ее активы.<br>
        Различным видам оборотных активов присущи различные скорости оборота.<br>
        На длительность оборота активов оказывают влияние такие факторы, как вид деятельности компании (промышленность, снабжение, посредническая деятельность, сельское хозяйство); отраслевая принадлежность (тяжелая или легкая промышленность);<br>
        масштабы деятельности (как правило, оборачиваемость выше на мелких предприятиях, чем на более крупных); экономическая ситуация в стране (система расчетов, вынуждающая компании отвлекать средства для предоплаты, инфляция, вынуждающая создавать большие запасы товарно-материальных ценностей);<br>
        эффективность управления активами (структура активов, ценовая политика организации, методика оценки товарно-материальных ценностей).<br>
        При низкой оборачиваемости средств или при ее замедлении возникает потребность в дополнительном финансировании.<br>

        Из всех показателей оборачиваемости для потенциального инвестора наиболее важен показатель оборачиваемости совокупных активов (капитала), или капиталоотдача, дающий наиболее общее представление о деловой активности коммерческой организации.<br>
    </p>

    <br>
    <h3>Расчет показателей</h3>
    <hr />
    <div>
        <div class="form-row">
            <label for="elem1">Количество активов</label>
            <input type="number" class="form-control" id="elem1" required>
        </div>

        <div class="form-row">
            <label for="elem2">Стоимость совокупных активов компании на начало года, тыс руб.</label>
            <input type="number" class="form-control" id="elem2" required>
        </div>

        <div class="form-row">
            <label for="elem3">Стоимость совокупных активов компании на конец года, тыс руб.</label>
            <input type="number"class="form-control" id="elem3" required>
        </div>

        <input style="margin-top: 10px" class="btn btn-primary btn-lg" id="butt" type="button" value="Расчитать"/>
    </div>
    <br>

    <c:if test="${result != null}">
        <hr />
        <div class="container">
            <h3 class="text-center">Результат: ${result}</h3>
            <br>
            <h4>Введенные данные:</h4>
            <p>Количество активов - ${value1}</p>
            <p>Стоимость совокупных активов компании на начало года, тыс руб - ${value2}</p>
            <p>Стоимость совокупных активов компании на конец года, тыс руб - ${value3}</p>
        </div>
    </c:if>
</div>
</body>

<script>
    let button = document.getElementById("butt");
    button.onclick = function() {
        let val = document.getElementById('elem1').value;
        let val2 = document.getElementById('elem2').value;
        let val3 = document.getElementById('elem3').value;

        window.location = "${pageContext.request.contextPath}".concat("/calculator/asset-turnover?N="+val+"&SANG="+val2+"&SAKG="+val3);
    };
</script>
</html>
