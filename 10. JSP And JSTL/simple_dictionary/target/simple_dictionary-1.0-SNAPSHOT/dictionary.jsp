<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 14/8/2021
  Time: 6:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Simple Dictionary</title>
</head>
<body>
<%!
    Map<String, String> dictionary = new HashMap<>();
%>

<%
    dictionary.put("hello", "Xin chào");
    dictionary.put("how", "Thế nào");
    dictionary.put("book", "Quyển vở");
    dictionary.put("computer", "Máy tính");

    String search = request.getParameter("word");
    String result = dictionary.get(search);
    PrintWriter writer = response.getWriter();

    if (result != null) {
        writer.println("Word: " + search);
        writer.println("\nResult: " + result);
    } else {
        writer.println("Not found");
    }
%>
</body>
</html>
