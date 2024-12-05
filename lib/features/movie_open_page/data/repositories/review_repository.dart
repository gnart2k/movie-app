import 'package:movie_app/features/movie_open_page/data/models/review_container.dart';
import 'package:movie_app/features/movie_open_page/data/sources/review_source.dart';

class ReviewRepository {
  final ReviewSource _reviewSource;
  ReviewRepository(this._reviewSource);
  Future<ReviewSection> getReviewSection() {
    return _reviewSource.fetchReviewSection();
  }
}
