import 'package:flutter/material.dart';

/// Maps a stable string key (stored in `categories.icon`) to a Material
/// icon, so the DB never stores an IconData codepoint directly (those can
/// shift between Flutter/Material versions).
const Map<String, IconData> kIconCatalog = {
  'home_repair_service': Icons.home_repair_service,
  'directions_car': Icons.directions_car,
  'self_improvement': Icons.self_improvement,
  'payments': Icons.payments,
  'work': Icons.work,
  'favorite': Icons.favorite,
  'hiking': Icons.hiking,
  'home': Icons.home,
  'apartment': Icons.apartment,
  'plumbing': Icons.plumbing,
  'electrical_services': Icons.electrical_services,
  'ac_unit': Icons.ac_unit,
  'local_laundry_service': Icons.local_laundry_service,
  'water_drop': Icons.water_drop,
  'motorcycle': Icons.motorcycle,
  'directions_bus': Icons.directions_bus,
  'local_gas_station': Icons.local_gas_station,
  'build': Icons.build,
  'car_repair': Icons.car_repair,
  'family_restroom': Icons.family_restroom,
  'church': Icons.church,
  'celebration': Icons.celebration,
  'cake': Icons.cake,
  'account_balance': Icons.account_balance,
  'account_balance_wallet': Icons.account_balance_wallet,
  'credit_card': Icons.credit_card,
  'savings': Icons.savings,
  'receipt_long': Icons.receipt_long,
  'business_center': Icons.business_center,
  'laptop': Icons.laptop,
  'meeting_room': Icons.meeting_room,
  'school': Icons.school,
  'child_care': Icons.child_care,
  'sports_esports': Icons.sports_esports,
  'restaurant': Icons.restaurant,
  'beach_access': Icons.beach_access,
  'flight': Icons.flight,
  'luggage': Icons.luggage,
  'park': Icons.park,
  'pets': Icons.pets,
  'medical_services': Icons.medical_services,
  'vaccines': Icons.vaccines,
  'fitness_center': Icons.fitness_center,
  'shopping_cart': Icons.shopping_cart,
  'event': Icons.event,
  'notifications': Icons.notifications,
  'star': Icons.star,
};

IconData resolveCategoryIcon(String key) {
  return kIconCatalog[key] ?? Icons.label;
}
