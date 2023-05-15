class Covid {
  final List loc;

  Covid({
    required this.loc,
  });

  factory Covid.fromjson({required Map json}) {
    return Covid(
      loc: json['data']['regional'],
    );
  }
}
