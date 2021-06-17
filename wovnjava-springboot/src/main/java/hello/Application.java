package hello;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@SpringBootApplication
@RestController
public class Application {

  @RequestMapping("/home")
  public String home() {
    return "Hello World";
  }

  public static void main(String[] args) {
    SpringApplication.run(Application.class, args);
  }

}
