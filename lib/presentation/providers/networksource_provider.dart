import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes_appv2/data/source_data/network_source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'networksource_provider.g.dart';
@riverpod
NetworkSource networkSource(Ref ref) {
  return NetworkSource(); // Instancia de NetworkSource
}