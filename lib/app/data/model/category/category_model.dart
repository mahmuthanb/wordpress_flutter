import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
class CategoryModel with _$CategoryModel {
  const factory CategoryModel({
    int? id,
    int? count,
    String? description,
    String? link,
    String? name,
    String? slug,
    Taxonomy? taxonomy,
    int? parent,
    List<dynamic>? meta,
    Links? links,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}

@freezed
class Links with _$Links {
  const factory Links({
    List<About?>? self,
    List<About?>? collection,
    List<About?>? about,
    List<About?>? wpPostType,
    List<Cury?>? curies,
    List<Up?>? up,
  }) = _Links;

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);
}

@freezed
class About with _$About {
  const factory About({
    String? href,
  }) = _About;

  factory About.fromJson(Map<String, dynamic> json) => _$AboutFromJson(json);
}

@freezed
class Cury with _$Cury {
  const factory Cury({
    Name? name,
    Href? href,
    bool? templated,
  }) = _Cury;

  factory Cury.fromJson(Map<String, dynamic> json) => _$CuryFromJson(json);
}

enum Href { httpsApiWOrgRel }

final hrefValues =
    EnumValues({"https://api.w.org/{rel}": Href.httpsApiWOrgRel});

enum Name { wp }

final nameValues = EnumValues({"wp": Name.wp});

@freezed
class Up with _$Up {
  const factory Up({
    bool? embeddable,
    String? href,
  }) = _Up;

  factory Up.fromJson(Map<String, dynamic> json) => _$UpFromJson(json);
}

enum Taxonomy { category }

final taxonomyValues = EnumValues({"category": Taxonomy.category});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
