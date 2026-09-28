package com.garagepro;

import com.garagepro.model.User;
import com.garagepro.repository.UserRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import java.util.Optional;

@Component
public class DataInitializer implements CommandLineRunner {
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    public DataInitializer(UserRepository userRepository, PasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    public void run(String... args) throws Exception {
        Optional<User> adminOpt = userRepository.findByEmail("admin@garagepro.com");
        if (adminOpt.isEmpty()) {
            User admin = new User();
            admin.setName("Admin User");
            admin.setEmail("admin@garagepro.com");
            admin.setPassword(passwordEncoder.encode("admin123"));
            admin.setRole("ADMIN");
            userRepository.save(admin);
            System.out.println("Admin user created: admin@garagepro.com / admin123");
        }
    }
}
