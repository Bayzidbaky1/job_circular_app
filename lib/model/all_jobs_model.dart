// To parse this JSON data, do
//
//     final allJobsModel = allJobsModelFromJson(jsonString);

import 'dart:convert';

AllJobsModel allJobsModelFromJson(String str) => AllJobsModel.fromJson(json.decode(str));

String allJobsModelToJson(AllJobsModel data) => json.encode(data.toJson());

class AllJobsModel {
    List<Datum>? data;

    AllJobsModel({
        this.data,
    });

    factory AllJobsModel.fromJson(Map<String, dynamic> json) => AllJobsModel(
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
    List<Image>? images;
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
        images: json["images"] == null ? [] : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
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

class Image {
    String? url;

    Image({
        this.url,
    });

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
    };
}
