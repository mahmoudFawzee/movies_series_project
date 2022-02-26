class Film {
  final int id;
  final List<String> type;
  final String name;
  final String cover;
  final String url;
  final String hint;
  const Film({
    required this.id,
    required this.type,
    required this.name,
    required this.hint,
    required this.cover,
    required this.url,
  });
}
