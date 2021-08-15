<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link rel="stylesheet" type="text/css" href="bootstrap-4.6.0-dist/css/bootstrap.min.css"/>
</head>
<body>
    <div class="container">
        <h1>Vietnamese Dictionary</h1>
        <form action="dictionary.jsp" method="post">
            <div class="form-group">
                <label for="word">Word:
                    <input type="text" name="word" id="word" placeholder="Enter your word:" class="form-control">
                </label>
            </div>
            <input type="submit" class="btn btn-primary" value="Submit">
        </form>
    </div>
</body>
</html>