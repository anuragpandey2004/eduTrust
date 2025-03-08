// To parse this JSON data, do
//
//     final univertyByCountryName = univertyByCountryNameFromJson(jsonString);

import 'dart:convert';

List<UnivertyByCountryName> univertyByCountryNameFromJson(String str) => List<UnivertyByCountryName>.from(json.decode(str).map((x) => UnivertyByCountryName.fromJson(x)));

String univertyByCountryNameToJson(List<UnivertyByCountryName> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UnivertyByCountryName {
    String? universityName;
    String? universityId;
    String? description;
    int? reviewCommentsCount;
    dynamic reviewsComments;
    String? city;
    String? country;
    String? countryFlag;
    String? logoUrl;
    int? rating;
    String? ratingGivenByUser;
    int? likeDislikeCount;
    bool? isLikedByUser;
    String? applicationDeadline;
    bool? isBookmarked;

    UnivertyByCountryName({
        this.universityName,
        this.universityId,
        this.description,
        this.reviewCommentsCount,
        this.reviewsComments,
        this.city,
        this.country,
        this.countryFlag,
        this.logoUrl,
        this.rating,
        this.ratingGivenByUser,
        this.likeDislikeCount,
        this.isLikedByUser,
        this.applicationDeadline,
        this.isBookmarked,
    });

    factory UnivertyByCountryName.fromJson(Map<String, dynamic> json) => UnivertyByCountryName(
        universityName: json["universityName"],
        universityId: json["universityId"],
        description: json["description"],
        reviewCommentsCount: json["reviewCommentsCount"],
        reviewsComments: json["reviewsComments"],
        city: json["city"],
        country: json["country"],
        countryFlag: json["countryFlag"],
        logoUrl: json["logoUrl"],
        rating: json["rating"],
        ratingGivenByUser: json["ratingGivenByUser"],
        likeDislikeCount: json["likeDislikeCount"],
        isLikedByUser: json["isLikedByUser"],
        applicationDeadline: json["applicationDeadline"],
        isBookmarked: json["isBookmarked"],
    );

    Map<String, dynamic> toJson() => {
        "universityName": universityName,
        "universityId": universityId,
        "description": description,
        "reviewCommentsCount": reviewCommentsCount,
        "reviewsComments": reviewsComments,
        "city": city,
        "country": country,
        "countryFlag": countryFlag,
        "logoUrl": logoUrl,
        "rating": rating,
        "ratingGivenByUser": ratingGivenByUser,
        "likeDislikeCount": likeDislikeCount,
        "isLikedByUser": isLikedByUser,
        "applicationDeadline": applicationDeadline,
        "isBookmarked": isBookmarked,
    };
}
