@RestController
public class HealthController {
    @GetMapping("/health")
    public String health() {
        return "Application is healthy";
    }
}
