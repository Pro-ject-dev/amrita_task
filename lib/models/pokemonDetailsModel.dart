class PokemonDetailsModel {
  String? name;
  Sprites? sprites;
  int? baseExperience;
  String? height;
  String? weight;
  List<Abilities>? abilities;
  List<Types>? types;
  List<Moves>? moves;

  PokemonDetailsModel(
      {this.name,
      this.sprites,
      this.baseExperience,
      this.abilities,
      this.types,
      this.moves,
      this.height,
      this.weight});

  PokemonDetailsModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    sprites =
        json['sprites'] != null ? new Sprites.fromJson(json['sprites']) : null;
    baseExperience = json['base_experience'];
    height = json['height'].toString();
    weight = json['weight'].toString();
    if (json['abilities'] != null) {
      abilities = <Abilities>[];
      json['abilities'].forEach((v) {
        abilities!.add(new Abilities.fromJson(v));
      });
    }
    if (json['types'] != null) {
      types = <Types>[];
      json['types'].forEach((v) {
        types!.add(new Types.fromJson(v));
      });
    }
    if (json['moves'] != null) {
      moves = <Moves>[];
      json['moves'].forEach((v) {
        moves!.add(new Moves.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.sprites != null) {
      data['sprites'] = this.sprites!.toJson();
    }
    data['base_experience'] = this.baseExperience;
    data['height'] = this.height;
    data['weight'] = this.weight;
    if (this.abilities != null) {
      data['abilities'] = this.abilities!.map((v) => v.toJson()).toList();
    }
    if (this.types != null) {
      data['types'] = this.types!.map((v) => v.toJson()).toList();
    }
    if (this.moves != null) {
      data['moves'] = this.moves!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Sprites {
  String? frontDefault;

  Sprites({this.frontDefault});

  Sprites.fromJson(Map<String, dynamic> json) {
    frontDefault = json['front_default'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['front_default'] = this.frontDefault;
    return data;
  }
}

class Abilities {
  Ability? ability;

  Abilities({this.ability});

  Abilities.fromJson(Map<String, dynamic> json) {
    ability =
        json['ability'] != null ? new Ability.fromJson(json['ability']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.ability != null) {
      data['ability'] = this.ability!.toJson();
    }
    return data;
  }
}

class Ability {
  String? name;

  Ability({this.name});

  Ability.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}

class Types {
  Ability? type;

  Types({this.type});

  Types.fromJson(Map<String, dynamic> json) {
    type = json['type'] != null ? new Ability.fromJson(json['type']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.type != null) {
      data['type'] = this.type!.toJson();
    }
    return data;
  }
}

class Moves {
  Move? move;

  Moves({this.move});

  Moves.fromJson(Map<String, dynamic> json) {
    move = json['move'] != null ? new Move.fromJson(json['move']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.move != null) {
      data['move'] = this.move!.toJson();
    }
    return data;
  }
}

class Move {
  String? name;
  String? url;

  Move({this.name, this.url});

  Move.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}
