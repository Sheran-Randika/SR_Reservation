<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Logout</title>
    <link rel="stylesheet" href="./css/logout.css">
</head>
<body>
    <div class="logout-container">
        <h1>Logout</h1>
    </div>

    <script>
        localStorage.removeItem('accessToken');
        localStorage.removeItem('idToken');
        localStorage.removeItem('username');
        window.location.href = "./index.jsp";
    </script>
</body>
</html>
