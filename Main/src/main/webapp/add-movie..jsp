<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Movie</title>
    <style>
        body {
            background-color: #000;
            color: #fff;
            font-family: 'Arial', sans-serif;
        }
        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 30px;
            background-color: #111;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(255, 0, 0, 0.2);
            border: 1px solid #333;
        }
        h2 {
            color: #ff0000;
            text-align: center;
            margin-bottom: 30px;
            text-shadow: 0 0 8px rgba(255, 0, 0, 0.4);
        }
        .form-label {
            color: #ddd;
            font-weight: 500;
        }
        .form-control {
            background-color: #222;
            border: 1px solid #333;
            color: #fff;
            padding: 10px 15px;
        }
        .form-control:focus {
            background-color: #333;
            border-color: #ff0000;
            color: #fff;
            box-shadow: 0 0 0 0.25rem rgba(255, 0, 0, 0.25);
        }
        .btn-success {
            background-color: #ff0000;
            border: none;
            padding: 10px 25px;
            font-weight: 600;
            letter-spacing: 0.5px;
            transition: all 0.3s;
        }
        .btn-success:hover {
            background-color: #cc0000;
            transform: translateY(-2px);
        }
        .btn-secondary {
            background-color: #333;
            border: none;
            padding: 10px 25px;
            font-weight: 600;
            letter-spacing: 0.5px;
            transition: all 0.3s;
        }
        .btn-secondary:hover {
            background-color: #444;
            transform: translateY(-2px);
        }
        .alert-danger {
            background-color: #330000;
            border: 1px solid #ff3333;
            color: #ff9999;
            padding: 15px;
            border-radius: 4px;
            margin-bottom: 20px;
        }
        .required-field::after {
            content: " *";
            color: #ff0000;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <h2>ADD NEW MOVIE</h2>

    <% if (request.getAttribute("error") != null) { %>
    <div class="alert alert-danger"><%= request.getAttribute("error") %></div>
    <% } %>

    <form action="add-movie" method="post" enctype="multipart/form-data">
        <div class="mb-4">
            <label for="title" class="form-label required-field">Title</label>
            <input type="text" id="title" name="title" class="form-control" required />
        </div>

        <div class="mb-4">
            <label for="genre" class="form-label required-field">Genre</label>
            <input type="text" id="genre" name="genre" class="form-control" required />
        </div>

        <div class="mb-4">
            <label for="description" class="form-label">Description</label>
            <textarea id="description" name="description" rows="4" class="form-control"></textarea>
        </div>

        <div class="mb-4">
            <label for="movieImage" class="form-label">Movie Image</label>
            <input type="file" id="movieImage" name="movieImage" class="form-control" accept="image/*" />
        </div>

        <div class="d-flex justify-content-end">
            <a href="movie-list.jsp" class="btn btn-secondary me-2">Cancel</a>
            <button type="submit" class="btn btn-success">Add Movie</button>
        </div>
    </form>
</div>
</body>
</html>