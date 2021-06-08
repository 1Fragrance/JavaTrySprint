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
    <h1>Система анализа инвестиционной привлекательности организации-эмитента / Показатели внутрифирменной эффективности / Показатели прибыли, рассчитываемые через рыночные оценки / Показатели результативности работы фирмы</h1>
    <br>
    <br>
    <h3>Показатели внутрифирменной эффективности / Показатели прибыли, рассчитываемые через рыночные оценки / Показатели результативности работы фирмы</h3>

    <p> Финансовое положение компании, ее ликвидность и платежеспособность во многом зависят от скорости оборачиваемости средств, вложенных в ее активы.<br>

        На основе отобранных показателей представляется возможным расчет итогового (интегрального) показателя оценки инвестиционной привлекательности компании.<br>


    </p>

    <input id="elem1" type="number"  placeholder="N">
    <input id="elem2" type="number"  placeholder="Xij">
    <input id="elem3" type="number" placeholder="Xiet">


    <input id="butt" type="button" value="Считать"/><br><br>
    <div id="str"></div>



    Ваш результат : ${result};

    N=${value1}; Xij=${value2};  Xiet=${value3}

</div>







</body>

<script>

    butt.onclick = function() {
        var val = document.getElementById('elem1').value;
        var val2 = document.getElementById('elem2').value;
        var val3 = document.getElementById('elem3').value;

        window.location = "/logic/5?N="+val+"&XIJ="+val2+"&XIET="+val3;
        // document.getElementById('str').innerHTML="Вы ввели: "+val;
    };

</script>
</html>
