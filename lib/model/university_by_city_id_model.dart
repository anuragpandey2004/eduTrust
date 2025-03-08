// To parse this JSON data, do
//
//     final univertyByCityId = univertyByCityIdFromJson(jsonString);

import 'dart:convert';

List<UnivertyByCityId> univertyByCityIdFromJson(String str) => List<UnivertyByCityId>.from(json.decode(str).map((x) => UnivertyByCityId.fromJson(x)));

String univertyByCityIdToJson(List<UnivertyByCityId> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UnivertyByCityId {
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

    UnivertyByCityId({
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

    factory UnivertyByCityId.fromJson(Map<String, dynamic> json) => UnivertyByCityId(
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
