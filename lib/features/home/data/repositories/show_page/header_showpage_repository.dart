import 'package:movie_app/features/home/data/models/header.dart';
import 'package:movie_app/features/home/data/sources/show_page/header_showpage_source.dart';

class HeaderShowPageRepository {
  final HeaderShowPageSource _headerSource;
  HeaderShowPageRepository(this._headerSource);
  Future<HeaderProps> getHeaderInfo() {
    return _headerSource.fetchHeaderInfo();
  }
}
