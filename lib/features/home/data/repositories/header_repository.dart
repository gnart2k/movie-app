import 'package:movie_app/features/home/data/models/header.dart';
import 'package:movie_app/features/home/data/sources/header_source.dart';

class HeaderRepository {
  final HeaderSource _headerSource;
  HeaderRepository(this._headerSource);
  Future<HeaderProps> getHeaderInfo() {
    return _headerSource.fetchHeaderInfo();
  }
}
