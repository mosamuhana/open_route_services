import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:open_route_services/open_route_services.dart';

import '../../nav.dart';

class LocationForm extends StatefulWidget {
  final Future<void> Function(GeoLocation)? onSearch;

  const LocationForm({Key? key, this.onSearch}) : super(key: key);

  @override
  State<LocationForm> createState() => _LocationFormState();
}

class _LocationFormState extends State<LocationForm> {
  final form = FormGroup({
    'lat': FormControl<double>(
      //value: 31.323666,
      validators: [
        Validators.required,
        //Validators.number,
        Validators.min(-90.0),
        Validators.max(90.0),
      ],
    ),
    'lon': FormControl<double>(
      //value: 34.30679,
      validators: [
        Validators.required,
        //Validators.number,
        Validators.min(-180.0),
        Validators.max(180.0),
      ],
    ),
  });

  void search() async {
    form.markAsDisabled();
    try {
      await widget.onSearch!(GeoLocation.fromMap(form.value));
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
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  children: [
                    ReactiveTextField<double>(
                      formControlName: 'lat',
                      decoration: const InputDecoration(hintText: "Latitude"),
                      valueAccessor: DoubleValueAccessor(fractionDigits: 6),
                      keyboardType: TextInputType.number,
                    ),
                    ReactiveTextField<double>(
                      formControlName: 'lon',
                      decoration: const InputDecoration(hintText: "Longitude"),
                      valueAccessor: DoubleValueAccessor(fractionDigits: 6),
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    ReactiveFormConsumer(
                      builder: (context, form, child) {
                        return IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: form.invalid || form.disabled || widget.onSearch == null ? null : search,
                          splashRadius: 24,
                        );
                      },
                    ),
                    const SizedBox(width: 10),
                    IconButton(
                      icon: const Icon(Icons.map),
                      splashRadius: 24,
                      onPressed: () async {
                        final p = await Nav.showSelectLocationPage(context);
                        if (p != null) {
                          form.updateValue({
                            'lon': p.longitude,
                            'lat': p.latitude,
                          });
                          setState(() {});
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
