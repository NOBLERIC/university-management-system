<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Hello World!" %>
</h1>
<form action="/yes" method="post">
    <label for="email">Email</label><br/><br/>
    <input  id="email" type="email" name="email" placeholder="Enter your email" required><br/><br/>
    <label for="password">Email</label><br/><br/>
    <input  id="password" type="password" name="password" placeholder="Enter your password" required><br/><br/>
    <button type="submit" id="button">SignUp</button>
</form>
<br/>
<a href="hello-servlet">Hello Servlet</a>
</body>
</html>