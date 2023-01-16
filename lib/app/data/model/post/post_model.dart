import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_model.freezed.dart';
part 'post_model.g.dart';

@freezed
class PostModel with _$PostModel {
  const factory PostModel({
    int? id,
    DateTime? date,
    DateTime? dateGmt,
    Guid? guid,
    DateTime? modified,
    DateTime? modifiedGmt,
    String? slug,
    StatusEnum? status,
    Type? type,
    String? link,
    Guid? title,
    Content? content,
    Content? excerpt,
    int? author,
    int? featuredMedia,
    Status? commentStatus,
    Status? pingStatus,
    bool? sticky,
    String? template,
    Format? format,
    List<dynamic>? meta,
    List<int?>? categories,
    List<int?>? tags,
    List<dynamic>? ystProminentWords,
    bool? ampEnabled,
    Links? links,
  }) = _PostModel;

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);
}

enum Status { open }

final statusValues = EnumValues({"open": Status.open});

@freezed
class Content with _$Content {
  const factory Content({
    String? rendered,
    bool? protected,
  }) = _Content;

  factory Content.fromJson(Map<String, dynamic> json) =>
      _$ContentFromJson(json);
}

enum Format { standard, video }

final formatValues =
    EnumValues({"standard": Format.standard, "video": Format.values});

@freezed
class Guid with _$Guid {
  const factory Guid({
    String? rendered,
  }) = _Guid;

  factory Guid.fromJson(Map<String, dynamic> json) => _$GuidFromJson(json);
}

@freezed
class Links with _$Links {
  const factory Links({
    List<About?>? self,
    List<About?>? collection,
    List<About?>? about,
    List<Author?>? author,
    List<Author?>? replies,
    List<VersionHistory?>? versionHistory,
    List<PredecessorVersion?>? predecessorVersion,
    List<About?>? wpAttachment,
    List<WpTerm?>? wpTerm,
    List<Cury?>? curies,
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
class Author with _$Author {
  const factory Author({
    bool? embeddable,
    String? href,
  }) = _Author;

  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);
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

enum Href { https_api_w_org_del }

final hrefValues =
    EnumValues({"https://api.w.org/{rel}": Href.https_api_w_org_del});

enum Name { wp }

final nameValues = EnumValues({"wp": Name.wp});

@freezed
class PredecessorVersion with _$PredecessorVersion {
  const factory PredecessorVersion({
    int? id,
    String? href,
  }) = _PredecessorVersion;

  factory PredecessorVersion.fromJson(Map<String, dynamic> json) =>
      _$PredecessorVersionFromJson(json);
}

@freezed
class VersionHistory with _$VersionHistory {
  const factory VersionHistory({
    int? count,
    String? href,
  }) = _VersionHistory;

  factory VersionHistory.fromJson(Map<String, dynamic> json) =>
      _$VersionHistoryFromJson(json);
}

@freezed
class WpTerm with _$WpTerm {
  const factory WpTerm({
    Taxonomy? taxonomy,
    bool? embeddable,
    String? href,
  }) = _WpTerm;

  factory WpTerm.fromJson(Map<String, dynamic> json) => _$WpTermFromJson(json);
}

enum Taxonomy { category, post_tag, yst_prominent_words }

final taxonomyValues = EnumValues({
  "category": Taxonomy.category,
  "post_tag": Taxonomy.post_tag,
  "yst_prominent_words": Taxonomy.yst_prominent_words
});

enum StatusEnum { publish }

final statusEnumValues = EnumValues({"publish": StatusEnum.publish});

enum Type { post }

final typeValues = EnumValues({"post": Type.post});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
