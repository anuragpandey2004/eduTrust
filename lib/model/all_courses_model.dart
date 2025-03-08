// To parse this JSON data, do
//
//     final getAllCourses = getAllCoursesFromJson(jsonString);

import 'dart:convert';

List<GetAllCourses> getAllCoursesFromJson(String str) => List<GetAllCourses>.from(json.decode(str).map((x) => GetAllCourses.fromJson(x)));

String getAllCoursesToJson(List<GetAllCourses> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetAllCourses {
    String? courseName;
    int? courseId;

    GetAllCourses({
        this.courseName,
        this.courseId,
    });

    factory GetAllCourses.fromJson(Map<String, dynamic> json) => GetAllCourses(
        courseName: json["courseName"],
        courseId: json["courseId"],
    );

    Map<String, dynamic> toJson() => {
        "courseName": courseName,
        "courseId": courseId,
    };

  void getAllCourses() {}
}
