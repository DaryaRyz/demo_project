class PostModels {
  static const _dataKey = "data";
  static const _titleKey = "title";
  static const _thumbnailKey = "thumbnail";
  //static const _createdKey = "created";
  static const _upsKey = "ups";
  static const _selftextKey = "selftext";

  final String title;
  final String? thumbnail;
  //final DateTime created;
  final int? ups;
  final String selftext;

  PostModels({
    required this.title,
    required this.thumbnail,
    //required this.created,
    required this.ups,
    required this.selftext,
  });

  PostModels.fromMap(Map<String, dynamic> map)
      : title = map[_dataKey][_titleKey] ?? '',
        thumbnail = map[_dataKey][_thumbnailKey],
        // created = DateTime.fromMillisecondsSinceEpoch(
        //   map[_dataKey][_createdKey] * 1000,
        // ),
        ups = map[_dataKey][_upsKey],
        selftext = map[_dataKey][_selftextKey] ?? '';
}
