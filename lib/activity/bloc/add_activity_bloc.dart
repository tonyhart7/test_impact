import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_impact/activity/repository/activity_repository.dart';

part 'add_activity_event.dart';
part 'add_activity_state.dart';

class AddActivityBloc extends Bloc<AddActivityEvent, AddActivityState> {
  AddActivityBloc() : super(const AddActivityState()) {
    on<ActivityTypeChanged>(_onActivityTypeChanged);
    on<InstitutionChanged>(_onInstitutionChanged);
    on<DateChanged>(_onDateChanged);
    on<ObjectiveChanged>(_onObjectiveChanged);
    on<RemarksChanged>(_onRemarksChanged);
    on<ActivitySubmit>(_onSubmitted);
  }

  void _onActivityTypeChanged(
    ActivityTypeChanged event,
    Emitter<AddActivityState> emit,
  ) {
    emit(state.copyWith(activityType: event.activityType));
  }

  void _onInstitutionChanged(
    InstitutionChanged event,
    Emitter<AddActivityState> emit,
  ) {
    emit(state.copyWith(institution: event.institution));
  }

  void _onDateChanged(
    DateChanged event,
    Emitter<AddActivityState> emit,
  ) {
    emit(state.copyWith(when: event.date));
  }

  void _onObjectiveChanged(
    ObjectiveChanged event,
    Emitter<AddActivityState> emit,
  ) {
    emit(state.copyWith(objective: event.objective));
  }

  void _onRemarksChanged(
    RemarksChanged event,
    Emitter<AddActivityState> emit,
  ) {
    emit(state.copyWith(remarks: event.remarks));
  }

  Future _onSubmitted(
    ActivitySubmit event,
    Emitter<AddActivityState> emit,
  ) async {
    final response = await ActivityRepository().sendActivity(
      id: 12,
      activityType: state.activityType ?? 'Meeting',
      institution: state.institution ?? '',
      when: state.when ?? DateTime.now(),
      objective: state.objective ?? '',
      remarks: state.remarks ?? '',
    );

    emit(state.copyWith(message: response.toString()));
  }
}
