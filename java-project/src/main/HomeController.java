@RestController
public class HomeController {
    @GetMapping("/greeting")
    public String greeting() {
        return "Hello from Java project!";
    }
}
