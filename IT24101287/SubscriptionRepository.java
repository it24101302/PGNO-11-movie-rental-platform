import com.movie.website.model.Subscription;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;
import java.util.logging.Level;

public class SubscriptionRepository {
    private static final Logger logger = Logger.getLogger(SubscriptionRepository.class.getName());

    private final List<Subscription> subscriptions = new ArrayList<>();

    // Add subscription
    public synchronized boolean add(Subscription subscription) {
        if (subscription == null) {
            logger.warning("Attempted to add null subscription");
            return false;
        }

        // Check duplicate name (optional)
        for (Subscription sub : subscriptions) {
            if (sub.getName().equalsIgnoreCase(subscription.getName())) {
                logger.warning("Subscription with name already exists: " + subscription.getName());
                return false;
            }
        }

        subscriptions.add(subscription);
        logger.info("Subscription added: " + subscription.getName());
        return true;
    }

    // Get all subscriptions
    public synchronized List<Subscription> getAll() {
        return new ArrayList<>(subscriptions);
    }

    // Get subscription by id
    public synchronized Subscription getById(String id) {
        if (id == null) return null;
        for (Subscription sub : subscriptions) {
            if (sub.getId().equals(id)) {
                return sub;
            }
        }
        return null;
    }

    // Update subscription
    public synchronized boolean update(String id, String name, String description, Double price, Integer maxUsers, Integer duration) {
        Subscription sub = getById(id);
        if (sub == null) {
            logger.warning("Update failed, subscription not found: " + id);
            return false;
        }

        // Check for name duplicates if changed
        if (name != null && !name.equalsIgnoreCase(sub.getName())) {
            for (Subscription s : subscriptions) {
                if (!s.getId().equals(id) && s.getName().equalsIgnoreCase(name)) {
                    logger.warning("Update failed, subscription name taken: " + name);
                    return false;
                }
            }
        }

        if (name != null) sub.setName(name);
        if (description != null) sub.setDescription(description);
        if (price != null) sub.setPrice(price);
        if (maxUsers != null) sub.setMaxUsers(maxUsers);
        if (duration != null) sub.setDuration(duration);

        logger.info("Subscription updated: " + sub.getName());
        return true;
    }

    // Delete subscription by id
    public synchronized boolean delete(String id) {
        Subscription sub = getById(id);
        if (sub == null) {
            logger.warning("Delete failed, subscription not found: " + id);
            return false;
        }
        subscriptions.remove(sub);
        logger.info("Subscription deleted: " + sub.getName());
        return true;
    }
}
