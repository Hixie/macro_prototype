import 'macros/data_class.dart';
import 'macros/json.dart';

@dataClass
@jsonSerializable
class User {
  String name;
  @jsonSerializable
  Map<String, Object?> toJson() => <String, Object?>{"name": name};

  User copyWith({String? name}) => User(name: name ?? this.name);
  @override
  bool operator ==(Object other) => other is User && this.name == other.name;
  @override
  String toString() => '${User} {name: ${name}}';
  @jsonSerializable
  User.fromJson(
    Map<String, Object?> json,
  ) : name = json["name"] as String;

  User({required this.name});
  @override
  int get hashCode => name.hashCode;
}

@dataClass
@jsonSerializable
class Group {
  final String name;
  final List<User> users;
  @jsonSerializable
  Map<String, Object?> toJson() => <String, Object?>{
        "name": name,
        "users": [for (var e in users) e.toJson()]
      };

  Group copyWith({String? name, List<User>? users}) =>
      Group(name: name ?? this.name, users: users ?? this.users);
  @override
  bool operator ==(Object other) =>
      other is Group && this.name == other.name && this.users == other.users;
  @override
  String toString() => '${Group} {name: ${name}, users: ${users}}';
  @jsonSerializable
  Group.fromJson(
    Map<String, Object?> json,
  )   : name = json["name"] as String,
        users = [
          for (var e in json["users"] as List<Object?>)
            User.fromJson(e as Map<String, Object?>)
        ];

  Group({required this.name, required this.users});
  @override
  int get hashCode => name.hashCode ^ users.hashCode;
}

@jsonSerializable
class Manager extends User {
  final List<User> reports;
  @jsonSerializable
  Map<String, Object?> toJson() => <String, Object?>{
        "reports": [for (var e in reports) e.toJson()],
        "name": name
      };

  @jsonSerializable
  Manager.fromJson(
    Map<String, Object?> json,
  )   : reports = [
          for (var e in json["reports"] as List<Object?>)
            User.fromJson(e as Map<String, Object?>)
        ],
        super.fromJson(json);

  Manager({required String name, required this.reports}) : super(name: name);
}
