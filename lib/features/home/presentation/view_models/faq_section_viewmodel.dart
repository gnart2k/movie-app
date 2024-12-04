import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/features/home/data/models/faq_section.dart';
import 'package:movie_app/features/home/data/repositories/faq_section_repository.dart';
import 'package:movie_app/features/home/data/sources/faq_section_source.dart';

class FaqSectionViewModel extends StateNotifier<FaqSection> {
  final FaqSectionRepository _repository;

  FaqSectionViewModel(this._repository)
      : super(FaqSection(title: '', questions: []));

  Future<void> getFaqSection() async {
    try {
      final fagSection = await _repository.getFaqSection();
      state = fagSection;
    } catch (e) {
      state = FaqSection(title: '', questions: []);
    }
  }
}

final faqSectionSourceProvider = Provider((ref) => FaqSectionSource());
final faqSectionRepositoryProvider = Provider(
  (ref) => FaqSectionRepository(ref.read(faqSectionSourceProvider)),
);
final faqSectionViewModelProvider =
    StateNotifierProvider<FaqSectionViewModel, FaqSection>(
  (ref) => FaqSectionViewModel(ref.read(faqSectionRepositoryProvider)),
);

