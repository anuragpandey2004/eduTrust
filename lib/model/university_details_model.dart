// To parse this JSON data, do
//
//     final universityDetailsById = universityDetailsByIdFromJson(jsonString);

import 'dart:convert';

UniversityDetailsById universityDetailsByIdFromJson(String str) => UniversityDetailsById.fromJson(json.decode(str));

String universityDetailsByIdToJson(UniversityDetailsById data) => json.encode(data.toJson());

class UniversityDetailsById {
    String? universityName;
    String? universityId;
    String? description;
    int? reviewCommentsCount;
    List<ReviewsComment>? reviewsComments;
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

    UniversityDetailsById({
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

    factory UniversityDetailsById.fromJson(Map<String, dynamic> json) => UniversityDetailsById(
        universityName: json["universityName"],
        universityId: json["universityId"],
        description: json["description"],
        reviewCommentsCount: json["reviewCommentsCount"],
        reviewsComments: json["reviewsComments"] == null ? [] : List<ReviewsComment>.from(json["reviewsComments"]!.map((x) => ReviewsComment.fromJson(x))),
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
        "reviewsComments": reviewsComments == null ? [] : List<dynamic>.from(reviewsComments!.map((x) => x.toJson())),
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

class ReviewsComment {
    int? id;
    String? universityId;
    String? description;
    int? parentId;
    String? reviewedBy;
    List<ReviewsComment>? replies;

    ReviewsComment({
        this.id,
        this.universityId,
        this.description,
        this.parentId,
        this.reviewedBy,
        this.replies,
    });

    factory ReviewsComment.fromJson(Map<String, dynamic> json) => ReviewsComment(
        id: json["id"],
        universityId: json["universityId"],
        description: json["description"],
        parentId: json["parentId"],
        reviewedBy: json["reviewedBy"],
        replies: json["replies"] == null ? [] : List<ReviewsComment>.from(json["replies"]!.map((x) => ReviewsComment.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "universityId": universityId,
        "description": description,
        "parentId": parentId,
        "reviewedBy": reviewedBy,
        "replies": replies == null ? [] : List<dynamic>.from(replies!.map((x) => x.toJson())),
    };
}
