package com.yuli.jdbclab;


import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.util.Arrays;


@Slf4j
@SpringBootApplication
public class JdbclabApplication implements CommandLineRunner {

    public static void main(String[] args) {

        log.info(String.format("-------> STARTING JDBC LAB ... ..."));

        SpringApplication.run(JdbclabApplication.class, args);

        log.info(String.format("-------> JDBC LAB FINISHED."));
    }

    @Override
    public void run(String... args) throws Exception {
        log.info(String.format("-------> EXECUTING: COMMAND LINE RUNNER"));
        Arrays.stream(args)
                .forEach(a -> log.info(String.format("    -------> args: %s", a)));
    }
}
