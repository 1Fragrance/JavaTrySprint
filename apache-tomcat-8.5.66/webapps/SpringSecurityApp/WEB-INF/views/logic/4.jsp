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
    <h1>Система анализа инвестиционной привлекательности организации-эмитента / Показатели рентабельности хозяйственной деятельности</h1>
    <br>
    <br>
    <h3>Показатели рентабельности хозяйственной деятельности </h3>

    <p> Наиболее важную роль из данной группы показателей в оценке инвестиционной привлекательности организации-эмитента ценных бумаг играет показатель рентабельности активов (капитала).<br>
        Рентабельность активов комплексно характеризует эффективность деятельности экономического субъекта.<br>
        При помощи данного показателя можно оценить эффективность управления, поскольку получение высокой прибыли и достаточного уровня доходности во многом зависит от правильности выбора и рациональности принимаемых управленческих решений.<br>
        По значению уровня рентабельности капитала можно оценить долгосрочное благополучие компании, то есть ее способность получать ожидаемую норму прибыли на инвестиции в достаточно длительной перспективе.<br>

        При определении рентабельности активов следует учитывать тот факт, что численное значение стоимости имущества не остается неизменным за период по причине ввода в эксплуатацию новых основных средств или их выбытия.<br>
        Поэтому при исчислении рентабельности активов следует определять их среднее значение.<br>
        Наиболее правильным при этом является расчет средней хронологической величины инвестированного капитала, а при отсутствии или недостаточности данных можно использовать средние арифметические значения.<br>
    </p>

    <input id="elem1" type="number" name="quantity" placeholder="Рч">
    <input id="elem2" type="number" name="quantity" placeholder="Анг">
    <input id="elem3" type="number" name="quantity" placeholder="Акг">


    <input id="butt" type="button" value="Считать"/><br><br>
    <div id="str"></div>



    Ваш результат : ${result};

    Рч=${value1}; Анг=${value2};  Акг=${value3}

</div>







</body>

<script>

    butt.onclick = function() {
        var val = document.getElementById('elem1').value;
        var val2 = document.getElementById('elem2').value;
        var val3 = document.getElementById('elem3').value;

        window.location = "/logic/4?RC="+val+"&ANG="+val2+"&AKG="+val3;
        // document.getElementById('str').innerHTML="Вы ввели: "+val;
    };

</script>
</html>
