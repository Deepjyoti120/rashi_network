import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rashi_network/services/api/api_access.dart';

final futureGetBanner = FutureProvider(
  (ref) async {
    final apiService = ref.read(apiProvider);
    return apiService.getBanner();
  },
);
final futureLatestBlogs = FutureProvider(
  (ref) async {
    final apiService = ref.read(apiProvider);
    return apiService.latestBlogs();
  },
);
final futureastrologerList = FutureProvider(
  (ref) async {
    final apiService = ref.read(apiProvider);
    return apiService.astrologerList();
  },
);