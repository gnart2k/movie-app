import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/support_form.dart';
import '../../data/repositories/support_form_repository.dart';
import '../../data/sources/support_form_source.dart';

class SupportFormViewModel extends StateNotifier<SupportForm> {
  final SupportFormRepository _repository;

  SupportFormViewModel(this._repository)
      : super(SupportForm(
            welcomeMessage: '',
            form: FormFields(
                fields: [],
                checkbox: Checkbox(label: '', name: ''),
                submitButton: SubmitButton(text: '', action: '')),
            welcomeMessage1: ''));

  Future<void> fetchSupportForm() async {
    try {
      final supportForm = await _repository.getSupportForm();
      state = supportForm;
    } catch (e) {
      state = SupportForm(
          welcomeMessage: '',
          form: FormFields(
              fields: [],
              checkbox: Checkbox(label: '', name: ''),
              submitButton: SubmitButton(text: '', action: '')),
          welcomeMessage1: '');
    }
  }
}

final supportFormSourceProvider = Provider((ref) => SupportFormSource());

final supportFormRepositoryProvider = Provider(
  (ref) => SupportFormRepository(ref.read(supportFormSourceProvider)),
);

final supportFormViewModelProvider =
    StateNotifierProvider<SupportFormViewModel, SupportForm>(
  (ref) => SupportFormViewModel(ref.read(supportFormRepositoryProvider)),
);
