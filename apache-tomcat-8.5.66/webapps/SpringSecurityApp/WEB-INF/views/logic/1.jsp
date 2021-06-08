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
        <br>
        <h1>Система анализа инвестиционной привлекательности организации-эмитента / Показатели ликвидности и платежеспособности</h1>
        <br>
        <br>
        <h3>Показатели ликвидности и платежеспособности. </h3>

        <p>Данные показатели являются одними из основных при анализе ИП организации-эмитента долговых ценных бумаг, так как дефолт (неспособность производить своевременные процентные и основные выплаты по долговым обязательствам) вызывается кризисом ликвидности активов, когда ликвидных активов недостаточно для того, чтобы обслужить неотложные обязательства. Ликвидность может быть оценена по-разному, но по укрупненному балансу компании возможен лишь анализ общей ликвидности как обеспеченности краткосрочных обязательств оборотными активами. Наибольшее применение в качестве показателя ликвидности получил коэффициент текущей ликвидности, который определяется как отношение текущих активов к краткосрочным обязательствам : <br>
            Ктл = ОА / КО <br>
            где Ктл — коэффициент текущей ликвидности;<br>
            ОА — оборотные активы, тыс. руб.;<br>
            КО — краткосрочные обязательства, тыс. руб.<br><br></p>

        <input id="elem1" type="number" name="quantity" placeholder="ОА">
        <input id="elem2" type="number" name="quantity" placeholder="КО">


        <input id="butt" type="button" value="Считать"/><br><br>
        <div id="str"></div>



            Ваш результат : ${result};

            OA=${value1};  KO=${value2}

    </div>







</body>

<script>

    butt.onclick = function() {
        var val = document.getElementById('elem1').value;
        var val2 = document.getElementById('elem2').value;

        window.location = "/logic/1?OA="+val+"&KO="+val2;
        // document.getElementById('str').innerHTML="Вы ввели: "+val;
    };

</script>
</html>
