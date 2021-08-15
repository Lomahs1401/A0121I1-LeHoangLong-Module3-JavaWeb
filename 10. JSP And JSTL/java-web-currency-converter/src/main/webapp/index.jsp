<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Currency Converter</title>
    <link rel="stylesheet" type="text/css" href="bootstrap-4.6.0-dist/css/bootstrap-grid.min.css"/>
</head>
<body>
    <h1>Currency Converter</h1>
    <form method="post" action="converter.jsp">
        <div class="form-group">
            <label for="rate">Rate: </label>
            <input type="text" class="form-control" name="rate" id="rate" placeholder="RATE" value="22000"/><br/>
        </div>
        <div class="form-group">
            <label for="usd">USD:</label>
            <input type="text" class="form" name="usd" id="usd" placeholder="USD" value="0"/><br/>
        </div>
        <input type="submit" id="sumbit" value="Converter"/>
    </form>
</body>
</html>