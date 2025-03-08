// To parse this JSON data, do
//
//     final specificAppliedUniversity = specificAppliedUniversityFromJson(jsonString);

import 'dart:convert';

SpecificAppliedUniversity specificAppliedUniversityFromJson(String str) => SpecificAppliedUniversity.fromJson(json.decode(str));

String specificAppliedUniversityToJson(SpecificAppliedUniversity data) => json.encode(data.toJson());

class SpecificAppliedUniversity {
    int? applicationId;
    String? applicantEmailId;
    String? applicantMobileNumber;
    String? applicantName;
    String? userId;
    String? applicationSource;
    String? universityId;
    String? universityName;
    String? universityLogo;
    int? universityRating;
    String? description;
    String? currentStatus;
    String? programName;
    List<Comment>? comments;
    String? lastUpdatedBy;
    DateTime? lastUpdatedOn;
    DateTime? createdOn;

    SpecificAppliedUniversity({
        this.applicationId,
        this.applicantEmailId,
        this.applicantMobileNumber,
        this.applicantName,
        this.userId,
        this.applicationSource,
        this.universityId,
        this.universityName,
        this.universityLogo,
        this.universityRating,
        this.description,
        this.currentStatus,
        this.programName,
        this.comments,
        this.lastUpdatedBy,
        this.lastUpdatedOn,
        this.createdOn,
    });

    factory SpecificAppliedUniversity.fromJson(Map<String, dynamic> json) => SpecificAppliedUniversity(
        applicationId: json["applicationId"],
        applicantEmailId: json["applicantEmailId"],
        applicantMobileNumber: json["applicantMobileNumber"],
        applicantName: json["applicantName"],
        userId: json["userId"],
        applicationSource: json["applicationSource"],
        universityId: json["universityId"],
        universityName: json["universityName"],
        universityLogo: json["universityLogo"],
        universityRating: json["universityRating"],
        description: json["description"],
        currentStatus: json["currentStatus"],
        programName: json["programName"],
        comments: json["comments"] == null ? [] : List<Comment>.from(json["comments"]!.map((x) => Comment.fromJson(x))),
        lastUpdatedBy: json["lastUpdatedBy"],
        lastUpdatedOn: json["lastUpdatedOn"] == null ? null : DateTime.parse(json["lastUpdatedOn"]),
        createdOn: json["createdOn"] == null ? null : DateTime.parse(json["createdOn"]),
    );

    Map<String, dynamic> toJson() => {
        "applicationId": applicationId,
        "applicantEmailId": applicantEmailId,
        "applicantMobileNumber": applicantMobileNumber,
        "applicantName": applicantName,
        "userId": userId,
        "applicationSource": applicationSource,
        "universityId": universityId,
        "universityName": universityName,
        "universityLogo": universityLogo,
        "universityRating": universityRating,
        "description": description,
        "currentStatus": currentStatus,
        "programName": programName,
        "comments": comments == null ? [] : List<dynamic>.from(comments!.map((x) => x.toJson())),
        "lastUpdatedBy": lastUpdatedBy,
        "lastUpdatedOn": lastUpdatedOn?.toIso8601String(),
        "createdOn": createdOn?.toIso8601String(),
    };
}

class Comment {
    int? id;
    String? comment;
    String? commentBy;
    String? status;
    DateTime? commentedOn;

    Comment({
        this.id,
        this.comment,
        this.commentBy,
        this.status,
        this.commentedOn,
    });

    factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        id: json["id"],
        comment: json["comment"],
        commentBy: json["commentBy"],
        status: json["status"],
        commentedOn: json["commentedOn"] == null ? null : DateTime.parse(json["commentedOn"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "comment": comment,
        "commentBy": commentBy,
        "status": status,
        "commentedOn": commentedOn?.toIso8601String(),
    };
}
