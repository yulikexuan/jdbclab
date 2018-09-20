package com.yuli.jdbclab;


import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.*;


public class SimpleOverviewIT {

    private SimpleOverview simpleOverview;

    @Before
    public void setUp() throws Exception {
        this.simpleOverview = new SimpleOverview();
    }

    @Test
    public void printCustomers() {
        // When
        this.simpleOverview.printCustomers();
    }

    @Test
    public void able_To_Update_Lowest_Book_Price() {
        // When
        this.simpleOverview.makeLowestBookPrice(10.99);
    }
}