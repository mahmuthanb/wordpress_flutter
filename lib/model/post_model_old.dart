class PostModel2 {
  late int id;
  late String date;
  late String dateGmt;
  late Guid guid;
  late String modified;
  late String modifiedGmt;
  late String slug;
  late String status;
  late String type;
  late String link;
  late Guid title;
  late Content content;
  late Content excerpt;
  late int author;
  late int featuredMedia;
  late String commentStatus;
  late String pingStatus;
  late bool sticky;
  late String template;
  late String format;
  late List<int> categories;
  late List<int> tags;
  late bool ampEnabled;

  PostModel2(
      {required id,
      required date,
      required dateGmt,
      required guid,
      required modified,
      required modifiedGmt,
      required slug,
      required status,
      required type,
      required link,
      required title,
      required content,
      required excerpt,
      required author,
      required featuredMedia,
      required commentStatus,
      required pingStatus,
      required sticky,
      required template,
      required format,
      required categories,
      required tags,
      required ampEnabled});

  PostModel2.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    dateGmt = json['date_gmt'];
    guid = (json['guid'] != null ? Guid.fromJson(json['guid']) : null)!;
    modified = json['modified'];
    modifiedGmt = json['modified_gmt'];
    slug = json['slug'];
    status = json['status'];
    type = json['type'];
    link = json['link'];
    title = (json['title'] != null ? Guid.fromJson(json['title']) : null)!;
    content = (json['content'] != null ? Content.fromJson(json['content']) : null)!;
    excerpt = (json['excerpt'] != null ? Content.fromJson(json['excerpt']) : null)!;
    author = json['author'];
    featuredMedia = json['featured_media'];
    commentStatus = json['comment_status'];
    pingStatus = json['ping_status'];
    sticky = json['sticky'];
    template = json['template'];
    format = json['format'];
    categories = json['categories'].cast<int>();
    tags = json['tags'].cast<int>();
    ampEnabled = json['amp_enabled'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['date'] = date;
    data['date_gmt'] = dateGmt;
    data['guid'] = guid.toJson();
    data['modified'] = modified;
    data['modified_gmt'] = modifiedGmt;
    data['slug'] = slug;
    data['status'] = status;
    data['type'] = type;
    data['link'] = link;
    data['title'] = title.toJson();
    data['content'] = content.toJson();
    data['excerpt'] = excerpt.toJson();
    data['author'] = author;
    data['featured_media'] = featuredMedia;
    data['comment_status'] = commentStatus;
    data['ping_status'] = pingStatus;
    data['sticky'] = sticky;
    data['template'] = template;
    data['format'] = format;
    data['categories'] = categories;
    data['tags'] = tags;
    data['amp_enabled'] = ampEnabled;
    return data;
  }
}

class Guid {
  late String rendered;

  Guid({
    required rendered,
  });

  Guid.fromJson(Map<String, dynamic> json) {
    rendered = json['rendered'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rendered'] = rendered;
    return data;
  }
}

class Content {
  late String rendered;
  late bool protected;

  Content({
    rendered,
    protected,
  });

  Content.fromJson(Map<String, dynamic> json) {
    rendered = json['rendered'];
    protected = json['protected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rendered'] = rendered;
    data['protected'] = protected;
    return data;
  }
}
