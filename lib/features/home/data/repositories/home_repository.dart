import 'package:movie_app/features/home/data/models/home_props.dart';
import 'package:movie_app/features/home/data/sources/home_source.dart';

class HomeRepository {
  final HomeSource _homeSource;
  HomeRepository(this._homeSource);

  Future<HomeProps> getHomeInfo() {
    return _homeSource.fetchHomeInfo();
  }
}
