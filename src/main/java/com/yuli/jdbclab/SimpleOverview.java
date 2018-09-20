package com.yuli.jdbclab;


import lombok.extern.slf4j.Slf4j;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


@Slf4j
public class SimpleOverview implements IBookStore {

    private static final String QUERY_ALL_CUSTOMERS = "SELECT * FROM customer";
    private static final String UPDATE_LOWEST_PRICE =
            "UPDATE book SET price = %f WHERE price < %f AND format ='Hardcover'";

    @Override
    public void printCustomers() {

        try (Connection connection = DriverManager.getConnection(DB_URL,
                USER_NAME, PW);
                Statement statement = connection.createStatement()) {

            ResultSet resultSet = statement.executeQuery(QUERY_ALL_CUSTOMERS);

            while (resultSet.next()) {
                log.info("---------------------------------------------------");
                log.info("Customer ID: {}",
                        resultSet.getInt("customer_id"));
                log.info("First Name: {}",
                        resultSet.getString("first_name"));
                log.info("Last Name: {}",
                        resultSet.getString("last_name"));
                log.info("EMail: {}",
                        resultSet.getString("email"));
                log.info("Phone: {}",
                        resultSet.getString("phone"));
            }

        } catch (SQLException sqle) {
            sqle.printStackTrace();
            log.error(sqle.getMessage());
        }

    }

    @Override
    public void makeLowestBookPrice(double lowestPrice) {

        try (Connection connection = DriverManager.getConnection(DB_URL,
                        USER_NAME, PW);
                Statement statement = connection.createStatement()) {

            String updateQuery = String.format(UPDATE_LOWEST_PRICE, lowestPrice,
                    lowestPrice);
            int numRows = statement.executeUpdate(updateQuery);
            log.info("{} books updated.", numRows);
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        }

    }
}
