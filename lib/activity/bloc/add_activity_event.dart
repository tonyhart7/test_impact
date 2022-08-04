part of 'add_activity_bloc.dart';

class AddActivityEvent extends Equatable {
  const AddActivityEvent();

  @override
  List<Object> get props => [];
}

class ActivityTypeChanged extends AddActivityEvent {
  const ActivityTypeChanged(this.activityType);

  final String activityType;

  @override
  List<Object> get props => [activityType];
}

class InstitutionChanged extends AddActivityEvent {
  const InstitutionChanged(this.institution);

  final String institution;

  @override
  List<Object> get props => [institution];
}

class DateChanged extends AddActivityEvent {
  const DateChanged(this.date);

  final DateTime date;

  @override
  List<Object> get props => [date];
}

class ObjectiveChanged extends AddActivityEvent {
  const ObjectiveChanged(this.objective);

  final String objective;

  @override
  List<Object> get props => [objective];
}

class RemarksChanged extends AddActivityEvent {
  const RemarksChanged(this.remarks);

  final String remarks;

  @override
  List<Object> get props => [remarks];
}

class ActivitySubmit extends AddActivityEvent {
  const ActivitySubmit();
}
