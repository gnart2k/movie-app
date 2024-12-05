import 'package:movie_app/features/support_page/data/models/support_form.dart';
import 'package:movie_app/features/support_page/data/sources/support_form_source.dart';

class SupportFormRepository {
  final SupportFormSource _supportFormSource;
  SupportFormRepository(this._supportFormSource);
  Future<SupportForm> getSupportForm() {
    return _supportFormSource.fetchSupportForm();
  }
}
