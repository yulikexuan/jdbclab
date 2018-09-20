package com.yuli.jdbclab;


import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
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

    private void executeSql(String sql) {

        try (Connection connection = DriverManager.getConnection(
                IBookStore.DB_URL, IBookStore.USER_NAME, IBookStore.PW);
                Statement statement = connection.createStatement()) {

            boolean status = statement.execute(sql);



        } catch (SQLException sqle) {
            sqle.printStackTrace();
        }

    }
}
