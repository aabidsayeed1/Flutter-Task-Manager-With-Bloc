import 'package:equatable/equatable.dart';
import 'package:task_app/blocs/bloc_exports.dart';

part 'switch_event.dart';
part 'switch_state.dart';

class SwitchBloc extends HydratedBloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(const SwitchInitial(switchValue: false)) {
    on<SwitchOnEvent>(_onSwitchOn);
    on<SwitchOffEvent>(_onSwitchOff);
  }

  void _onSwitchOn(SwitchOnEvent event, Emitter<SwitchState> emit) {
    emit(const SwitchState(switchValue: true));
  }

  void _onSwitchOff(SwitchOffEvent event, Emitter<SwitchState> emit) {
    emit(const SwitchState(switchValue: false));
  }

  @override
  SwitchState? fromJson(Map<String, dynamic> json) {
    return SwitchState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(SwitchState state) {
    return state.toMap();
  }
}
