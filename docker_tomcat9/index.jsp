<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%
Integer count = (Integer) session.getAttribute("count");
if (count == null) {
        count = 1;
} else {
        count = count + 1;
}
session.setAttribute("count", count);
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <title><%=request.getServletContext().getServerInfo() %></title>
        <link href="favicon.ico" rel="icon" type="image/x-icon" />
        <link href="tomcat.css" rel="stylesheet" type="text/css" />
    </head>

    <body>
        <div id="wrapper">
		<h1>count1 : ${count}</h1>
	</body>
</html>

