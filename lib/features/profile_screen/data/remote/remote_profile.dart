import 'package:career/core/utils/api/api_server.dart';
import 'package:career/features/profile_screen/domain/entity/profile_person.dart';

class RemoteProfile {
  ApiServer apiServer = ApiServer();
  Future<ProfilePersonModel> getProfile(
    String userId,
  ) async {
    var result = await apiServer.getRequest(
      uri: "/api/Person/GetPersonById?id=$userId",
    );
    ProfilePersonModel profilePersonModel =
        ProfilePersonModel.fromJson(result["data"]);
    return profilePersonModel;
  }
}
