// To parse this JSON data, do
//
//     final univertyCountryGroup = univertyCountryGroupFromJson(jsonString);

import 'dart:convert';

UnivertyCountryGroup univertyCountryGroupFromJson(String str) => UnivertyCountryGroup.fromJson(json.decode(str));

String univertyCountryGroupToJson(UnivertyCountryGroup data) => json.encode(data.toJson());

class UnivertyCountryGroup {
    List<GroupedByCountry>? groupedByCountry;
    List<GroupedByCity>? groupedByCity;
    List<GroupedByCourse>? groupedByCourse;

    UnivertyCountryGroup({
        this.groupedByCountry,
        this.groupedByCity,
        this.groupedByCourse,
    });

    factory UnivertyCountryGroup.fromJson(Map<String, dynamic> json) => UnivertyCountryGroup(
        groupedByCountry: json["groupedByCountry"] == null ? [] : List<GroupedByCountry>.from(json["groupedByCountry"]!.map((x) => GroupedByCountry.fromJson(x))),
        groupedByCity: json["groupedByCity"] == null ? [] : List<GroupedByCity>.from(json["groupedByCity"]!.map((x) => GroupedByCity.fromJson(x))),
        groupedByCourse: json["groupedByCourse"] == null ? [] : List<GroupedByCourse>.from(json["groupedByCourse"]!.map((x) => GroupedByCourse.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "groupedByCountry": groupedByCountry == null ? [] : List<dynamic>.from(groupedByCountry!.map((x) => x.toJson())),
        "groupedByCity": groupedByCity == null ? [] : List<dynamic>.from(groupedByCity!.map((x) => x.toJson())),
        "groupedByCourse": groupedByCourse == null ? [] : List<dynamic>.from(groupedByCourse!.map((x) => x.toJson())),
    };
}

class GroupedByCity {
    int? locationId;
    String? city;
    int? universityCount;
    String? countryFlagUrl;

    GroupedByCity({
        this.locationId,
        this.city,
        this.universityCount,
        this.countryFlagUrl,
    });

    factory GroupedByCity.fromJson(Map<String, dynamic> json) => GroupedByCity(
        locationId: json["locationId"],
        city: json["city"],
        universityCount: json["universityCount"],
        countryFlagUrl: json["countryFlagUrl"],
    );

    Map<String, dynamic> toJson() => {
        "locationId": locationId,
        "city": city,
        "universityCount": universityCount,
        "countryFlagUrl": countryFlagUrl,
    };
}

class GroupedByCountry {
    String? country;
    int? universityCount;
    String? countryFlagUrl;

    GroupedByCountry({
        this.country,
        this.universityCount,
        this.countryFlagUrl,
    });

    factory GroupedByCountry.fromJson(Map<String, dynamic> json) => GroupedByCountry(
        country: json["country"],
        universityCount: json["universityCount"],
        countryFlagUrl: json["countryFlagUrl"],
    );

    Map<String, dynamic> toJson() => {
        "country": country,
        "universityCount": universityCount,
        "countryFlagUrl": countryFlagUrl,
    };
}

class GroupedByCourse {
    int? courseId;
    String? courseName;
    int? universityCount;

    GroupedByCourse({
        this.courseId,
        this.courseName,
        this.universityCount,
    });

    factory GroupedByCourse.fromJson(Map<String, dynamic> json) => GroupedByCourse(
        courseId: json["courseId"],
        courseName: json["courseName"],
        universityCount: json["universityCount"],
    );

    Map<String, dynamic> toJson() => {
        "courseId": courseId,
        "courseName": courseName,
        "universityCount": universityCount,
    };
}
