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
    <title>Admin</title>
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</head>

<body>
<nav class="row navbar navbar-inverse" style="margin-bottom: 0">
    <ul class="nav navbar-nav" style="margin-left: 15px">
        <li><a href="${pageContext.request.contextPath}/">Домой</a></li>
        <security:authorize access="hasRole('ROLE_ADMIN')">
            <li class="active"><a href="${pageContext.request.contextPath}/admin">Управление пользователями</a></li>
        </security:authorize>
        <li><a href="${pageContext.request.contextPath}/calculator/liquidity-and-solvency">Ликвидность и платежеспособность</a></li>
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
        <h2 id="title">Пользователи системы</h2>
        <hr />
        <table class="table table-responsive">
            <thead>
            <tr>
                <th>Идентификатор</th>
                <th>Имя</th>
                <th>Роль</th>
                <th>Статус</th>
                <th></th>
            </tr>
            </thead>
            <tbody id="usersContent">
            <c:forEach items="${users}" var="users">
                <tr>
                    <td>${users.id}</td>
                    <td>${users.username}</td>
                    <td>${users.role.name}</td>
                    <td>${users.status.name}</td>
                    <c:if test="${pageContext.request.userPrincipal.name != users.username}">
                        <c:if test="${users.status.id == 1}">
                            <td><a href="${pageContext.request.contextPath}/blockUser?id=${users.id}">Заблокировать</a></td>
                        </c:if>
                        <c:if test="${users.status.id == 2}">
                            <td><a href="${pageContext.request.contextPath}/restoreUser?id=${users.id}">Разблокировать</a></td>
                        </c:if>
                    </c:if>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>