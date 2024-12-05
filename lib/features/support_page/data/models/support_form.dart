class SupportForm {
  final String welcomeMessage;
  final String welcomeMessage1;
  final FormFields form;

  SupportForm(
      {required this.welcomeMessage,
      required this.welcomeMessage1,
      required this.form});

  factory SupportForm.fromJson(Map<String, dynamic> json) {
    return SupportForm(
      welcomeMessage: json['welcomeMessage'],
      welcomeMessage1: json['welcomeMessage1'],
      form: FormFields.fromJson(json['form']),
    );
  }
}

class FormFields {
  final List<FormField> fields;
  final Checkbox checkbox;
  final SubmitButton submitButton;

  FormFields({
    required this.fields,
    required this.checkbox,
    required this.submitButton,
  });

  factory FormFields.fromJson(Map<String, dynamic> json) {
    var list = json['fields'] as List;
    List<FormField> fieldsList =
        list.map((i) => FormField.fromJson(i)).toList();
    return FormFields(
      fields: fieldsList,
      checkbox: Checkbox.fromJson(json['checkbox']),
      submitButton: SubmitButton.fromJson(json['submitButton']),
    );
  }
}

class FormField {
  final String label;
  final String type;
  final String placeholder;
  final String? countryCode;

  FormField({
    required this.label,
    required this.type,
    required this.placeholder,
    this.countryCode,
  });

  factory FormField.fromJson(Map<String, dynamic> json) {
    return FormField(
      label: json['label'],
      type: json['type'],
      placeholder: json['placeholder'],
      countryCode: json['countryCode'],
    );
  }
}

class Checkbox {
  final String label;
  final String name;

  Checkbox({required this.label, required this.name});

  factory Checkbox.fromJson(Map<String, dynamic> json) {
    return Checkbox(
      label: json['label'],
      name: json['name'],
    );
  }
}

class SubmitButton {
  final String text;
  final String action;

  SubmitButton({required this.text, required this.action});

  factory SubmitButton.fromJson(Map<String, dynamic> json) {
    return SubmitButton(
      text: json['text'],
      action: json['action'],
    );
  }
}
