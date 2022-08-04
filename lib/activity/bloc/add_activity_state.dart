part of 'add_activity_bloc.dart';

class AddActivityState extends Equatable {
  const AddActivityState({
    this.message,
    this.activityType,
    this.institution,
    this.when,
    this.objective,
    this.remarks,
  });

  final String? message;
  final String? activityType;
  final String? institution;
  final DateTime? when;
  final String? objective;
  final String? remarks;

  AddActivityState copyWith({
    String? message,
    String? activityType,
    String? institution,
    DateTime? when,
    String? objective,
    String? remarks,
  }) {
    return AddActivityState(
      message: message ?? this.message,
      activityType: activityType ?? this.activityType,
      institution: institution ?? this.institution,
      when: when ?? this.when,
      objective: objective ?? this.objective,
      remarks: remarks ?? this.remarks,
    );
  }

  @override
  List<Object?> get props =>
      [message, activityType, institution, when, objective, remarks];
}
