<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - MovieRental</title>
    <style>
        body {
            background-color: #000;
            color: #fff;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
        }
        h2 {
            color: #ff0000;
            font-size: 2.5em;
            margin: 40px 0;
            text-shadow: 0 0 10px rgba(255, 0, 0, 0.5);
            text-align: center;
        }
        .admin-links {
            display: flex;
            flex-direction: column;
            gap: 20px;
            width: 80%;
            max-width: 600px;
        }
        .admin-links a {
            background-color: #1a1a1a;
            color: #fff;
            text-decoration: none;
            padding: 20px;
            border-radius: 5px;
            font-size: 1.2em;
            text-align: center;
            border: 2px solid #333;
            transition: all 0.3s ease;
            box-shadow: 0 4px 8px rgba(255, 0, 0, 0.2);
        }
        .admin-links a:hover {
            background-color: #ff0000;
            transform: translateY(-3px);
            box-shadow: 0 6px 12px rgba(255, 0, 0, 0.3);
            border-color: #ff0000;
        }
    </style>
</head>
<body>
<h2>ADMIN DASHBOARD</h2>

<div class="admin-links">
    <a href="manage-users">MANAGE USERS</a>
    <a href="add-movie">MANAGE MOVIES</a>
    <a href="manage-reviews">MANAGE REVIEWS</a>
</div>
</body>
</html>