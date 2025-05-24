<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Account - MovieRental</title>
    <style>
        body {
            background-color: #000;
            color: #fff;
            font-family: Arial, sans-serif;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
            padding: 20px;
            text-align: center;
        }

        h2 {
            color: #ff0000;
            font-size: 2em;
            margin-bottom: 30px;
            text-shadow: 0 0 10px rgba(255, 0, 0, 0.5);
        }

        form {
            margin-bottom: 20px;
        }

        button {
            background-color: #ff0000;
            color: white;
            border: none;
            padding: 12px 30px;
            font-size: 1.1em;
            border-radius: 4px;
            cursor: pointer;
            transition: all 0.3s;
            font-weight: bold;
            box-shadow: 0 4px 8px rgba(255, 0, 0, 0.3);
        }

        button:hover {
            background-color: #cc0000;
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(255, 0, 0, 0.4);
        }

        a {
            color: #aaa;
            text-decoration: none;
            font-size: 1.1em;
            transition: color 0.3s;
            border: 1px solid #333;
            padding: 10px 25px;
            border-radius: 4px;
        }

        a:hover {
            color: #fff;
            background-color: #333;
        }

        .warning-message {
            background-color: #1a0000;
            border: 1px solid #ff3333;
            color: #ff9999;
            padding: 15px;
            border-radius: 4px;
            max-width: 500px;
            margin-bottom: 30px;
        }
    </style>
</head>
<body>
<div class="warning-message">
    ⚠️ This action cannot be undone. All your data will be permanently deleted.
</div>

<h2>DELETE YOUR ACCOUNT?</h2>

<form action="delete-account" method="post">
    <button type="submit">YES, DELETE MY ACCOUNT</button>
</form>

<a href="profile.jsp">NO, KEEP MY ACCOUNT</a>
</body>
</html>