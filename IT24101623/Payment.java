import java.io.Serial;
import java.io.Serializable;
import java.util.Date;

public class Payment implements Serializable {

    private static final long serialVersionUID = 1L;
    
    private String id;
    private String userId;
    private String subscriptionId;
    private double amount;
    private Date paymentDate;
    private boolean isVerified;

    public Payment(String id, String userId, String subscriptionId, double amount) {
        this.id = id;
        this.userId = userId;
        this.subscriptionId = subscriptionId;
        this.amount = amount;
        this.paymentDate = new Date();
        this.isVerified = false;
    }

    // Getters and Setters
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getSubscriptionId() {
        return subscriptionId;
    }

    public void setSubscriptionId(String subscriptionId) {
        this.subscriptionId = subscriptionId;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public Date getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(Date paymentDate) {
        this.paymentDate = paymentDate;
    }

    public boolean isVerified() {
        return isVerified;
    }

    public void setVerified(boolean verified) {
        isVerified = verified;
    }
}
