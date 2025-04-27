import 'package:json_annotation/json_annotation.dart';

part 'paginated_announcements_response.g.dart';

@JsonSerializable()
class PaginatedAnnouncementsResponse {
  final int code;
  final PaginatedAnnouncementData data;

  PaginatedAnnouncementsResponse({
    required this.code,
    required this.data,
  });

  factory PaginatedAnnouncementsResponse.fromJson(Map<String, dynamic> json) =>
      _$PaginatedAnnouncementsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PaginatedAnnouncementsResponseToJson(this);
}

@JsonSerializable()
class PaginatedAnnouncementData {
  @JsonKey(name: 'current_page')
  final int currentPage;

  final List<Announcement> data;

  @JsonKey(name: 'first_page_url')
  final String firstPageUrl;

  final num? from;

  @JsonKey(name: 'last_page')
  final num lastPage;

  @JsonKey(name: 'last_page_url')
  final String lastPageUrl;

  final List<Link> links;

  @JsonKey(name: 'next_page_url')
  final String? nextPageUrl;

  final String path;

  @JsonKey(name: 'per_page')
  final num perPage;

  @JsonKey(name: 'prev_page_url')
  final String? prevPageUrl;

  final num? to;
  final num total;

  PaginatedAnnouncementData({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.links,
    required this.nextPageUrl,
    required this.path,
    required this.perPage,
    required this.prevPageUrl,
    required this.to,
    required this.total,
  });

  factory PaginatedAnnouncementData.fromJson(Map<String, dynamic> json) =>
      _$PaginatedAnnouncementDataFromJson(json);

  Map<String, dynamic> toJson() => _$PaginatedAnnouncementDataToJson(this);
}

@JsonSerializable()
class Announcement {
  final num? id;
  final String title;
  final String body;
  final String date;
  final String time;
  final String from;
  final Department department;
  final Semester semester;
  final Course course;
  final User user;

  Announcement({
    required this.id,
    required this.title,
    required this.body,
    required this.date,
    required this.time,
    required this.from,
    required this.department,
    required this.semester,
    required this.course,
    required this.user,
  });

  factory Announcement.fromJson(Map<String, dynamic> json) =>
      _$AnnouncementFromJson(json);

  Map<String, dynamic> toJson() => _$AnnouncementToJson(this);
}

@JsonSerializable()
class Department {
  final num? id;
  final String name;

  Department({
    required this.id,
    required this.name,
  });

  factory Department.fromJson(Map<String, dynamic> json) =>
      _$DepartmentFromJson(json);

  Map<String, dynamic> toJson() => _$DepartmentToJson(this);
}

@JsonSerializable()
class Semester {
  final num? id;
  final String name;

  Semester({
    required this.id,
    required this.name,
  });

  factory Semester.fromJson(Map<String, dynamic> json) =>
      _$SemesterFromJson(json);

  Map<String, dynamic> toJson() => _$SemesterToJson(this);
}

@JsonSerializable()
class Course {
  final num? id;
  final String name;

  Course({
    required this.id,
    required this.name,
  });

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseToJson(this);
}

@JsonSerializable()
class User {
  final num? id;
  final String name;
  final String type;
  final String? avatar;

  User({
    required this.id,
    required this.name,
    required this.type,
    this.avatar,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class Link {
  final String? url;
  final String label;
  final bool active;

  Link({
    this.url,
    required this.label,
    required this.active,
  });

  factory Link.fromJson(Map<String, dynamic> json) => _$LinkFromJson(json);

  Map<String, dynamic> toJson() => _$LinkToJson(this);
}
