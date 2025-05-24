<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Stack</title>
    <style>
        .user-stack {
            display: flex;
            flex-direction: column;
            gap: 15px;
            padding: 20px;
            max-width: 800px;
            margin: 0 auto;
        }

        .user-card {
            background: white;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            transition: transform 0.2s ease;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .user-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.15);
        }

        .user-info {
            flex: 1;
        }

        .user-name {
            font-size: 1.2em;
            font-weight: bold;
            color: #333;
            margin-bottom: 5px;
        }

        .user-details {
            color: #666;
            font-size: 0.9em;
        }

        .user-actions {
            display: flex;
            gap: 10px;
        }

        .action-btn {
            padding: 8px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 0.9em;
            text-decoration: none;
            color: white;
        }

        .edit-btn {
            background-color: #2196F3;
        }

        .edit-btn:hover {
            background-color: #1976D2;
        }

        .delete-btn {
            background-color: #f44336;
        }

        .delete-btn:hover {
            background-color: #d32f2f;
        }

        .role-badge {
            display: inline-block;
            padding: 4px 8px;
            border-radius: 12px;
            font-size: 0.8em;
            font-weight: bold;
            margin-left: 10px;
        }

        .role-admin {
            background-color: #ff9800;
            color: white;
        }

        .role-user {
            background-color: #4CAF50;
            color: white;
        }
    </style>
</head>
<body>
    <div class="user-stack">
        <c:forEach var="user" items="${users}">
            <div class="user-card">
                <div class="user-info">
                    <div class="user-name">
                        ${user.name}
                        <span class="role-badge ${user.role == 'ADMIN' ? 'role-admin' : 'role-user'}">
                            ${user.role}
                        </span>
                    </div>
                    <div class="user-details">
                        <div>Username: ${user.username}</div>
                        <div>Email: ${user.email}</div>
                    </div>
                </div>
                <div class="user-actions">
                    <a href="edit-user?id=${user.username}" class="action-btn edit-btn">Edit</a>
                    <a href="delete-user?id=${user.username}" class="action-btn delete-btn" 
                       onclick="return confirm('Are you sure you want to delete this user?')">Delete</a>
                </div>
            </div>
        </c:forEach>
    </div>
</body>
</html> 