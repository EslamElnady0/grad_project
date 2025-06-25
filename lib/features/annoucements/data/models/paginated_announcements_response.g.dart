// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_announcements_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginatedAnnouncementsResponse _$PaginatedAnnouncementsResponseFromJson(
        Map<String, dynamic> json) =>
    PaginatedAnnouncementsResponse(
      code: (json['code'] as num).toInt(),
      data: PaginatedAnnouncementData.fromJson(
          json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PaginatedAnnouncementsResponseToJson(
        PaginatedAnnouncementsResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
    };

PaginatedAnnouncementData _$PaginatedAnnouncementDataFromJson(
        Map<String, dynamic> json) =>
    PaginatedAnnouncementData(
      currentPage: (json['current_page'] as num).toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => Announcement.fromJson(e as Map<String, dynamic>))
          .toList(),
      firstPageUrl: json['first_page_url'] as String?,
      from: json['from'] as num?,
      lastPage: json['last_page'] as num,
      lastPageUrl: json['last_page_url'] as String?,
      links: (json['links'] as List<dynamic>)
          .map((e) => Link.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPageUrl: json['next_page_url'] as String?,
      path: json['path'] as String?,
      perPage: json['per_page'] as num,
      prevPageUrl: json['prev_page_url'] as String?,
      to: json['to'] as num?,
      total: json['total'] as num,
    );

Map<String, dynamic> _$PaginatedAnnouncementDataToJson(
        PaginatedAnnouncementData instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'data': instance.data,
      'first_page_url': instance.firstPageUrl,
      'from': instance.from,
      'last_page': instance.lastPage,
      'last_page_url': instance.lastPageUrl,
      'links': instance.links,
      'next_page_url': instance.nextPageUrl,
      'path': instance.path,
      'per_page': instance.perPage,
      'prev_page_url': instance.prevPageUrl,
      'to': instance.to,
      'total': instance.total,
    };

Announcement _$AnnouncementFromJson(Map<String, dynamic> json) => Announcement(
      id: json['id'] as num?,
      title: json['title'] as String?,
      body: json['body'] as String,
      date: json['date'] as String,
      time: json['time'] as String,
      from: json['from'] as String,
      department:
          Department.fromJson(json['department'] as Map<String, dynamic>),
      semester: Semester.fromJson(json['semester'] as Map<String, dynamic>),
      course: Course.fromJson(json['course'] as Map<String, dynamic>),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnnouncementToJson(Announcement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'date': instance.date,
      'time': instance.time,
      'from': instance.from,
      'department': instance.department,
      'semester': instance.semester,
      'course': instance.course,
      'user': instance.user,
    };

Department _$DepartmentFromJson(Map<String, dynamic> json) => Department(
      id: json['id'] as num?,
      name: json['name'] as String,
    );

Map<String, dynamic> _$DepartmentToJson(Department instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

Semester _$SemesterFromJson(Map<String, dynamic> json) => Semester(
      id: json['id'] as num?,
      name: json['name'] as String,
    );

Map<String, dynamic> _$SemesterToJson(Semester instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

Course _$CourseFromJson(Map<String, dynamic> json) => Course(
      id: json['id'] as num?,
      name: json['name'] as String,
    );

Map<String, dynamic> _$CourseToJson(Course instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as num?,
      name: json['name'] as String,
      type: json['type'] as String,
      avatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'avatar': instance.avatar,
    };

Link _$LinkFromJson(Map<String, dynamic> json) => Link(
      url: json['url'] as String?,
      label: json['label'] as String?,
      active: json['active'] as bool,
    );

Map<String, dynamic> _$LinkToJson(Link instance) => <String, dynamic>{
      'url': instance.url,
      'label': instance.label,
      'active': instance.active,
    };
