part of 'new_trip_cubit.dart';

class NewTripState extends Equatable {
  const NewTripState({
    this.date = const Date.pure(),
    this.name = const Name.pure(),
    this.status = FormzStatus.pure,
  });

  final Date date;
  final Name name;
  final FormzStatus status;

  @override
  List<Object> get props => [date, name, status];

  NewTripState copyWith({
    Date? date,
    Name? name,
    FormzStatus? status,
  }) {
    return NewTripState(
      date: date ?? this.date,
      name: name ?? this.name,
      status: status ?? this.status,
    );
  }
}
