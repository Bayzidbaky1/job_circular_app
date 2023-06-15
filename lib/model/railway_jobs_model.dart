// To parse this JSON data, do
//
//     final railwayJobsModel = railwayJobsModelFromJson(jsonString);

import 'dart:convert';

RailwayJobsModel railwayJobsModelFromJson(String str) => RailwayJobsModel.fromJson(json.decode(str));

String railwayJobsModelToJson(RailwayJobsModel data) => json.encode(data.toJson());

class RailwayJobsModel {
    List<Datum>? data;

    RailwayJobsModel({
        this.data,
    });

    factory RailwayJobsModel.fromJson(Map<String, dynamic> json) => RailwayJobsModel(
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    String? title;
    String? applyLink;
    String? deadline;
    String? type;
    List<ImageModel>? images;
    String? description;

    Datum({
        this.title,
        this.applyLink,
        this.deadline,
        this.type,
        this.images,
        this.description,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        title: json["title"],
        applyLink: json["apply_link"],
        deadline: json["deadline"],
        type: json["type"],
        images: json["images"] == null ? [] : List<ImageModel>.from(json["images"]!.map((x) => ImageModel.fromJson(x))),
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "apply_link": applyLink,
        "deadline": deadline,
        "type": type,
        "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x.toJson())),
        "description": description,
    };
}

class ImageModel {
    String? url;

    ImageModel({
        this.url,
    });

    factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
    };
}
