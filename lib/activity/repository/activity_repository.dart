import 'package:dio/dio.dart';
import 'package:test_impact/activity/model/activity.dart';
import 'package:test_impact/utils/app_utils.dart';

class ActivityRepository {
  Uri baseUrl = Uri.parse(GlobalAPIKey().baseUrl);

  Future<ActivityRecordList?> getAllActivities() async {
    final dio = Dio();
    final response = await dio.get<Map<String, dynamic>>(
      '$baseUrl/activities',
    );

    if (response.statusCode == 200) {
      return ActivityRecordList.fromMap(response.data!);
    } else {
      return null;
    }
  }

  Future<ActivityRecord?> getActivity(int id) async {
    final dio = Dio();
    final response = await dio.get<Map<String, dynamic>>(
      '$baseUrl/activities/$id',
    );

    if (response.statusCode == 200) {
      return ActivityRecord.fromMap(response.data!);
    } else {
      return null;
    }
  }

  Future<ActivityRecord?> sendActivity({
    required int id,
    required String activityType,
    required String institution,
    required DateTime when,
    required String objective,
    required String remarks,
  }) async {
    final dio = Dio();
    final response = await dio.post<Map<String, dynamic>>(
      '$baseUrl/activities',
      data: ActivityRecord(
        id: id,
        activityType: activityType,
        institution: institution,
        when: when,
        objective: objective,
        remarks: remarks,
      ).toMap(),
    );

    if (response.statusCode == 200) {
      return ActivityRecord.fromMap(response.data!);
    } else {
      return null;
    }
  }

  Future<ActivityRecord?> updateActivity({
    required int id,
    required String activityType,
    required String institution,
    required DateTime when,
    required String objective,
    required String remarks,
  }) async {
    final dio = Dio();
    final response = await dio.put<Map<String, dynamic>>(
      '$baseUrl/activities/$id',
      data: ActivityRecord(
        id: id,
        activityType: activityType,
        institution: institution,
        when: when,
        objective: objective,
        remarks: remarks,
      ).toMap(),
    );

    if (response.statusCode == 200) {
      return ActivityRecord.fromMap(response.data!);
    } else {
      return null;
    }
  }
}
