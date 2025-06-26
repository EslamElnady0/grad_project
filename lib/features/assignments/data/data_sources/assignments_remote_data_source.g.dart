// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assignments_remote_data_source.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations

class _AssignmentsRemoteDataSource implements AssignmentsRemoteDataSource {
  _AssignmentsRemoteDataSource(this._dio, {this.baseUrl, this.errorLogger}) {
    baseUrl ??= 'https://nextgenedu-database.azurewebsites.net/api/';
  }

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<CreateAssignmentResponseModel> createAssignment(
    int courseId,
    String title,
    String description,
    String totalDegree,
    String date,
    String time,
    File file,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry('course_id', courseId.toString()));
    _data.fields.add(MapEntry('title', title));
    _data.fields.add(MapEntry('description', description));
    _data.fields.add(MapEntry('total_degree', totalDegree));
    _data.fields.add(MapEntry('date', date));
    _data.fields.add(MapEntry('time', time));
    _data.files.add(
      MapEntry(
        'file',
        MultipartFile.fromFileSync(
          file.path,
          filename: file.path.split(Platform.pathSeparator).last,
        ),
      ),
    );
    final _options = _setStreamType<CreateAssignmentResponseModel>(
      Options(
        method: 'POST',
        headers: _headers,
        extra: _extra,
        contentType: 'multipart/form-data',
      )
          .compose(
            _dio.options,
            'teachers/assignments',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late CreateAssignmentResponseModel _value;
    try {
      _value = CreateAssignmentResponseModel.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<GetAssignmentsResponseModel> getAssignments(
    String courseId,
    String assignmentStatus,
    String fromDate,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'course': courseId,
      r'status': assignmentStatus,
      r'from': fromDate,
    };
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<GetAssignmentsResponseModel>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'teachers/assignments',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late GetAssignmentsResponseModel _value;
    try {
      _value = GetAssignmentsResponseModel.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<StudentAssignmentResponseModel> getStudentAssignments() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<StudentAssignmentResponseModel>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/assignments',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late StudentAssignmentResponseModel _value;
    try {
      _value = StudentAssignmentResponseModel.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<AssignmentsSolutionResponseModel> uploadAssignmentSolution(
    int assignmentId,
    File file,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.files.add(
      MapEntry(
        'file',
        MultipartFile.fromFileSync(
          file.path,
          filename: file.path.split(Platform.pathSeparator).last,
        ),
      ),
    );
    final _options = _setStreamType<AssignmentsSolutionResponseModel>(
      Options(
        method: 'POST',
        headers: _headers,
        extra: _extra,
        contentType: 'multipart/form-data',
      )
          .compose(
            _dio.options,
            '/assignments/${assignmentId}/submit',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late AssignmentsSolutionResponseModel _value;
    try {
      _value = AssignmentsSolutionResponseModel.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<EditAssignmentResponseModel> editAssignment(
    int assignmentId,
    int courseId,
    String title,
    String description,
    String totalDegree,
    String date,
    String time,
    File? file,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry('course_id', courseId.toString()));
    _data.fields.add(MapEntry('title', title));
    _data.fields.add(MapEntry('description', description));
    _data.fields.add(MapEntry('total_degree', totalDegree));
    _data.fields.add(MapEntry('date', date));
    _data.fields.add(MapEntry('time', time));
    if (file != null) {
      _data.files.add(
        MapEntry(
          'file',
          MultipartFile.fromFileSync(
            file.path,
            filename: file.path.split(Platform.pathSeparator).last,
          ),
        ),
      );
    }
    final _options = _setStreamType<EditAssignmentResponseModel>(
      Options(
        method: 'POST',
        headers: _headers,
        extra: _extra,
        contentType: 'multipart/form-data',
      )
          .compose(
            _dio.options,
            'teachers/assignments/${assignmentId}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late EditAssignmentResponseModel _value;
    try {
      _value = EditAssignmentResponseModel.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(String dioBaseUrl, String? baseUrl) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
