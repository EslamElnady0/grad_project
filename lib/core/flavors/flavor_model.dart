import 'package:flutter_flavor/flutter_flavor.dart';

import 'flavers_const.dart';

void floverModel({
  required String name,
  required String apiUrl,
}) {
  FlavorConfig(
    name: name,
    variables: {
      FlaversConst.apiurl: apiUrl,
    },
  );
}
