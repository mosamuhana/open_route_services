import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ReactiveCounter extends ReactiveFormField<int, int> {
  final int? min;
  final int? max;

  ReactiveCounter({
    Key? key,
    required String formControlName,
    this.min,
    this.max,
  }) : super(
            key: key,
            formControlName: formControlName,
            builder: (ReactiveFormFieldState<int, int> field) {
              return Counter(
                value: field.value!,
                min: min,
                max: max,
                onChange: field.didChange,
              );
            });

  @override
  ReactiveFormFieldState<int, int> createState() =>
      ReactiveFormFieldState<int, int>();
}

class Counter extends StatelessWidget {
  final int? min;
  final int? max;
  final int value;
  final ValueChanged<int> onChange;

  const Counter({
    Key? key,
    required this.value,
    this.min,
    this.max,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          icon: const Icon(Icons.chevron_left),
          //onPressed: onDecrementPressed, // call on decrement callback
          onPressed: !canDecrement ? null : onDecrement,
        ),
        Text(value.toString()),
        IconButton(
          icon: const Icon(Icons.chevron_right),
          //onPressed: onIncrementPressed, // call on increment callback
          onPressed: !canIncrement ? null : onIncrement,
        ),
      ],
    );
  }

  bool get canIncrement => max == null ? true : value < max!;
  bool get canDecrement => min == null ? true : value > min!;
  void onIncrement() => onChange(value + 1);
  void onDecrement() => onChange(value - 1);
}
