package models;

public class User {
    private String userID;
    private String username;
    private String password;

    public User(String userID, String username, String password){
        this.userID = userID;
        this.username = username;
        this.password = password;
    }

    public User(){}

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }
}
