import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hotel_booking/features/notifications/data/notifications_service.dart';

final notificationsServiceProvider = Provider<NotificationsService>((ref) {
  return NotificationsService(baseUrl: 'http://localhost:3000/api');
});

class NotificationsNotifier extends StateNotifier<int> {
  final NotificationsService _service;
  NotificationsNotifier(this._service) : super(0);

  Future<void> refresh({required String userId}) async {
    final count = await _service.fetchCount(userId: userId);
    state = count;
  }
}

final notificationsProvider = StateNotifierProvider<NotificationsNotifier, int>((ref) {
  final service = ref.watch(notificationsServiceProvider);
  final notifier = NotificationsNotifier(service);
  notifier.refresh(userId: '1');
  return notifier;
});

