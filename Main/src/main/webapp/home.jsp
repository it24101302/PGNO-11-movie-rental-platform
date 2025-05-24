<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>MRP Movie</title>
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: Arial, sans-serif;
    }
    body {
      background-color: #111;
      color: white;
    }
    header {
      background-color: #222;
      padding: 15px 20px;
      box-shadow: 0 2px 10px rgba(0,0,0,0.5);
    }
    .navbar {
      display: flex;
      justify-content: space-between;
      align-items: center;
    }
    .logo {
      color: #ff0000;
      font-size: 24px;
      font-weight: bold;
      text-decoration: none;
      letter-spacing: 1px;
    }
    .menu-links {
      display: flex;
      list-style: none;
    }
    .menu-links li {
      margin-left: 30px;
    }
    .menu-links a {
      color: white;
      text-decoration: none;
      font-weight: 500;
      transition: color 0.3s;
    }
    .menu-links a:hover {
      color: #ff0000;
    }
    #hamburger-btn {
      color: white;
      font-size: 24px;
      cursor: pointer;
      display: none;
    }
    .hero-section {
      background: linear-gradient(rgba(0,0,0,0.7), rgba(0,0,0,0.7)), url('https://source.unsplash.com/random/1600x900/?movie,theater');
      background-size: cover;
      background-position: center;
      height: 80vh;
      display: flex;
      align-items: center;
      justify-content: center;
      text-align: center;
      padding: 0 20px;
    }
    .content {
      max-width: 800px;
    }
    .content h2 {
      font-size: 48px;
      margin-bottom: 20px;
      color: #ff0000;
    }
    .content p {
      font-size: 18px;
      margin-bottom: 30px;
    }
    .content button {
      background-color: #ff0000;
      color: white;
      border: none;
      padding: 12px 30px;
      font-size: 16px;
      border-radius: 5px;
      cursor: pointer;
      transition: background-color 0.3s;
    }
    .content button:hover {
      background-color: #cc0000;
    }

    @media (max-width: 768px) {
      .menu-links {
        display: none;
        position: absolute;
        top: 70px;
        left: 0;
        width: 100%;
        background-color: #222;
        flex-direction: column;
        padding: 20px 0;
      }
      .menu-links li {
        margin: 15px 0;
        text-align: center;
      }
      #hamburger-btn {
        display: block;
      }
      .show-mobile-menu .menu-links {
        display: flex;
      }
    }
  </style>
</head>
<body>
<header>
  <nav class="navbar">
    <a class="logo" href="#">MRP <span style="color:white">Movie</span></a>
    <ul class="menu-links">
      <li><a href="home.jsp">Home</a></li>
      <li><a href="movie-list">Movies</a></li>
      <li><a href="profile.jsp">Profile</a></li>
      <li><a href="#">Contact</a></li>
    </ul>
    <span id="hamburger-btn">☰</span>
  </nav>
</header>
<section class="hero-section">
  <div class="content">
    <h2>Experience Cinema Like Never Before</h2>
    <p>
      Discover the latest movies, read reviews, and share your thoughts with our community of film enthusiasts.
    </p>
    <a href="login.jsp"><button>Sign In</button></a>
  </div>
</section>
<script>
  const header = document.querySelector("header");
  const hamburgerBtn = document.querySelector("#hamburger-btn");

  hamburgerBtn.addEventListener("click", () => {
    header.classList.toggle("show-mobile-menu");
  });
</script>
</body>
</html>