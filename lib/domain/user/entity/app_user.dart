import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user.g.dart';

@JsonSerializable()
class AppUser {
  String id;
  String email;
  @JsonKey(name: 'book_collection')
  List<String> bookCollection;
  AppUser({
    required this.id,
    required this.bookCollection,
    required this.email,
  });

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);
  Map<String, dynamic> toJson() => _$AppUserToJson(this);
}
