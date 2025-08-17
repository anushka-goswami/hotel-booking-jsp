package com.net.model;

public class Booking {
    private int id;
    private int roomId;
    private String username;
    private String checkin;
    private String checkout;
    private int adults;
    private int children;
    private String paymentMethod;
    private String status;

    // ✅ Full Constructor
    public Booking(int id, int roomId, String username, String checkin, String checkout,
                   int adults, int children, String paymentMethod, String status) {
        this.id = id;
        this.roomId = roomId;
        this.username = username;
        this.checkin = checkin;
        this.checkout = checkout;
        this.adults = adults;
        this.children = children;
        this.paymentMethod = paymentMethod;
        this.status = status;
    }

    // ✅ Empty Constructor
    public Booking() {}

    // 🔽 Getters & Setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getRoomId() {
        return roomId;
    }

    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
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

    public int getAdults() {
        return adults;
    }

    public void setAdults(int adults) {
        this.adults = adults;
    }

    public int getChildren() {
        return children;
    }

    public void setChildren(int children) {
        this.children = children;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
