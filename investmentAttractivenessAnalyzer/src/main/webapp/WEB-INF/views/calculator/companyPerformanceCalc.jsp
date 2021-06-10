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
    <p> В международной практике наиболее часто для оценки эффективности финансово-хозяйственной деятельности компаний используются показатели EVA и EBITDA.<br/>
        Концепция экономической добавленной стоимости EVA рассматривает компанию как некий проект с начальным капиталом, который имеет определенную стоимость. Разница между доходностью проекта (компании) и стоимостью капитала и есть экономическая добавленная стоимость. EVA является показателем, характеризующим экономическую прибыль компании: сколько компания заработает с учетом упущенной выгоды, которую она не получит из-за невозможности вложить капитал альтернативным способом. Иными словами, экономическая добавленная стоимость (EVA) — это финансовый показатель, показывающий фактическую экономическую прибыль организации. Концепция управления, основанная на определении экономической добавленной стоимости, позволяет выяснить, достаточно ли зарабатывает компания по сравнению с альтернативными вложениями.<br/>
        Другим показателем результативности работы компании является операционная прибыль, или прибыль до вычета процентов и налогов, EBIT. Операционная прибыль — это наиболее общая характеристика уровня организации и эффективности технологического процесса, лежащего в основе ее функционирования. Специфика организации технологического процесса и техника управления им определяется управленческим персоналом (т.е. агентами собственников), а потому показатель EBIT входит в систему критериев оценки профессиональной компетентности и качества работы менеджмента. EBITDA рассчитывается как сумма чистой прибыли, чистых расходов по процентам, налога на прибыль, убытков от выбытия основных средств, убытков от обесценения, расходов по увеличению обязательств по выбытию активов, износа и амортизации, за вычетом прибыли (убытков) от финансовых вложений и дохода от прекращенной деятельности.<br/>
        Представленный выше набор показателей, является достаточно полным и дает целостную картину привлекательности коммерческой организации. Финансовые коэффициенты имеют одинаковую направленность (обладают положительной динамикой) и рассчитываются по данным публичной отчетности. Расчетные показатели дают возможность оценивать ИП компании как в пространстве (в сравнении с другими компаниями отрасли), так и во времени.<br/>
        На основе отобранных показателей представляется возможным расчет итогового (интегрального) показателя оценки инвестиционной привлекательности компании, используя следующую формулу:<br/>
        <img src="https://www.cfin.ru/finanalysis/invest/issuing_company-03.gif" alt=""><br>
        где Кип — интегральный показатель инвестиционной привлекательности компании-эмитента ценных бумаг;<br/>
        n — количество финансовых коэффициентов, участвующих в расчете;<br/>
        Xij – значение финансового коэффициента i у организации j;<br/>
        Xiet — эталонное значение финансового коэффициента i.
        <br>
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
