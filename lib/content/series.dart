class MyAllSeries {
  final List<ASerie> mySeries;
  const MyAllSeries({required this.mySeries});
}

class ASerie {
  final String name;
  final String cover;
  final List<Season> seasons;
  const ASerie(
      {required this.name, required this.cover, required this.seasons});
}

class Season {
  final String name;
  final String cover;
  final int season;
  final String url;
  final List<EposidInfo> eposids;
  const Season(
      {required this.name,
      required this.cover,
      required this.season,
      required this.url,
      required this.eposids});
}

class MySerie {
  final int id;
  final String name;
  final List<String> type;
  final String cover;
  final String hint;
  MySerie(
      {required this.id,
      required this.name,
      required this.type,
      required this.cover,
      required this.hint});
}

class EposidInfo {
  final int numberOfEposid;

  const EposidInfo({
    required this.numberOfEposid,
  });
}
