// ignore: public_member_api_docs
class LanguageName {
  // ignore: public_member_api_docs
  LanguageName({this.code, this.name});

  LanguageName.fromJson(Map<String, dynamic> json) {
    code = json['code'] as String?;
    name = json['name'] as String?;
  }
  String? code;
  String? name;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['code'] = code;
    data['name'] = name;
    return data;
  }
}
