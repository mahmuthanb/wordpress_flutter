import 'dart:convert';

List<PostModel> postFromJson(String str) => List<PostModel>.from(json.decode(str).map((x) => PostModel.fromJson(x)));
String postToJson(List<PostModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostModel {
  PostModel({
    id,
    date,
    dateGmt,
    guid,
    modified,
    modifiedGmt,
    slug,
    status,
    type,
    link,
    title,
    content,
    excerpt,
    author,
    featuredMedia,
    commentStatus,
    pingStatus,
    sticky,
    template,
    format,
    meta,
    categories,
    tags,
    ystProminentWords,
    ampEnabled,
    links,
  });

  int? id;
  DateTime? date;
  DateTime? dateGmt;
  Guid? guid;
  DateTime? modified;
  DateTime? modifiedGmt;
  String? slug;
  String? status;
  String? type;
  String? link;
  Guid? title;
  Content? content;
  Content? excerpt;
  int? author;
  int? featuredMedia;
  String? commentStatus;
  String? pingStatus;
  bool? sticky;
  String? template;
  String? format;
  List<dynamic>? meta;
  List<int>? categories;
  List<int>? tags;
  List<dynamic>? ystProminentWords;
  bool? ampEnabled;
  Links? links;

  PostModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    date = DateTime.parse(json["date"]);
    dateGmt = DateTime.parse(json["date_gmt"]);
    guid = Guid.fromJson(json["guid"]);
    modified = DateTime.parse(json["modified"]);
    modifiedGmt = DateTime.parse(json["modified_gmt"]);
    slug = json["slug"];
    status = json["status"];
    type = json["type"];
    link = json["link"];
    title = Guid.fromJson(json["title"]);
    content = Content.fromJson(json["content"]);
    excerpt = Content.fromJson(json["excerpt"]);
    author = json["author"];
    featuredMedia = json["featured_media"];
    commentStatus = json["comment_status"];
    pingStatus = json["ping_status"];
    sticky = json["sticky"];
    template = json["template"];
    format = json["format"];
    meta = List<dynamic>.from(json["meta"].map((x) => x));
    categories = List<int>.from(json["categories"].map((x) => x));
    tags = List<int>.from(json["tags"].map((x) => x));
    ystProminentWords = List<dynamic>.from(json["yst_prominent_words"].map((x) => x));
    ampEnabled = json["amp_enabled"];
    // links: Links.fromJson(json["_links"]),
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date!.toIso8601String(),
        "date_gmt": dateGmt!.toIso8601String(),
        "guid": guid!.toJson(),
        "modified": modified!.toIso8601String(),
        "modified_gmt": modifiedGmt!.toIso8601String(),
        "slug": slug,
        "status": status,
        "type": type,
        "link": link,
        "title": title!.toJson(),
        "content": content!.toJson(),
        "excerpt": excerpt!.toJson(),
        "author": author,
        "featured_media": featuredMedia,
        "comment_status": commentStatus,
        "ping_status": pingStatus,
        "sticky": sticky,
        "template": template,
        "format": format,
        "meta": List<dynamic>.from(meta!.map((x) => x)),
        "categories": List<dynamic>.from(categories!.map((x) => x)),
        "tags": List<dynamic>.from(tags!.map((x) => x)),
        "yst_prominent_words": List<dynamic>.from(ystProminentWords!.map((x) => x)),
        "amp_enabled": ampEnabled,
        // "_links": links!.toJson(),
      };
}

// enum Status { OPEN }

// final statusValues = EnumValues({"open": Status.OPEN});

class Content {
  Content({
    rendered,
    protected,
  });

  String? rendered;
  bool? protected;

  Content.fromJson(Map<String, dynamic> json) {
    rendered = json["rendered"];
    protected = json["protected"];
  }

  Map<String, dynamic> toJson() => {
        "rendered": rendered,
        "protected": protected,
      };
}

// enum Format { STANDARD, VIDEO }
// final formatValues = EnumValues({"standard": Format.STANDARD, "video": Format.VIDEO});

class Guid {
  Guid({
    rendered,
  });

  String? rendered;

  Guid.fromJson(Map<String, dynamic> json) {
    rendered = json["rendered"];
  }

  Map<String, dynamic> toJson() => {
        "rendered": rendered,
      };
}

class Links {
  Links({
    self,
    collection,
    about,
    author,
    replies,
    versionHistory,
    predecessorVersion,
    wpAttachment,
    wpTerm,
    curies,
  });

  List<About>? self;
  List<About>? collection;
  List<About>? about;
  List<Author>? author;
  List<Author>? replies;
  List<VersionHistory>? versionHistory;
  List<PredecessorVersion>? predecessorVersion;
  List<About>? wpAttachment;
  List<WpTerm>? wpTerm;
  List<Cury>? curies;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: List<About>.from(json["self"].map((x) => About.fromJson(x))),
        collection: List<About>.from(json["collection"].map((x) => About.fromJson(x))),
        about: List<About>.from(json["about"].map((x) => About.fromJson(x))),
        author: List<Author>.from(json["author"].map((x) => Author.fromJson(x))),
        replies: List<Author>.from(json["replies"].map((x) => Author.fromJson(x))),
        versionHistory: List<VersionHistory>.from(json["version-history"].map((x) => VersionHistory.fromJson(x))),
        predecessorVersion: json["predecessor-version"] == null
            ? null
            : List<PredecessorVersion>.from(json["predecessor-version"].map((x) => PredecessorVersion.fromJson(x))),
        wpAttachment: List<About>.from(json["wp:attachment"].map((x) => About.fromJson(x))),
        wpTerm: List<WpTerm>.from(json["wp:term"].map((x) => WpTerm.fromJson(x))),
        curies: List<Cury>.from(json["curies"].map((x) => Cury.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "self": List<dynamic>.from(self!.map((x) => x.toJson())),
        "collection": List<dynamic>.from(collection!.map((x) => x.toJson())),
        "about": List<dynamic>.from(about!.map((x) => x.toJson())),
        "author": List<dynamic>.from(author!.map((x) => x.toJson())),
        "replies": List<dynamic>.from(replies!.map((x) => x.toJson())),
        "version-history": List<dynamic>.from(versionHistory!.map((x) => x.toJson())),
        "predecessor-version":
            predecessorVersion == null ? null : List<dynamic>.from(predecessorVersion!.map((x) => x.toJson())),
        "wp:attachment": List<dynamic>.from(wpAttachment!.map((x) => x.toJson())),
        "wp:term": List<dynamic>.from(wpTerm!.map((x) => x.toJson())),
        "curies": List<dynamic>.from(curies!.map((x) => x.toJson())),
      };
}

class About {
  About({
    href,
  });

  String? href;

  factory About.fromJson(Map<String, dynamic> json) => About(
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "href": href,
      };
}

class Author {
  Author({
    embeddable,
    href,
  });

  bool? embeddable;
  String? href;

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        embeddable: json["embeddable"],
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "embeddable": embeddable,
        "href": href,
      };
}

class Cury {
  Cury({
    name,
    href,
    templated,
  });

  String? name;
  String? href;
  bool? templated;

  factory Cury.fromJson(Map<String, dynamic> json) => Cury(
        name: json["name"],
        href: json["href"],
        templated: json["templated"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "href": href,
        "templated": templated,
      };
}

// enum Href { HTTPS_API_W_ORG_REL }
// final hrefValues = EnumValues({"https://api.w.org/{rel}": Href.HTTPS_API_W_ORG_REL});

// enum Name { WP }
// final nameValues = EnumValues({"wp": Name.WP});

class PredecessorVersion {
  PredecessorVersion({
    id,
    href,
  });

  int? id;
  String? href;

  factory PredecessorVersion.fromJson(Map<String, dynamic> json) => PredecessorVersion(
        id: json["id"],
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "href": href,
      };
}

class VersionHistory {
  VersionHistory({
    count,
    href,
  });

  int? count;
  String? href;

  factory VersionHistory.fromJson(Map<String, dynamic> json) => VersionHistory(
        count: json["count"],
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "href": href,
      };
}

class WpTerm {
  WpTerm({
    taxonomy,
    embeddable,
    href,
  });

  String? taxonomy;
  bool? embeddable;
  String? href;

  factory WpTerm.fromJson(Map<String, dynamic> json) => WpTerm(
        taxonomy: json["taxonomy"],
        embeddable: json["embeddable"],
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "taxonomy": taxonomy,
        "embeddable": embeddable,
        "href": href,
      };
}

//num Taxonomy { category, post_tag, yst_prominent_words }

// final taxonomyValues = EnumValues({
//   "category": Taxonomy.category,
//   "post_tag": Taxonomy.post_tag,
//   "yst_prominent_words": Taxonomy.yst_prominent_words
// });

// enum StatusEnum { publish }

// final statusEnumValues = EnumValues({"publish": StatusEnum.publish});

// enum Type { post }

// final typeValues = EnumValues({"post": Type.post});

// class EnumValues<T> {
//   Map<String, T>? map;
//   Map<T, String>? reverseMap;

//   EnumValues(map);

//   Map<T, String>? get reverse {
//     reverseMap ??= map!.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }
