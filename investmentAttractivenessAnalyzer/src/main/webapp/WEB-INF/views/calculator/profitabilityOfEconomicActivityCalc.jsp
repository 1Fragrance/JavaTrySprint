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
        <li  class="active"><a href="${pageContext.request.contextPath}/calculator/profitability-of-economic-activity">Рентабельность хоз деятельности</a></li>
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
    <h2 id="title">Показатели рентабельности хозяйственной деятельности</h2>
    <hr />
    <p> Наиболее важную роль из данной группы показателей в оценке инвестиционной привлекательности организации-эмитента ценных бумаг играет показатель рентабельности активов (капитала).<br>
        Рентабельность активов комплексно характеризует эффективность деятельности экономического субъекта.<br>
        При помощи данного показателя можно оценить эффективность управления, поскольку получение высокой прибыли и достаточного уровня доходности во многом зависит от правильности выбора и рациональности принимаемых управленческих решений.<br>
        По значению уровня рентабельности капитала можно оценить долгосрочное благополучие компании, то есть ее способность получать ожидаемую норму прибыли на инвестиции в достаточно длительной перспективе.<br>

        При определении рентабельности активов следует учитывать тот факт, что численное значение стоимости имущества не остается неизменным за период по причине ввода в эксплуатацию новых основных средств или их выбытия.<br>
        Поэтому при исчислении рентабельности активов следует определять их среднее значение.<br>
        Наиболее правильным при этом является расчет средней хронологической величины инвестированного капитала, а при отсутствии или недостаточности данных можно использовать средние арифметические значения.<br>
    </p>
    <br>
    <h3>Расчет показателей</h3>
    <hr />
    <div>
        <div class="form-row">
            <label for="elem1">Чистая прибыль, тыс. руб.</label>
            <input type="number" class="form-control" id="elem1">
        </div>

        <div class="form-row">
            <label for="elem2">Стоимость имущества компании на начало года, тыс. руб.</label>
            <input type="number" class="form-control" id="elem2">
        </div>

        <div class="form-row">
            <label for="elem3">Стоимость имущества компании на конец года, тыс. руб.</label>
            <input type="number" class="form-control" id="elem3">
        </div>

        <input style="margin-top: 10px" class="btn btn-primary btn-lg" id="butt" type="button" value="Расчитать"/>
    </div>
    <br>
    <div class="container" id="result">
        <hr />
        <h3 class="text-center">Результат: ${result}</h3>
        <br>
        <h4>Введенные данные:</h4>
        <p>Чистая прибыль, тыс. руб. - ${value1}</p>
        <p>Стоимость имущества компании на начало года, тыс. руб. - ${value2}</p>
        <p>Стоимость имущества компании на конец года, тыс. руб. - ${value3}</p>
    </div>
</div>
</body>

<script>
    let button = document.getElementById("butt");
    button.onclick = function() {
        let val = document.getElementById('elem1').value;
        let val2 = document.getElementById('elem2').value;
        let val3 = document.getElementById('elem3').value;
        window.location = "${pageContext.request.contextPath}".concat("/calculator/profitability-of-economic-activity?RC="+val+"&ANG="+val2+"&AKG="+val3);
    };
</script>

</html>
