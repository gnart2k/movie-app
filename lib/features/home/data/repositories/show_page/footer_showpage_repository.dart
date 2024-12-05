import 'package:movie_app/features/home/data/models/show_page/footer_showpage.dart';
import 'package:movie_app/features/home/data/sources/show_page/footer_showpage_source.dart';

class FooterShowpageRepository {
  final FooterShowpageSource _source;
  FooterShowpageRepository(this._source);
  Future<FooterShowPage> getSource() {
    return _source.fetchFooter();
  }
}
