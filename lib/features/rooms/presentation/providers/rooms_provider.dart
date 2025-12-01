import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hotel_booking/utils/data.dart' as data;

class RoomsState {
  final String? filterCity;
  final List<dynamic> featured;
  final List<dynamic> recommended;
  const RoomsState({
    this.filterCity,
    required this.featured,
    required this.recommended,
  });

  RoomsState copyWith({String? filterCity, List<dynamic>? featured, List<dynamic>? recommended}) {
    return RoomsState(
      filterCity: filterCity ?? this.filterCity,
      featured: featured ?? this.featured,
      recommended: recommended ?? this.recommended,
    );
  }

  List<dynamic> get featuredFiltered => filterCity == null
      ? featured
      : featured.where((e) => (e["location"] as String?) == filterCity).toList();

  List<dynamic> get recommendedFiltered => filterCity == null
      ? recommended
      : recommended.where((e) => (e["location"] as String?) == filterCity).toList();
}

class RoomsNotifier extends StateNotifier<RoomsState> {
  RoomsNotifier()
      : super(RoomsState(
          featured: List<dynamic>.from(data.features),
          recommended: List<dynamic>.from(data.recommends),
        ));

  void setFilterCity(String? cityName) {
    state = state.copyWith(filterCity: cityName);
  }
}

final roomsProvider = StateNotifierProvider<RoomsNotifier, RoomsState>((ref) {
  return RoomsNotifier();
});

