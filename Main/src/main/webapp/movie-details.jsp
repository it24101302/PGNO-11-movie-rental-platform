<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${movie.title} - Movie Details</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #000;
            color: #fff;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        .movie-details {
            display: flex;
            gap: 30px;
            margin-top: 20px;
        }
        .movie-poster {
            flex: 0 0 300px;
            height: 450px;
            object-fit: cover;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(255, 0, 0, 0.2);
            border: 1px solid #333;
        }
        .movie-info {
            flex: 1;
        }
        .movie-title {
            font-size: 2.5em;
            font-weight: bold;
            margin-bottom: 10px;
            color: #ff0000;
            text-shadow: 0 0 5px rgba(255, 0, 0, 0.5);
        }
        .movie-genre {
            color: #ccc;
            font-size: 1.2em;
            margin-bottom: 15px;
        }
        .movie-price {
            color: #ff0000;
            font-weight: bold;
            font-size: 1.8em;
            margin-bottom: 20px;
        }
        .movie-description {
            color: #ddd;
            font-size: 1.1em;
            line-height: 1.6;
            margin-bottom: 30px;
        }
        .btn-rent {
            background-color: #ff0000;
            color: white;
            padding: 12px 30px;
            font-size: 1.1em;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: all 0.3s;
            font-weight: bold;
            letter-spacing: 1px;
            margin-right: 10px;
        }
        .btn-rent:hover {
            background-color: #cc0000;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255, 0, 0, 0.3);
        }
        .btn-review {
            background-color: #333;
            color: white;
            padding: 12px 30px;
            font-size: 1.1em;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: all 0.3s;
            font-weight: bold;
            letter-spacing: 1px;
        }
        .btn-review:hover {
            background-color: #555;
            transform: translateY(-2px);
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
        .back-link {
            display: inline-block;
            margin-bottom: 20px;
            color: #ff0000;
            text-decoration: none;
            font-weight: bold;
        }
        .back-link:hover {
            color: #cc0000;
            text-decoration: underline;
        }
        .reviews-section {
            margin-top: 40px;
            padding-top: 20px;
            border-top: 1px solid #333;
        }
        .section-title {
            font-size: 1.8em;
            color: #ff0000;
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 2px solid #ff0000;
            text-shadow: 0 0 5px rgba(255, 0, 0, 0.3);
        }
        .no-reviews {
            color: #777;
            font-style: italic;
            text-align: center;
            padding: 20px;
        }
        .review-card {
            background: #1a1a1a;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 2px 4px rgba(255, 0, 0, 0.1);
            border: 1px solid #333;
        }
        .review-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
        }
        .review-rating {
            color: #ffd700;
            font-size: 1.2em;
        }
        .review-user {
            color: #999;
            font-size: 0.9em;
        }
        .review-content {
            color: #ddd;
            line-height: 1.6;
        }
        .star {
            color: #333;
        }
        .star.filled {
            color: #ffd700;
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp" />

<div class="container">
    <a href="movie-list" class="back-link">← Back to Movie List</a>

    <c:if test="${not empty error}">
        <div class="error-message">${error}</div>
    </c:if>

    <c:if test="${not empty movie}">
        <div class="movie-details">
            <c:choose>
                <c:when test="${not empty movie.imageFileName}">
                    <img src="uploads/${movie.imageFileName}" alt="${movie.title}" class="movie-poster">
                </c:when>
                <c:otherwise>
                    <img src="images/default-movie.jpg" alt="Default Movie Poster" class="movie-poster">
                </c:otherwise>
            </c:choose>

            <div class="movie-info">
                <h1 class="movie-title">${movie.title}</h1>
                <div class="movie-genre">${movie.genre}</div>
                <div class="movie-price">$${movie.price}</div>
                <div class="movie-description">${movie.description}</div>

                <div class="button-group">
                    <c:choose>
                        <c:when test="${empty sessionScope.user}">
                            <a href="login.jsp" class="btn btn-rent">Login to Rent</a>
                        </c:when>
                        <c:otherwise>
                            <form action="rent-movie" method="post" style="display: inline-block;">
                                <input type="hidden" name="movieId" value="${movie.id}">
                                <button type="submit" class="btn btn-rent">Rent Movie</button>
                            </form>
                            <a href="review-form?movieId=${movie.id}" class="btn btn-review">Write a Review</a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </c:if>

    <!-- Reviews Section -->
    <div class="reviews-section">
        <h2 class="section-title">REVIEWS</h2>

        <c:if test="${empty reviews}">
            <p class="no-reviews">No reviews yet. Be the first to review this movie!</p>
        </c:if>

        <c:forEach items="${reviews}" var="review">
            <div class="review-card">
                <div class="review-header">
                    <div class="review-rating">
                        <c:forEach begin="1" end="5" var="i">
                            <span class="star ${i <= review.rating ? 'filled' : ''}">★</span>
                        </c:forEach>
                    </div>
                    <div class="review-user">By ${review.userId}</div>
                </div>
                <div class="review-content">${review.feedback}</div>
            </div>
        </c:forEach>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>