import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/features/movie_open_page/data/models/review_container.dart';
import 'package:movie_app/features/movie_open_page/data/repositories/review_repository.dart';
import 'package:movie_app/features/movie_open_page/data/sources/review_source.dart';

class ReviewViewModel extends StateNotifier<ReviewSection> {
  final ReviewRepository _repository;

  ReviewViewModel(this._repository)
      : super(ReviewSection(title: '', reviews: []));

  Future<void> fetchReviewSection() async {
    try {
      final supportForm = await _repository.getReviewSection();
      state = supportForm;
    } catch (e) {
      state = ReviewSection(title: '', reviews: []);
    }
  }
}

final reviewSectionSourceProvider = Provider((ref) => ReviewSource());

final reviewSectionRepositoryProvider = Provider(
  (ref) => ReviewRepository(ref.read(reviewSectionSourceProvider)),
);

final reviewSectionViewModelProvider =
    StateNotifierProvider<ReviewViewModel, ReviewSection>(
  (ref) => ReviewViewModel(ref.read(reviewSectionRepositoryProvider)),
);
