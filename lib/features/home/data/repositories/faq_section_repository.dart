
import 'package:movie_app/features/home/data/models/faq_section.dart';
import 'package:movie_app/features/home/data/sources/faq_section_source.dart';

class FaqSectionRepository {
  final FaqSectionSource _faqSectionSource;
  FaqSectionRepository(this._faqSectionSource);
  Future<FaqSection> getFaqSection() {
    return _faqSectionSource.fetch();
  }
}
