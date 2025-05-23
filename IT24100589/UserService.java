import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class UserService {
    private List<User> users = new ArrayList<>();

    // Register user (create)
    public boolean register(String username, String password, String email) {
        if (username == null || password == null || email == null) return false;
        
        // Check if username or email already exists
        for (User user : users) {
            if (user.getUsername().equalsIgnoreCase(username) || user.getEmail().equalsIgnoreCase(email)) {
                System.out.println("Username or Email already exists!");
                return false;
            }
        }
        
        // Create new User with random UUID as id
        User newUser = new User(UUID.randomUUID().toString(), username, password, email, false);
        users.add(newUser);
        System.out.println("User registered successfully: " + username);
        return true;
    }

    // Login user
    public User login(String username, String password) {
        if (username == null || password == null) return null;
        
        for (User user : users) {
            if (user.getUsername().equalsIgnoreCase(username) && user.getPassword().equals(password)) {
                System.out.println("Login successful: " + username);
                return user;
            }
        }
        System.out.println("Invalid username or password");
        return null;
    }

    // Get user by id (read)
    public User getUserById(String id) {
        if (id == null) return null;
        for (User user : users) {
            if (user.getId().equals(id)) {
                return user;
            }
        }
        return null;
    }

    // Update user info (except id)
    public boolean updateUser(String id, String username, String password, String email) {
        User user = getUserById(id);
        if (user == null) {
            System.out.println("User not found");
            return false;
        }
        if (username != null) user.setUsername(username);
        if (password != null) user.setPassword(password);
        if (email != null) user.setEmail(email);
        System.out.println("User updated: " + user.getUsername());
        return true;
    }

    // Delete user by id
    public boolean deleteUser(String id) {
        User user = getUserById(id);
        if (user != null) {
            users.remove(user);
            System.out.println("User deleted: " + user.getUsername());
            return true;
        }
        System.out.println("User not found");
        return false;
    }

    // List all users (for debugging)
    public List<User> getAllUsers() {
        return new ArrayList<>(users);
    }
}