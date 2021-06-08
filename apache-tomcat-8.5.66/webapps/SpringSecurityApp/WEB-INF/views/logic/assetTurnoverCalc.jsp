<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Показатели ликвидности и платежеспособности</title>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">

    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>

</head>

<body>

<a href="/">Перейти на главную</a>

<div>
    <br>
    <h1>Система анализа инвестиционной привлекательности организации-эмитента / Показатели оборачиваемости активов</h1>
    <br>
    <br>
    <h3>Показатели оборачиваемости активов </h3>

    <p> Финансовое положение компании, ее ликвидность и платежеспособность во многом зависят от скорости оборачиваемости средств, вложенных в ее активы.<br>

        Различным видам оборотных активов присущи различные скорости оборота.<br>
        На длительность оборота активов оказывают влияние такие факторы, как вид деятельности компании (промышленность, снабжение, посредническая деятельность, сельское хозяйство); отраслевая принадлежность (тяжелая или легкая промышленность);<br>
        масштабы деятельности (как правило, оборачиваемость выше на мелких предприятиях, чем на более крупных); экономическая ситуация в стране (система расчетов, вынуждающая компании отвлекать средства для предоплаты, инфляция, вынуждающая создавать большие запасы товарно-материальных ценностей);<br>
        эффективность управления активами (структура активов, ценовая политика организации, методика оценки товарно-материальных ценностей).<br>
        При низкой оборачиваемости средств или при ее замедлении возникает потребность в дополнительном финансировании.<br>

        Из всех показателей оборачиваемости для потенциального инвестора наиболее важен показатель оборачиваемости совокупных активов (капитала), или капиталоотдача, дающий наиболее общее представление о деловой активности коммерческой организации.<br>

    </p>

    <input id="elem1" type="number" name="quantity" placeholder="N">
    <input id="elem2" type="number" name="quantity" placeholder="САнг">
    <input id="elem3" type="number" name="quantity" placeholder="САкг">


    <input id="butt" type="button" value="Считать"/><br><br>
    <div id="str"></div>



    Ваш результат : ${result};

    N=${value1}; САнг=${value2};  САкг=${value3}

</div>
</body>

<script>
    butt.onclick = function() {
        let val = document.getElementById('elem1').value;
        let val2 = document.getElementById('elem2').value;
        let val3 = document.getElementById('elem3').value;

        window.location = "/calculator/asset-turnover?N="+val+"&SANG="+val2+"&SAKG="+val3;
    };
</script>
</html>
