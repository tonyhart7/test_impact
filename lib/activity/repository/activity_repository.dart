import 'package:dio/dio.dart';
import 'package:test_impact/activity/model/activity.dart';
import 'package:test_impact/utils/app_utils.dart';

class ActivityRepository {
  Future<ActivityRecordList?> getAllActivities() async {
    final dio = Dio();
    final response = await dio.get<Map<String, dynamic>>(
      '${GlobalAPIKey().baseUrl}activities',
    );

    if (response.statusCode == 200) {
      return ActivityRecordList.fromMap(response.data!);
    } else {
      return null;
    }
  }
}
