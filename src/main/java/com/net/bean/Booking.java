package com.net.bean;

import java.util.Date;

public class Booking {
    private int id;
    private int roomId;
    private String username;
    private Date checkin;
    private Date checkout;
    private int adults;
    private int children;
    private String paymentMethod;
    private String status;

    // ID
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    // Room ID
    public int getRoomId() { return roomId; }
    public void setRoomId(int roomId) { this.roomId = roomId; }

    // Username
    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }

    // Check-in
    public Date getCheckin() { return checkin; }
    public void setCheckin(Date checkin) { this.checkin = checkin; }

    // Check-out
    public Date getCheckout() { return checkout; }
    public void setCheckout(Date checkout) { this.checkout = checkout; }

    // Adults
    public int getAdults() { return adults; }
    public void setAdults(int adults) { this.adults = adults; }

    // Children
    public int getChildren() { return children; }
    public void setChildren(int children) { this.children = children; }

    // Payment Method
    public String getPaymentMethod() { return paymentMethod; }
    public void setPaymentMethod(String paymentMethod) { this.paymentMethod = paymentMethod; }

    // Status
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}
