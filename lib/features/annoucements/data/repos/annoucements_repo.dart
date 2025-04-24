import '../data sources/annoucements_local_data_source.dart';
import '../data sources/annoucements_remote_data_source.dart';

class AnnoucementsRepo {
  final AnnoucementsRemoteDataSource remoteDataSource;
  final AnnoucementsLocalDataSource localDataSource;

  AnnoucementsRepo({
    required this.remoteDataSource,
    required this.localDataSource,
  });

}
