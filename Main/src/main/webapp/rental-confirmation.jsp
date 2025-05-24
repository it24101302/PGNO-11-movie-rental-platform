<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rental Confirmation</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #000;
            color: #fff;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }
        .confirmation-box {
            background-color: #1a1a1a;
            border-radius: 8px;
            padding: 40px;
            text-align: center;
            margin-top: 50px;
            border: 1px solid #333;
            box-shadow: 0 0 20px rgba(255, 0, 0, 0.2);
        }
        .success-icon {
            color: #ff0000;
            font-size: 60px;
            margin-bottom: 25px;
            text-shadow: 0 0 10px rgba(255, 0, 0, 0.5);
        }
        .confirmation-title {
            color: #ff0000;
            font-size: 28px;
            margin-bottom: 20px;
            font-weight: bold;
            letter-spacing: 1px;
        }
        .confirmation-message {
            color: #ccc;
            font-size: 18px;
            margin-bottom: 30px;
            line-height: 1.6;
        }
        .btn-primary {
            background-color: #ff0000;
            color: white;
            padding: 12px 40px;
            font-size: 1.1em;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: all 0.3s;
            text-decoration: none;
            display: inline-block;
            font-weight: bold;
            letter-spacing: 1px;
            margin-top: 20px;
        }
        .btn-primary:hover {
            background-color: #cc0000;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255, 0, 0, 0.3);
        }
        .error-message {
            color: #ff3333;
            margin-top: 10px;
            padding: 15px;
            background-color: #1a1a1a;
            border-radius: 4px;
            border-left: 4px solid #ff3333;
            font-weight: 500;
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp" />

<div class="container">
    <c:if test="${not empty error}">
        <div class="error-message">${error}</div>
    </c:if>

    <c:if test="${sessionScope.paymentSuccess}">
        <div class="confirmation-box">
            <div class="success-icon">✓</div>
            <h2 class="confirmation-title">RENTAL CONFIRMED!</h2>
            <p class="confirmation-message">${sessionScope.rentalConfirmation}</p>
            <p style="color: #999;">Thank you for your rental. You can now enjoy your movie!</p>
            <div style="margin-top: 40px;">
                <a href="movie-list" class="btn btn-primary">BACK TO MOVIES</a>
            </div>
        </div>
    </c:if>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>