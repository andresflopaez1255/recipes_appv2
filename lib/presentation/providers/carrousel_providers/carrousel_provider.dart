import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'carrousel_provider.g.dart';

@riverpod
class CarouselProvider extends _$CarouselProvider {
  @override
  int build() => 0;

  void setPage(int page) {
    state = page;
  }
}