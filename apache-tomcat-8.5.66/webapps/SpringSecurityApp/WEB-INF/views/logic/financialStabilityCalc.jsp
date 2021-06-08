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
    <h1>Система анализа инвестиционной привлекательности организации-эмитента / Показатели финансовой устойчивости</h1>
    <br>
    <br>
    <h3>Показатели финансовой устойчивости </h3>

    <p> Соотношение собственных и заемных средств в структуре пассивов организации является ключевым фактором для анализа ИП. Оно характеризует долю собственных средств в общей величине источников финансирования. Для определения данного соотношения рассчитывается коэффициент автономии (финансовой независимости), который характеризует степень автономии или независимости от внешнего капитала, а также долю владельцев экономического субъекта в общей сумме средств, вложенных в него:<br>

        Кавт = СК / ВБ<br>

        где Кавт — коэффициент автономии (финансовой независимости);<br>

        СК — собственный капитал компании-эмитента, тыс. руб.;<br>

        ВБ — валюта баланса, общая величина активов организации, тыс. руб.<br>
        Значение показателя гораздо выше нормативного, но за анализируемый период темп его роста несколько снизился и составил 88,09%. Сложившаяся ситуация относит анализируемый экономический субъект к организациям с высокой инвестиционной привлекательностью.<br>

        Существуют определенные проблемы в использовании этого показателя в финансовом анализе. Они связаны с возможным искажением величины валюты баланса, например ввиду того, что часто переоценка стоимости основных средств производится в необоснованные сроки, на балансе накапливаются изношенные основные средства.<br>
        Величина показателей баланса крайне зависит от учетной политики и применяемых методов оценки.
        Для решения данной проблемы в компаниях должна вестись активная работа по применению современных бухгалтерских методов и технологий, отвечающих требованиям корпоративного менеджмента, по техническому перевооружению производства, со списанием устаревших фондов.<br>
        При таком подходе коэффициент автономии становится действительно содержательной характеристикой финансовой устойчивости эмитента.


    </p>

    <input id="elem1" type="number" name="quantity" placeholder="СК">
    <input id="elem2" type="number" name="quantity" placeholder="ВБ">


    <input id="butt" type="button" value="Считать"/><br><br>
    <div id="str"></div>



    Ваш результат : ${result};

    СК=${value1};  ВБ=${value2}

</div>
</body>

<script>
    butt.onclick = function() {
        let val = document.getElementById('elem1').value;
        let val2 = document.getElementById('elem2').value;

        window.location = "/calculator/financial-stability?SK="+val+"&VB="+val2;
    };
</script>
</html>
