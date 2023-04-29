class ResponseAliasDTO {
  final String alias;
  final Links links;

  ResponseAliasDTO(this.alias, this.links);

  ResponseAliasDTO.fromJson(Map<String, dynamic> json)
      : alias = json["alias"],
        links = Links.fromJson(json["_links"]);

  Map<String, dynamic> toJson() => {'alias': alias, '_links': links.toJson()};
}

class Links {
  final String self;
  final String short;

  Links(this.self, this.short);

  Links.fromJson(Map<String, dynamic> json)
      : self = json["self"],
        short = json["short"];

  Map<String, dynamic> toJson() => {'self': self, 'short': short};
}
