package com.net.provider;

public interface Provider {
    String DCLASS = "com.mysql.cj.jdbc.Driver";
    String URL = "jdbc:mysql://localhost:3306/customer";
    
    // These will be set through environment variables or a config file
    String USERNAME = System.getenv("DB_USER");
    String PASSWORD = System.getenv("DB_PASS");
}
