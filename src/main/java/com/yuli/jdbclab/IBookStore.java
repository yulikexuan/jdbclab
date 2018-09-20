package com.yuli.jdbclab;

public interface IBookStore {

    String DB_URL = "jdbc:oracle:thin:@localhost:1521:XE";
    String USER_NAME = "sys as sysdba";
    String PW = "oracle";

    void printCustomers();
    void makeLowestBookPrice(double lowestPrice);
}
