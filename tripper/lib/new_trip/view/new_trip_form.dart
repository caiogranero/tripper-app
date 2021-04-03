import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:tripper/components/main_button.dart';
import 'package:tripper/components/text_field_generic.dart';
import 'package:tripper/new_trip/cubit/new_trip_cubit.dart';
import 'package:formz/formz.dart';
import 'package:tripper/theme.dart';

const double kHorizontalPadding = 20;
const double kSpaceBetweenFields = 15.0;
const double kTopPadding = 30;

class NewTripForm extends StatelessWidget {
  const NewTripForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<NewTripCubit, NewTripState>(
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Authentication Failure')),
            );
        }
      },
      child: Align(
        alignment: const Alignment(0, -1 / 3),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding, vertical: kTopPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 48.0 + kSpaceBetweenFields),
                      _DateInput(),
                      const SizedBox(height: kSpaceBetweenFields),
                      _TripNameInput(),
                      _TravelWith(),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding, vertical: kTopPadding),
                  child: _CreateButton(),
                ),
              ],
            ),
            DestinyInput(),
          ],
        ),
      ),
    );
  }
}

class DestinyInput extends StatelessWidget {
  const DestinyInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildFloatingSearchBar(context);
  }

  Widget buildFloatingSearchBar(BuildContext context) {
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return FloatingSearchBar(
      hint: 'I want to go to...',
      iconColor: Colors.red,
      margins: EdgeInsets.only(
        right: kHorizontalPadding,
        left: kHorizontalPadding,
        top: kTopPadding,
      ),
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
      transitionDuration: const Duration(milliseconds: 500),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      axisAlignment: isPortrait ? 0.0 : -1.0,
      openAxisAlignment: 0.0,
      width: isPortrait ? 600 : 500,
      debounceDelay: const Duration(milliseconds: 500),
      onQueryChanged: (query) {
        print(query);
        // Call your model, bloc, controller here.
      },
      // Specify a custom transition to be used for
      // animating between opened and closed stated.
      transition: CircularFloatingSearchBarTransition(),
      actions: [],
      leadingActions: [
        InkWell(
          child: Icon(
            Icons.place_outlined,
            color: Colors.black,
          ),
        )
      ],
      automaticallyImplyDrawerHamburger: false,
      automaticallyImplyBackButton: false,
      builder: (context, transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Material(
            color: Colors.white,
            elevation: 4.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: Colors.accents.map((color) {
                return Container(height: 112, color: color);
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}

class _DateInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewTripCubit, NewTripState>(
      buildWhen: (previous, current) => previous.date != current.date,
      builder: (context, state) {
        return TextField(
          focusNode: AlwaysDisabledFocusNode(),
          decoration: InputDecoration(
            labelText: _getLabel(state.date),
            prefixIcon: Icon(Icons.date_range, color: Colors.black),
            labelStyle: TextStyle(
              color: _dateSelected(state.date) ? Colors.black : Colors.black54,
              fontWeight: _dateSelected(state.date) ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
          onTap: () async {
            DateTimeRange? picked = await showDateRangePicker(
                context: context,
                firstDate: DateTime(DateTime.now().year - 5),
                lastDate: DateTime(DateTime.now().year + 5),
                initialDateRange: DateTimeRange(
                  end: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 13),
                  start: DateTime.now(),
                ));

            if (picked != null) {
              context.read<NewTripCubit>().dateChanged(picked.start, picked.end);
            }
            print(picked);
          },
        );
      },
    );
  }

  bool _dateSelected(Date date) => (date.status == FormzInputStatus.valid);

  String _getLabel(Date date) {
    if (!_dateSelected(date)) return "Data da viagem";
    var value = DateTimeRange(start: date.value.startAt!, end: date.value.endAt!);
    var dateFormat = _getDateFormat(date);

    return "${dateFormat.format(value.start)} - ${dateFormat.format(value.end)}";
  }

  DateTimeRange _getInitialValue(Date date) {
    return date.status != FormzInputStatus.valid
        ? DateTimeRange(start: DateTime.now(), end: DateTime.now().add(Duration(days: 5)))
        : DateTimeRange(start: date.value.startAt!, end: date.value.endAt!);
  }

  DateFormat _getDateFormat(Date date) {
    var dateRange = _getInitialValue(date);
    var currentYear = DateTime.now().year;

    if (dateRange.start.year > currentYear || dateRange.end.year > currentYear) return DateFormat('dd \'de\' MMM \'de\' yyyy');

    return DateFormat('dd \'de\' MMM');
  }
}

class _TripNameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewTripCubit, NewTripState>(
      buildWhen: (previous, current) => previous.name != current.name,
      builder: (context, state) {
        return TextFieldGeneric(
          key: const Key('loginForm_emailInput_textField'),
          onChanged: (name) => context.read<NewTripCubit>().nameChanged(name),
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            labelText: 'Trip Name',
            helperText: '',
            errorText: state.name.invalid ? 'invalid name' : null,
          ),
        );
      },
    );
  }
}

class _CreateButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewTripCubit, NewTripState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : MainButton(
                label: 'START MY TRIP',
                onPressed: state.status.isValidated ? () => context.read<NewTripCubit>().create() : null,
              );
      },
    );
  }
}

class _TravelWith extends StatelessWidget {
  const _TravelWith({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("Travel with?"),
          CustomToggleButtons(
            childrens: [
              Text("Solo"),
              Text("Party"),
            ],
          )
        ],
      ),
    );
  }
}

class CustomToggleButtons extends StatefulWidget {
  final List<Text> childrens;
  const CustomToggleButtons({Key? key, required this.childrens}) : super(key: key);

  @override
  _CustomToggleButtonsState createState() => _CustomToggleButtonsState();
}

class _CustomToggleButtonsState extends State<CustomToggleButtons> {
  int selected = 0;

  @override
  void initState() {
    this.selected = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var tt = List<Widget>.generate(widget.childrens.length, (index) {
      return CustomToggleButton(
        size: widget.childrens.length,
        index: index,
        selected: selected == index,
        children: widget.childrens[index],
        onPressed: () {
          setState(() {
            this.selected = index;
          });
        },
      );
    });

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: tt,
    );
  }
}

class CustomToggleButton extends StatelessWidget {
  final Text children;
  final void Function() onPressed;
  final bool selected;
  final int index;
  final int size;

  const CustomToggleButton({
    Key? key,
    required this.size,
    required this.index,
    required this.children,
    required this.onPressed,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        child: Container(
          padding: EdgeInsets.only(
            left: isFirst(index) ? 0 : 5,
            right: isLast(index) ? 0 : 5,
          ),
          child: OutlinedButton(
            child: children,
            onPressed: onPressed,
            style: OutlinedButton.styleFrom(
              backgroundColor: _getBackgroundColor(),
              primary: _getTextColor(),
              side: BorderSide(color: _getBorderColor(), width: 0.75),
            ),
          ),
        ),
      ),
    );
  }

  bool isLast(int index) => index == size - 1;
  bool isFirst(int index) => index == 0;

  Color _getBackgroundColor() {
    return this.selected ? CustomColors.mainColorSoft : Colors.white;
  }

  Color _getTextColor() {
    return this.selected ? Colors.white : Colors.black;
  }

  Color _getBorderColor() {
    return !this.selected ? CustomColors.mainColorSoft : Colors.white;
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
