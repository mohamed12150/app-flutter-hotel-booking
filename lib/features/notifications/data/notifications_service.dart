import 'dart:convert';
import 'package:http/http.dart' as http;

class NotificationsService {
  final String baseUrl;
  final http.Client _client;
  NotificationsService({required this.baseUrl, http.Client? client})
      : _client = client ?? http.Client();

  Future<int> fetchCount({required String userId}) async {
    final uri = Uri.parse('$baseUrl/notifications/count?userId=$userId');
    final res = await _client.get(uri);
    if (res.statusCode == 200) {
      final body = jsonDecode(res.body);
      final count = body['count'];
      if (count is int) return count;
    }
    return 0;
  }
}

