import 'dart:convert';

class ActivityRecordList {
  ActivityRecordList({
    this.data,
  });

  final List<ActivityRecord>? data;

  Map<String, dynamic> toMap() {
    return {
      'data': data?.map((x) => x.toMap()).toList(),
    };
  }

  factory ActivityRecordList.fromMap(Map<String, dynamic> map) {
    return ActivityRecordList(
      data: map['activities'] != null
          ? List<ActivityRecord>.from(
              map['activities']?.map((x) => ActivityRecord.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ActivityRecordList.fromJson(String source) =>
      ActivityRecordList.fromMap(json.decode(source));
}

class ActivityRecord {
  ActivityRecord({
    required this.id,
    required this.activityType,
    required this.institution,
    required this.when,
    required this.objective,
    required this.remarks,
  });

  final int id;
  final String activityType;
  final String institution;
  final DateTime when;
  final String objective;
  final String remarks;

  ActivityRecord copyWith({
    int? id,
    String? activityType,
    String? institution,
    DateTime? when,
    String? objective,
    String? remarks,
  }) {
    return ActivityRecord(
      id: id ?? this.id,
      activityType: activityType ?? this.activityType,
      institution: institution ?? this.institution,
      when: when ?? this.when,
      objective: objective ?? this.objective,
      remarks: remarks ?? this.remarks,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'activityType': activityType,
      'institution': institution,
      'when': when.toIso8601String(),
      'objective': objective,
      'remarks': remarks,
    };
  }

  factory ActivityRecord.fromMap(Map<String, dynamic> map) {
    return ActivityRecord(
      id: map['id']?.toInt() ?? 0,
      activityType: map['activityType'] ?? '',
      institution: map['institution'] ?? '',
      when: DateTime.parse(map['when']),
      objective: map['objective'] ?? '',
      remarks: map['remarks'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ActivityRecord.fromJson(String source) =>
      ActivityRecord.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ActivityRecord(id: $id, activityType: $activityType, institution: $institution, when: $when, objective: $objective, remarks: $remarks)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ActivityRecord &&
        other.id == id &&
        other.activityType == activityType &&
        other.institution == institution &&
        other.when == when &&
        other.objective == objective &&
        other.remarks == remarks;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        activityType.hashCode ^
        institution.hashCode ^
        when.hashCode ^
        objective.hashCode ^
        remarks.hashCode;
  }
}
