// To parse this JSON data, do
//
//     final gpaySingleModel = gpaySingleModelFromJson(jsonString);

import 'dart:convert';

GpaySingleModel gpaySingleModelFromJson(String str) => GpaySingleModel.fromJson(json.decode(str));

String gpaySingleModelToJson(GpaySingleModel data) => json.encode(data.toJson());

class GpaySingleModel {
    int? id;
    String? status;
    String? upiId;
    int? booking;

    GpaySingleModel({
        this.id,
        this.status,
        this.upiId,
        this.booking,
    });

    factory GpaySingleModel.fromJson(Map<String, dynamic> json) => GpaySingleModel(
        id: json["id"],
        status: json["status"],
        upiId: json["upi_id"],
        booking: json["booking"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "upi_id": upiId,
        "booking": booking,
    };
}
