package models;

import java.time.LocalDate;

public class Mood {
    int range;
    String userID;
    LocalDate createDate;

    public Mood(int range, String userID, LocalDate createDate) {
        this.range = range;
        this.userID = userID;
        this.createDate = createDate;
    }

    public LocalDate getCreateDate() {
        return createDate;
    }

    public void setCreateDate(LocalDate createDate) {
        this.createDate = createDate;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public int getRange() {
        return range;
    }

    public void setRange(int range) {
        this.range = range;
    }
}
