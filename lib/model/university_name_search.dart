// To parse this JSON data, do
//
//     final univertyNameForSearch = univertyNameForSearchFromJson(jsonString);

import 'dart:convert';

List<UnivertyNameForSearch> univertyNameForSearchFromJson(String str) => List<UnivertyNameForSearch>.from(json.decode(str).map((x) => UnivertyNameForSearch.fromJson(x)));

String univertyNameForSearchToJson(List<UnivertyNameForSearch> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UnivertyNameForSearch {
    String? universityId;
    String? universityName;
    String? city;
    String? country;
    String? countryFlag;
    String? universityLogo;

    UnivertyNameForSearch({
        this.universityId,
        this.universityName,
        this.city,
        this.country,
        this.countryFlag,
        this.universityLogo,
    });

    factory UnivertyNameForSearch.fromJson(Map<String, dynamic> json) => UnivertyNameForSearch(
        universityId: json["universityId"],
        universityName: json["universityName"],
        city: json["city"],
        country: json["country"],
        countryFlag: json["countryFlag"],
        universityLogo: json["universityLogo"],
    );

    Map<String, dynamic> toJson() => {
        "universityId": universityId,
        "universityName": universityName,
        "city": city,
        "country": country,
        "countryFlag": countryFlag,
        "universityLogo": universityLogo,
    };
}
