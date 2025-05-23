import java.io.Serial;
import java.io.Serializable;

public class Subscription implements Serializable {
 
    private static final long serialVersionUID = 1L;
    
    private String id;
    private String name;
    private String description;
    private double price;
    private int maxUsers;
    private int duration; 

    public Subscription(String id, String name, String description, double price, int maxUsers, int duration) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.price = price;
        this.maxUsers = maxUsers;
        this.duration = duration;
    }

    // Getters and Setters
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }

    public int getMaxUsers() { return maxUsers; }
    public void setMaxUsers(int maxUsers) { this.maxUsers = maxUsers; }

    public int getDuration() { return duration; }
    public void setDuration(int duration) { this.duration = duration; }
}
