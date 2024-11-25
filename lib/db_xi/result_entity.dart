class ResultEntity {
  String name;
  String resultFirst;
  String resultSecond;
  String resultThird;
  String resultFourth;

  ResultEntity({
    this.name = '',
    this.resultFirst = '',
    this.resultSecond = '',
    this.resultThird = '',
    this.resultFourth = '',
  });

  factory ResultEntity.fromJson(Map<String, dynamic> json) {
    return ResultEntity(
      name: json['name'],
      resultFirst: json['resultFirst'],
      resultSecond: json['resultSecond'],
      resultThird: json['resultThird'],
      resultFourth: json['resultFourth'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'resultFirst': resultFirst,
      'resultSecond': resultSecond,
      'resultThird': resultThird,
      'resultFourth': resultFourth,
    };
  }


}