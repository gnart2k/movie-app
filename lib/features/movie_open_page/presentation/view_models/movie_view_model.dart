import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/features/movie_open_page/data/models/movie_props.dart';
import 'package:movie_app/features/movie_open_page/data/repositories/movie_repository.dart';
import 'package:movie_app/features/movie_open_page/data/sources/movie_sources.dart';

class MovieViewModel extends StateNotifier<MovieProps> {
  final MovieRepository _repository;

  MovieViewModel(this._repository)
      : super(
          MovieProps(
            header: HeaderProps(logo: '', menuIcon: false),
            movieSection: MovieSectionProps(
              title: '',
              buttons: [],
              description: '',
              details: DetailsProps(
                releaseYear: 0,
                availableLanguages: [],
                ratings: RatingsProps(imdb: 0.0, streamVibe: 0.0),
                genres: [],
                director: '',
                music: '',
              ),
            ),
            castSection: CastSectionProps(title: '', castMembers: []),
            reviewsSection: ReviewsSectionProps(title: '', reviews: []),
            callToAction: CallToActionProps(text: '', button: ''),
            footer: FooterProps(
              navigationLinks: [],
              legalLinks: [],
              copyright: '',
            ),
          ),
        ) {
    _initialize();
  }

  Future<void> _initialize() async {
    try {
      final movieInfo = await _repository.getMovieInfo();
      state = movieInfo;
    } catch (e) {
      state = MovieProps(
        header: HeaderProps(logo: '', menuIcon: false),
        movieSection: MovieSectionProps(
          title: '',
          buttons: [],
          description: '',
          details: DetailsProps(
            releaseYear: 0,
            availableLanguages: [],
            ratings: RatingsProps(imdb: 0.0, streamVibe: 0.0),
            genres: [],
            director: '',
            music: '',
          ),
        ),
        castSection: CastSectionProps(title: '', castMembers: []),
        reviewsSection: ReviewsSectionProps(title: '', reviews: []),
        callToAction: CallToActionProps(text: '', button: ''),
        footer: FooterProps(
          navigationLinks: [],
          legalLinks: [],
          copyright: '',
        ),
      );
    }
  }
}

final movieSourceProvider = Provider((ref) => MovieSource());
final movieRepositoryProvider = Provider(
  (ref) => MovieRepository(ref.read(movieSourceProvider)),
);
final movieViewModelProvider =
    StateNotifierProvider<MovieViewModel, MovieProps>(
  (ref) => MovieViewModel(ref.read(movieRepositoryProvider)),
);

