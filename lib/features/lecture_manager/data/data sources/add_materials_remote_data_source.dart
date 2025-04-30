import 'package:dio/dio.dart';
import 'package:grad_project/core/networking/api_constants.dart';
import 'package:grad_project/features/lecture_manager/data/models/add_material_request_model.dart';
import 'package:grad_project/features/lecture_manager/data/models/add_material_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'add_materials_remote_data_source.g.dart';

//if this file is created for the first time or modified
//run the command:
//?=> dart run build_runner build --delete-conflicting-outputs
//to generate the .g.dart file
@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class AddMaterialsRemoteDataSource {
  factory AddMaterialsRemoteDataSource(Dio dio, {String baseUrl, ParseErrorLogger? errorLogger}) = _AddMaterialsRemoteDataSource;

  @POST("${ApiConstants.teachers}/${ApiConstants.courseMaterials}/{id}")
  @MultiPart()
  Future<AddMaterialResponseModel> add(
    @Path("id") int materialId,
    @Part() String title,
    @Part() String week,
    @Part() String type,
    @Part(name: 'files') List<MultipartFile> files,
  );
}
