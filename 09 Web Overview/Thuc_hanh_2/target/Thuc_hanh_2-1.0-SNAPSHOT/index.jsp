<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
    <style type="text/css">
        .login {
            height: 180px;
            width: 230px;
            margin: 0;
            padding: 15px 25px 15px 10px;
            border: 1px #ccc solid;
        }
        .login input {
            padding: 5px;
            margin: 5px;
        }
    </style>
</head>
<body>
    <form method="post" action="${pageContext.request.contextPath}/LoginServlet">
        <div class="login">
            <h2>Login</h2>
            <input type="text" name="username" size="30" placeholder="username"/>
            <input type="password" name="password" size="30" placeholder="password"/>
            <input type="submit" value="Sign in"/>
        </div>
    </form>
</body>
</html>