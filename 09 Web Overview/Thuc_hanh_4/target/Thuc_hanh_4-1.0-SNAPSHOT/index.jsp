<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link rel="stylesheet" type="text/css" href="bootstrap-4.6.0-dist/css/bootstrap-grid.min.css">
</head>
<body>
    <h1>Vietnamese Dictionary</h1>
    <form method="post" action="${pageContext.request.contextPath}/translate">
        <input type="text" name="txtSearch" placeholder="Enter your word: "/>
        <input type="submit" class="btn btn-primary" id="sumbit" value="Search"/>
    </form>
</body>
</html>