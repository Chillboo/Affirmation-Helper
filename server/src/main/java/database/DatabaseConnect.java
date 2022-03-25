package database;

import models.User;

import java.sql.*;
import java.util.HashMap;

public class DatabaseConnect {
    public final Connection connection;

    public DatabaseConnect(String dbUrl) throws SQLException {
        this.connection = DriverManager.getConnection("jdbc:sqlite:" + dbUrl);
    }

    public boolean checkUserExists(User user) {
        boolean result = false;
        try (final PreparedStatement stmt = connection.prepareStatement(
                "SELECT EXISTS(SELECT 1 FROM user WHERE username=?);"
        )) {
            stmt.setString(1, user.getUsername());
            stmt.execute();
            try( ResultSet results = stmt.getResultSet() ) {
                result = results.getInt(1) == 1;
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
    return result;
    }

    public void addNewUser(User user) {
        if (!checkUserExists(user)) {
            try (final PreparedStatement stmt = connection.prepareStatement(
                    "INSERT INTO user (userID, password, username) " +
                            "VALUES(?, ?, ?);"
            )) {
                stmt.setString(1, user.getUserID());
                stmt.setString(2, user.getPassword());
                stmt.setString(3, user.getUsername());
                stmt.execute();
            }catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public void deleteUser(User user) {
        if (checkUserExists(user)) {
            try (final PreparedStatement stmt = connection.prepareStatement(
                    "DELETE FROM user WHERE username=? AND password=?"
            )) {
                stmt.setString(1, user.getUsername());
                stmt.setString(2, user.getPassword());
                stmt.execute();
            }catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public User loginGetUserDetails(User user) {
        User details = new User();
        if (checkUserExists(user)) {
            try (final PreparedStatement stmt = connection.prepareStatement(
                    "SELECT * FROM user WHERE username=? AND password=?"
            )) {
                stmt.setString(1, user.getUsername());
                stmt.setString(2, user.getPassword());
                stmt.execute();
                try( ResultSet results = stmt.getResultSet() ) {
                    while( results.next() ){
                        details.setUsername(results.getString("username"));
                        details.setPassword(results.getString("password"));
                        details.setUserID(results.getString("userID"));
                    }
                }
            }catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return details;
    }
}
