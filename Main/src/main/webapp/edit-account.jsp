<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Account - MovieRental</title>
    <style>
        body {
            background-color: #000;
            color: #fff;
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            padding: 20px;
        }

        form {
            background-color: #111;
            padding: 40px;
            border-radius: 8px;
            width: 100%;
            max-width: 500px;
            box-shadow: 0 0 20px rgba(255, 0, 0, 0.2);
            border: 1px solid #333;
        }

        h2 {
            color: #ff0000;
            text-align: center;
            margin-bottom: 30px;
            font-size: 2em;
            text-shadow: 0 0 8px rgba(255, 0, 0, 0.4);
        }

        .input-field {
            margin-bottom: 25px;
        }

        .input-field input {
            width: 100%;
            padding: 15px;
            background-color: #222;
            border: 1px solid #333;
            border-radius: 4px;
            color: #fff;
            font-size: 1em;
            transition: all 0.3s;
        }

        .input-field input:focus {
            outline: none;
            border-color: #ff0000;
            box-shadow: 0 0 0 2px rgba(255, 0, 0, 0.2);
        }

        .input-field input::placeholder {
            color: #666;
        }

        button {
            width: 100%;
            padding: 15px;
            background-color: #ff0000;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 1.1em;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s;
            margin-top: 10px;
            letter-spacing: 1px;
        }

        button:hover {
            background-color: #cc0000;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255, 0, 0, 0.3);
        }
    </style>
</head>
<body>
<form action="update" method="post">
    <h2>EDIT ACCOUNT</h2>

    <div class="input-field">
        <input type="text" name="name" value="${sessionScope.user.name}" required placeholder="Full Name">
    </div>

    <div class="input-field">
        <input type="text" name="uname" value="${sessionScope.user.username}" required placeholder="Username">
    </div>

    <div class="input-field">
        <input type="password" name="pwd" placeholder="New Password" required>
    </div>

    <button type="submit">UPDATE ACCOUNT</button>
</form>
</body>
</html>