import com.movie.website.model.Payment;
import com.movie.website.repository.PaymentRepository;
import java.util.List;
import java.util.Optional;
import java.util.logging.Logger;
import java.util.stream.Collectors;

public class PaymentRepositoryImpl implements PaymentRepository {
    private final CustomStack<Payment> payments = new CustomStack<>();
    private static final Logger logger = Logger.getLogger(PaymentRepositoryImpl.class.getName());

    @Override
    public synchronized void addPayment(Payment payment) {
        if (payment != null) {
            payments.push(payment);
            logger.info("Added new payment for user: " + payment.getUserId());
        } else {
            logger.warning("Attempted to add null payment");
        }
    }

 
    public synchronized List<Payment> getAllPayments() {
        return payments.getAllElements();
    }

    public synchronized List<Payment> getUnverifiedPayments() {
        return payments.getAllElements().stream()
                .filter(payment -> !payment.isVerified())
                .collect(Collectors.toList());
    }

    public synchronized Optional<Payment> getPaymentById(String id) {
        if (id == null) {
            logger.warning("Attempted to get payment with null ID");
            return Optional.empty();
        }
        
        for (Payment payment : payments.getAllElements()) {
            if (payment.getId().equals(id)) {
                return Optional.of(payment);
            }
        }
        logger.fine("Payment not found with ID: " + id);
        return Optional.empty();
    }
}
