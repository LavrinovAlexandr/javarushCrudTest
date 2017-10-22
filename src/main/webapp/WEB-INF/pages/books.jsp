<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<style>

    h1 {
        font-size: 36px; /* Размер шрифта */
        margin: 0; /* Убираем отступы */
        color: #fc6; /* Цвет текста */
    }
    #header { /* Верхний блок */
        background: #0080c0; /* Цвет фона */
        padding: 10px; /* Поля вокруг текста */
    }
    #sidebar { /* Левая колонка */
        border: 1px solid #333; /* Параметры рамки вокруг */
        width: 20%; /* Ширина колонки */
        padding: 5px; /* Поля вокруг текста */
        margin: 10px 10px 20px 5px; /* Значения отступов */
    }
    #content { /* Правая колонка */
        padding: 5px; /* Поля вокруг текста */
        border: 1px solid #333; /* Параметры рамки */
    }
    #footer { /* Нижний блок */
        background: #333; /* Цвет фона */
        padding: 5px; /* Поля вокруг текста */
        color: #fff; /* Цвет текста */
        clear: left; /* Отменяем действие float */
    }
</style>
<head>
    <script src="//code.jquery.com/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
    <link type="text/css" rel="stylesheet" href="//cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css"/>
    <script type="text/javascript">
        function myFunction(val) {
            document.getElementById('readAlready').value = "false"
        }
    </script>
    <script type="text/javascript">
        $(document).ready(function(){
            $('#datatable').DataTable();
        });
    </script>
    <title>Book Catalog</title>
</head>
<body>
<div id="header"><h1>Book Catalog</h1></div>
<div id="sidebar">
    <h1>Add/Change Book</h1>

    <c:url var="addAction" value="/books/add"/>

    <form:form action="${addAction}" commandName="book">
        <table>
            <tr>
                <td><form:label path="id">ID:</form:label></td>
                <td><form:input path="id" readonly="true"/></td>
            </tr>
            <tr>
                <td><form:label path="title">Title:</form:label></td>
                <td><form:input path="title" onchange="myFunction(this.value)"/></td>
            </tr>
            <tr>
                <td><form:label path="description">Description:</form:label></td>
                <td><form:input path="description" onchange="myFunction(this.value)"/></td>
            </tr>
            <tr>
                <c:if test="${!empty book.title}">
                    <td><form:label path="author">Author:</form:label></td>
                    <td><form:input path="author" readonly="true"/></td>
                </c:if>
                <c:if test="${empty book.title}">
                    <td><form:label path="author">Author:</form:label></td>
                    <td><form:input path="author"/></td>
                </c:if>
            </tr>
            <tr>
                <td><form:label path="isbn">ISBN:</form:label></td>
                <td><form:input path="isbn" onchange="myFunction(this.value)"/></td>
            </tr>
            <tr>
                <td><form:label path="printYear">Print Year:</form:label></td>
                <td><form:input path="printYear" onchange="myFunction(this.value)"/></td>
            </tr>
            <tr>
                <td><form:label path="readAlready">Read Already:</form:label></td>
                <td><form:input id="readAlready" path="readAlready" readonly="true"/>
                    <c:if test="${!empty book.title}">
                        <a href="<c:url value='/read/${book.id}'/>">Read</a>
                    </c:if>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <c:if test="${!empty book.title}">
                        <input type="submit"
                               value="<spring:message text="Change Book"/>"/>
                    </c:if>
                    <c:if test="${empty book.title}">
                        <input type="submit"
                               value="<spring:message text="Add Book"/>"/>
                    </c:if>
                </td>
            </tr>
        </table>
    </form:form>
</div>
<div id="content">
    <h1>Books View</h1>
    <c:if test="${!empty listBooks}">
        <table id="datatable">
            <thead>
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Description</th>
                <th>Author</th>
                <th>ISBN</th>
                <th>Print Year</th>
                <th>Read Already</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${listBooks}" var="book">
                <tr>
                    <th>${book.id}</th>
                    <th>${book.title}</th>
                    <th>${book.description}</th>
                    <th>${book.author}</th>
                    <th>${book.isbn}</th>
                    <th>${book.printYear}</th>
                    <th>${book.readAlready}</th>
                    <th><a href="<c:url value='/edit/${book.id}'/>">Edit</a></th>
                    <th><a href="<c:url value='/remove/${book.id}'/>">Delete</a></th>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>
</div>
<div id="footer">&copy; Aleksandr Lavrinov</div>
</body>
</html>
