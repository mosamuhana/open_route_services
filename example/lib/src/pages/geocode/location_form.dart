import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:open_route_services/open_route_services.dart';

const fractionDigits = 6;

class LocationForm extends StatelessWidget {
  final Future<void> Function(GeoLocation)? onSearch;

  LocationForm({Key? key, this.onSearch}) : super(key: key);

  final form = FormGroup({
    'lon': FormControl<double>(
      value: 34.30679,
      validators: [
        Validators.required,
        //Validators.number,
        Validators.min(-180.0),
        Validators.max(180.0),
      ],
    ),
    'lat': FormControl<double>(
      value: 31.323666,
      validators: [
        Validators.required,
        //Validators.number,
        Validators.min(-90.0),
        Validators.max(90.0),
      ],
    ),
  });

  void search() async {
    form.markAsDisabled();
    final value = form.value;
    print(value);
    //GeoLocation.fromMap(value);
    //final lon = (value['lon'] as dynamic)?.toDouble();
    //final lat = (value['lat'] as dynamic)?.toDouble();
    try {
      await onSearch!(GeoLocation.fromMap(value));
    } catch (e) {
      //...
    }
    form.markAsEnabled();
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formGroup: form,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    ReactiveTextField(
                      formControlName: 'lat',
                      decoration: const InputDecoration(hintText: "Latitude"),
                      valueAccessor:
                          DoubleValueAccessor(fractionDigits: fractionDigits),
                    ),
                    ReactiveTextField(
                      formControlName: 'lon',
                      decoration: const InputDecoration(hintText: "Longitude"),
                      valueAccessor:
                          DoubleValueAccessor(fractionDigits: fractionDigits),
                    ),
                  ],
                ),
              ),
              ReactiveFormConsumer(
                builder: (context, form, child) {
                  return IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: form.invalid || form.disabled || onSearch == null
                        ? null
                        : search,
                    splashRadius: 24,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
