import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:get_it/get_it.dart';
import 'package:trip_repository/trip_repository.dart';

part 'new_trip_state.dart';

class NewTripCubit extends Cubit<NewTripState> {
  final TripRepository _tripRepository;
  NewTripCubit()
      : _tripRepository = GetIt.I<TripRepository>(),
        super(NewTripState());

  void dateChanged(DateTime startAt, DateTime endAt) {
    final dateTrip = DateTrip(startAt, endAt);
    final date = Date.dirty(dateTrip);

    emit(state.copyWith(date: date, status: Formz.validate([date])));
  }

  Future<void> create() async {
    if (!state.status.isValidated) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));

    try {
      await _tripRepository.insert();
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } on Exception {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  nameChanged(String value) {
    final name = Name.dirty(value);

    emit(state.copyWith(
      name: name,
      status: Formz.validate([name]),
    ));
  }
}

enum DateTripValidationError { invalid }

class DateTrip {
  final DateTime? startAt;
  final DateTime? endAt;

  const DateTrip([this.startAt, this.endAt]);
}

class Date extends FormzInput<DateTrip, DateTripValidationError> {
  const Date.pure() : super.pure(const DateTrip());
  const Date.dirty([DateTrip dateTrip = const DateTrip()]) : super.dirty(dateTrip);

  @override
  DateTripValidationError? validator(DateTrip? value) {
    if (value == null) return null;
    if (value.startAt == null || value.endAt == null) return null;
    if (value.startAt!.isAfter(value.endAt!)) return DateTripValidationError.invalid;

    return null;
  }
}

enum NameValidationError { invalid }

class Name extends FormzInput<String, NameValidationError> {
  const Name.pure() : super.pure('');
  const Name.dirty([String value = '']) : super.dirty(value);

  @override
  NameValidationError? validator(String? value) {
    if (value == null) return null;

    return value.isNotEmpty ? null : NameValidationError.invalid;
  }
}
