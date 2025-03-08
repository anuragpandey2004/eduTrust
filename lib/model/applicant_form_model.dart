// To parse this JSON data, do
//
//     final applicantForm = applicantFormFromJson(jsonString);

import 'dart:convert';

ApplicantForm applicantFormFromJson(String str) => ApplicantForm.fromJson(json.decode(str));

String applicantFormToJson(ApplicantForm data) => json.encode(data.toJson());

class ApplicantForm {
    int? personalDetailId;
    String? userId;
    String? fullName;
    String? email;
    String? mobileNumber;
    String? alternateMobileNumber;
    String? nationality;
    String? city;
    String? gender;
    String? maritalStatus;
    DateTime? personalDetailsLastUpdatedOn;
    List<EducationHistory>? educationHistories;
    List<WorkExperience>? workExperiences;
    TravelDetails? travelDetails;
    dynamic uploadedDocs;

    ApplicantForm({
        this.personalDetailId,
        this.userId,
        this.fullName,
        this.email,
        this.mobileNumber,
        this.alternateMobileNumber,
        this.nationality,
        this.city,
        this.gender,
        this.maritalStatus,
        this.personalDetailsLastUpdatedOn,
        this.educationHistories,
        this.workExperiences,
        this.travelDetails,
        this.uploadedDocs,
    });

    factory ApplicantForm.fromJson(Map<String, dynamic> json) => ApplicantForm(
        personalDetailId: json["personalDetailId"],
        userId: json["userId"],
        fullName: json["fullName"],
        email: json["email"],
        mobileNumber: json["mobileNumber"],
        alternateMobileNumber: json["alternateMobileNumber"],
        nationality: json["nationality"],
        city: json["city"],
        gender: json["gender"],
        maritalStatus: json["maritalStatus"],
        personalDetailsLastUpdatedOn: json["personalDetailsLastUpdatedOn"] == null ? null : DateTime.parse(json["personalDetailsLastUpdatedOn"]),
        educationHistories: json["educationHistories"] == null ? [] : List<EducationHistory>.from(json["educationHistories"]!.map((x) => EducationHistory.fromJson(x))),
        workExperiences: json["workExperiences"] == null ? [] : List<WorkExperience>.from(json["workExperiences"]!.map((x) => WorkExperience.fromJson(x))),
        travelDetails: json["travelDetails"] == null ? null : TravelDetails.fromJson(json["travelDetails"]),
        uploadedDocs: json["uploadedDocs"] == null ? [] : List<UploadedDoc>.from(json["uploadedDocs"]!.map((x) => UploadedDoc.fromJson(x))),

    );

    Map<String, dynamic> toJson() => {
        "personalDetailId": personalDetailId,
        "userId": userId,
        "fullName": fullName,
        "email": email,
        "mobileNumber": mobileNumber,
        "alternateMobileNumber": alternateMobileNumber,
        "nationality": nationality,
        "city": city,
        "gender": gender,
        "maritalStatus": maritalStatus,
        "personalDetailsLastUpdatedOn": personalDetailsLastUpdatedOn?.toIso8601String(),
        "educationHistories": educationHistories == null ? [] : List<dynamic>.from(educationHistories!.map((x) => x.toJson())),
        "workExperiences": workExperiences == null ? [] : List<dynamic>.from(workExperiences!.map((x) => x.toJson())),
        "travelDetails": travelDetails?.toJson(),
        "uploadedDocs": uploadedDocs,
    };
}

class EducationHistory {
    int? educationHistoryId;
    String? degreeName;
    bool? gapPresent;
    String? gapYears;
    String? degreeStartDate;
    String? degreeEndDate;
    String? degreeUrl;
    DateTime? addedOn;

    EducationHistory({
        this.educationHistoryId,
        this.degreeName,
        this.gapPresent,
        this.gapYears,
        this.degreeStartDate,
        this.degreeEndDate,
        this.degreeUrl,
        this.addedOn,
    });

    factory EducationHistory.fromJson(Map<String, dynamic> json) => EducationHistory(
        educationHistoryId: json["educationHistoryId"],
        degreeName: json["degreeName"],
        gapPresent: json["gapPresent"],
        gapYears: json["gapYears"],
        degreeStartDate: json["degreeStartDate"],
        degreeEndDate: json["degreeEndDate"],
        degreeUrl: json["degreeUrl"],
        addedOn: json["addedOn"] == null ? null : DateTime.parse(json["addedOn"]),
    );

    Map<String, dynamic> toJson() => {
        "educationHistoryId": educationHistoryId,
        "degreeName": degreeName,
        "gapPresent": gapPresent,
        "gapYears": gapYears,
        "degreeStartDate": degreeStartDate,
        "degreeEndDate": degreeEndDate,
        "degreeUrl": degreeUrl,
        "addedOn": addedOn?.toIso8601String(),
    };
}

class TravelDetails {
    int? travelDetailId;
    bool? passportAvailable;
    String? passportNumber;
    bool? visaAvailable;
    String? visaNumber;
    bool? visaRefusal;
    String? visaRefusalReason;
    String? passportUrl;
    String? visaUrl;
    DateTime? travelDetailsLastUpdatedOn;

    TravelDetails({
        this.travelDetailId,
        this.passportAvailable,
        this.passportNumber,
        this.visaAvailable,
        this.visaNumber,
        this.visaRefusal,
        this.visaRefusalReason,
        this.passportUrl,
        this.visaUrl,
        this.travelDetailsLastUpdatedOn,
    });

    factory TravelDetails.fromJson(Map<String, dynamic> json) => TravelDetails(
        travelDetailId: json["travelDetailId"],
        passportAvailable: json["passportAvailable"],
        passportNumber: json["passportNumber"],
        visaAvailable: json["visaAvailable"],
        visaNumber: json["visaNumber"],
        visaRefusal: json["visaRefusal"],
        visaRefusalReason: json["visaRefusalReason"],
        passportUrl: json["passportUrl"],
        visaUrl: json["visaUrl"],
        travelDetailsLastUpdatedOn: json["travelDetailsLastUpdatedOn"] == null ? null : DateTime.parse(json["travelDetailsLastUpdatedOn"]),
    );

    Map<String, dynamic> toJson() => {
        "travelDetailId": travelDetailId,
        "passportAvailable": passportAvailable,
        "passportNumber": passportNumber,
        "visaAvailable": visaAvailable,
        "visaNumber": visaNumber,
        "visaRefusal": visaRefusal,
        "visaRefusalReason": visaRefusalReason,
        "passportUrl": passportUrl,
        "visaUrl": visaUrl,
        "travelDetailsLastUpdatedOn": travelDetailsLastUpdatedOn?.toIso8601String(),
    };
}

class WorkExperience {
    int? workExpId;
    String? orgName;
    String? referenceName;
    String? referenceNumber;
    String? workStartDate;
    String? workEndDate;
    DateTime? addedOn;

    WorkExperience({
        this.workExpId,
        this.orgName,
        this.referenceName,
        this.referenceNumber,
        this.workStartDate,
        this.workEndDate,
        this.addedOn,
    });

    factory WorkExperience.fromJson(Map<String, dynamic> json) => WorkExperience(
        workExpId: json["workExpId"],
        orgName: json["orgName"],
        referenceName: json["referenceName"],
        referenceNumber: json["referenceNumber"],
        workStartDate: json["workStartDate"],
        workEndDate: json["workEndDate"],
        addedOn: json["addedOn"] == null ? null : DateTime.parse(json["addedOn"]),
    );

    Map<String, dynamic> toJson() => {
        "workExpId": workExpId,
        "orgName": orgName,
        "referenceName": referenceName,
        "referenceNumber": referenceNumber,
        "workStartDate": workStartDate,
        "workEndDate": workEndDate,
        "addedOn": addedOn?.toIso8601String(),
    };
}
class UploadedDoc {
    int? uploadedDocId;
    String? docType;
    String? docUrl;
    String? description;
    DateTime? addedOn;

    UploadedDoc({
        this.uploadedDocId,
        this.docType,
        this.docUrl,
        this.description,
        this.addedOn,
    });

    factory UploadedDoc.fromJson(Map<String, dynamic> json) => UploadedDoc(
        uploadedDocId: json["uploadedDocId"],
        docType: json["docType"],
        docUrl: json["docUrl"],
        description: json["description"],
        addedOn: json["addedOn"] == null ? null : DateTime.parse(json["addedOn"]),
    );

    Map<String, dynamic> toJson() => {
        "uploadedDocId": uploadedDocId,
        "docType": docType,
        "docUrl": docUrl,
        "description": description,
        "addedOn": addedOn?.toIso8601String(),
    };
}
