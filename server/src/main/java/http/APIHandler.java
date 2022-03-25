package http;

import database.DatabaseConnect;
import io.javalin.http.Context;
import models.User;

import java.sql.SQLException;

public class APIHandler {
    private DatabaseConnect db;

    public APIHandler(String dbUrl) {
        try {
            db = new DatabaseConnect(dbUrl);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void getUserData(Context context) {
        User user = context.bodyAsClass(User.class);
        boolean userExists = db.checkUserExists(user);
        if (!userExists) {
            context.status(404);
        } else {
            User details = db.loginGetUserDetails(user);
            details.setPassword("Not today FBI man");
            context.json(details);
            context.status(200);
        }
    }

    public void addUserData(Context context) {
        User newUser = context.bodyAsClass(User.class);
        boolean userExists = db.checkUserExists(newUser);
        if (userExists) {
            context.status(409);
        } else {
            db.addNewUser(newUser);
            context.json(newUser);
            context.status(200);
        }
    }

    public void getAllMoodsData(Context context) {
    }

    public void addMood(Context context) {
    }

    public void deleteUser(Context context) {
        User user = context.bodyAsClass(User.class);
        boolean userExists = db.checkUserExists(user);
        if (!userExists) {
            context.status(404);
        } else {
            db.deleteUser(user);
            context.json(user);
            context.status(200);
        }
    }
}
