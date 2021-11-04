import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
// this is the packages of the example where the ReactiveCounter widget resides
import 'reactive_counter.widget.dart';

class CounterPage extends StatelessWidget {
  static const route = '/counter';

  CounterPage({Key? key}) : super(key: key);

  final form = FormGroup({
    'counter': FormControl<int>(value: 0),
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ReactiveForm(
          formGroup: form,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // this is another widget that visualize the value of counter
              ReactiveValueListenableBuilder<int>(
                formControlName: 'counter',
                builder: (context, control, child) => Text('${control.value}'),
              ),
              // this is our new reactive widget ;)
              ReactiveCounter(
                formControlName: 'counter',
                min: 0,
                max: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
