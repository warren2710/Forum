<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<%--Шаблон чата взят отсюда: https://bootsnipp.com/snippets/vrzGb--%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>History Message page</title>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">

    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>

</head>
<body>

<%--НАВИГАЦИОННЫЙ БАР, ШТОРКА--%>
<nav class="navbar navbar-inverse navbar-fixed-top">

    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/forum">FORUM INTECH</a>
        </div>

        <div class="collapse navbar-collapse" id="navbar-collapse">
            <ul class="nav navbar-nav navbar-right">
                <%--Тут мы проверяем есть ли есть ли пользователь и обнуляем действующую активность. Т.е. logout--%>
                <c:if test="${pageContext.request.userPrincipal.name != null}">
                    <form id="logoutForm" method="POST" action="${contextPath}/logout">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    </form>
                    <li><a onclick="document.forms['logoutForm'].submit()">Log out</a></li>
                </c:if>
            </ul>
        </div>
    </div>
</nav>
<%--НАВИГАЦИОННЫЙ БАР, ШТОРКА - КОНЕЦ--%>
<br>
<br>
<br>

<h2 class="form-heading" align="center">FORUM</h2>

<br>
<br>
<%--ТАБЛИЦА С ТЕМАМИ ФОРУМА--%>
<c:if test="${!empty allInstenceTheme}">
    <table class="table">
        <thead class="thead-inverse">
        <tr>
            <th>Name</th>
            <th>Last post data</th>
            <th>Options</th>
        </tr>
        </thead>
        <c:forEach items="${allInstenceTheme}" var="allInstanceTheme">
            <tbody>
            <tr>
                <td><a href="/topic/${allInstanceTheme.id}">${allInstanceTheme.themeName}</a></td>
                <td>${allInstanceTheme.lastPostDate}</td>
                <td>
                    <a href="<c:url value="/deleteTheme/${allInstanceTheme.id}"/>" class="pull-left btn btn-danger">Delete</a>
                    <a href="<c:url value="/updateTheme/${allInstanceTheme.id}"/>" class="pull-left btn btn-primary">Update</a>
                </td>
            </tr>
            </tbody>
        </c:forEach>
    </table>
</c:if>
<%--ТАБЛИЦА С ТЕМАМИ ФОРУМА  - КОНЕЦ --%>

<br>
<br>
<br>

<h4 class="text-center"><a href="${contextPath}/createTheme">Create an new theme</a></h4>

<footer>
    <span style='padding-left:10px;'> &copy; Aymaletdinov R.</span>
</footer>

<!-- /container -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>