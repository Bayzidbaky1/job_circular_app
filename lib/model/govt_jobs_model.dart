// To parse this JSON data, do
//
//     final govtJobsModel = govtJobsModelFromJson(jsonString);

import 'dart:convert';

GovtJobsModel govtJobsModelFromJson(String str) => GovtJobsModel.fromJson(json.decode(str));

String govtJobsModelToJson(GovtJobsModel data) => json.encode(data.toJson());

class GovtJobsModel {
    List<Datum>? data;

    GovtJobsModel({
        this.data,
    });

    factory GovtJobsModel.fromJson(Map<String, dynamic> json) => GovtJobsModel(
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
    List<ImageMOdel>? images;
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
        images: json["images"] == null ? [] : List<ImageMOdel>.from(json["images"]!.map((x) => ImageMOdel.fromJson(x))),
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

class ImageMOdel {
    String? url;

    ImageMOdel({
        this.url,
    });

    factory ImageMOdel.fromJson(Map<String, dynamic> json) => ImageMOdel(
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
    };
}
