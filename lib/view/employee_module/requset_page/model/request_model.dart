// To parse this JSON data, do
//
//     final assignedBookingsMoldel = assignedBookingsMoldelFromJson(jsonString);

import 'dart:convert';

AssignedBookingsMoldel assignedBookingsMoldelFromJson(String str) => AssignedBookingsMoldel.fromJson(json.decode(str));

String assignedBookingsMoldelToJson(AssignedBookingsMoldel data) => json.encode(data.toJson());

class AssignedBookingsMoldel {
    String? status;
    String? username;
    String? phone;
    String? email;
    dynamic address;
    List<AssignedBooking>? assignedBookings;

    AssignedBookingsMoldel({
        this.status,
        this.username,
        this.phone,
        this.email,
        this.address,
        this.assignedBookings,
    });

    factory AssignedBookingsMoldel.fromJson(Map<String, dynamic> json) => AssignedBookingsMoldel(
        status: json["status"],
        username: json["username"],
        phone: json["phone"],
        email: json["email"],
        address: json["address"],
        assignedBookings: json["assigned_bookings"] == null ? [] : List<AssignedBooking>.from(json["assigned_bookings"]!.map((x) => AssignedBooking.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "username": username,
        "phone": phone,
        "email": email,
        "address": address,
        "assigned_bookings": assignedBookings == null ? [] : List<dynamic>.from(assignedBookings!.map((x) => x.toJson())),
    };
}

class AssignedBooking {
    int? id;
    String? productName;
    String? size;
    String? weight;
    int? quantity;
    int? totalPrice;
    double? advanceFee;
    String? status;
    DateTime? bookingDate;
    String? source;

    AssignedBooking({
        this.id,
        this.productName,
        this.size,
        this.weight,
        this.quantity,
        this.totalPrice,
        this.advanceFee,
        this.status,
        this.bookingDate,
        this.source,
    });

    factory AssignedBooking.fromJson(Map<String, dynamic> json) => AssignedBooking(
        id: json["id"],
        productName: json["product_name"],
        size: json["size"],
        weight: json["weight"],
        quantity: json["quantity"],
        totalPrice: json["total_price"],
        advanceFee: json["advance_fee"]?.toDouble(),
        status: json["status"],
        bookingDate: json["booking_date"] == null ? null : DateTime.parse(json["booking_date"]),
        source: json["source"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "product_name": productName,
        "size": size,
        "weight": weight,
        "quantity": quantity,
        "total_price": totalPrice,
        "advance_fee": advanceFee,
        "status": status,
        "booking_date": bookingDate?.toIso8601String(),
        "source": source,
    };
}
