import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shinobi_statement/service/supabase/supabase.dart';

final characterProvider = FutureProvider<List<Map<String, dynamic>>>((
  ref,
) async {
  final characters = await fetchCharacters();
  return characters as List<Map<String, dynamic>>;
});
