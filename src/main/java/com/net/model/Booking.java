package com.net.model;

public class Booking {
    private int roomId; // 🔥 Add this line
    private String username;
    private String roomType;
    private String checkin;
    private String checkout;
    private int guests;
    private double amount;

    // 🔧 Constructor with roomId
    public Booking(int roomId, String username, String roomType, String checkin, String checkout, int guests, double amount) {
        this.roomId = roomId;
        this.username = username;
        this.roomType = roomType;
        this.checkin = checkin;
        this.checkout = checkout;
        this.guests = guests;
        this.amount = amount;
    }

    // 🔧 Getter and Setter for roomId
    public int getRoomId() {
        return roomId;
    }

    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }

    // 👇 Baaki sab same (getters/setters for username, roomType etc.)
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getRoomType() {
        return roomType;
    }

    public void setRoomType(String roomType) {
        this.roomType = roomType;
    }

    public String getCheckin() {
        return checkin;
    }

    public void setCheckin(String checkin) {
        this.checkin = checkin;
    }

    public String getCheckout() {
        return checkout;
    }

    public void setCheckout(String checkout) {
        this.checkout = checkout;
    }

    public int getGuests() {
        return guests;
    }

    public void setGuests(int guests) {
        this.guests = guests;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }
}
