import 'package:pushbike_app/core/abstraction/response_model.abstraction.dart';
import 'package:pushbike_app/core/db/local_user_data.dart';
import 'package:pushbike_app/core/services/local_db.service.dart';
import 'package:pushbike_app/modules/authentication/models/responses/user_data.response.model.dart';

class LocalDBHelper {
  /// Sets user data to local storage, including the selected rider and token.
  static Future<void> setUserLocalData(
    ResponseModelAbstraction<UserDataResponseModel> response,
    String token,
  ) async {
    if (response.data == null) {
      throw Exception('User data is null');
    }

    final riders = response.data?.wali?.riders;
    LocalRider? selectedRider;
    LocalRiderMembership? membership;

    if (riders != null && riders.isNotEmpty) {
      final riderData = riders.first;
      selectedRider = LocalRider.fromRider(riderData);
      if (riderData.membership != null) {
        membership = LocalRiderMembership.fromMembership(riderData.membership!);
      }
    }

    final user = LocalUserData.fromUserDataResponseModel(
      response.data!,
      token: token,
      selectedRider: selectedRider,
      membership: membership,
    );
    await LocalDbService.setUserLocalData(user);
  }

  static Future<void> clearLocalData() async {
    await LocalDbService.clearLocalData();
  }
}
