import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class AddressQueryForm extends StatelessWidget {
  final Future<void> Function(String)? onSearch;

  AddressQueryForm({Key? key, this.onSearch}) : super(key: key);

  final form = FormGroup({
    'address': FormControl<String>(
      validators: [
        Validators.required,
        Validators.minLength(3),
      ],
    ),
  });

  void search() async {
    form.markAsDisabled();
    try {
      await onSearch!(form.value['address'].toString());
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
                child: ReactiveTextField(
                  formControlName: 'address',
                  decoration: const InputDecoration(
                    hintText: "Enter an address",
                  ),
                ),
              ),
              ReactiveFormConsumer(
                builder: (context, form, child) {
                  return IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: form.invalid || form.disabled || onSearch == null ? null : search,
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
