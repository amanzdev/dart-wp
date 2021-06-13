import 'dart:convert';

import 'package:collection/collection.dart';

class User {
  ///Unique identifier for the user.
  final int? id;

  ///Login name for the user.
  final String? username;

  /// Display name for the user.
  final String? name;

  ///First name for the user.
  final String? firstName;

  ///Last name for the user.
  final String? lastName;

  ///The email address for the user.
  final String? email;

  ///URL of the user.
  final String? url;

  ///Description of the user.
  final String? description;

  ///Author URL of the user.
  final String? link;

  ///Locale for the user.
  ///
  ///One of: , enUS
  final String? locale;

  ///The nickname for the user.
  final String? nickname;

  ///An alphanumeric identifier for the user.
  final String? slug;

  ///Registration date for the user.
  final String? registeredDate;

  ///Avatar URLs for the user.
  final Map<String, dynamic>? avatarUrls;

  ///Meta fields.
  final dynamic meta;
  User({
    this.id,
    this.username,
    this.name,
    this.firstName,
    this.lastName,
    this.email,
    this.url,
    this.description,
    this.link,
    this.locale,
    this.nickname,
    this.slug,
    this.registeredDate,
    this.avatarUrls,
    this.meta,
  });

  User copyWith({
    int? id,
    String? username,
    String? name,
    String? firstName,
    String? lastName,
    String? email,
    String? url,
    String? description,
    String? link,
    String? locale,
    String? nickname,
    String? slug,
    String? registeredDate,
    Map<String, dynamic>? avatarUrls,
    dynamic meta,
  }) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      name: name ?? this.name,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      url: url ?? this.url,
      description: description ?? this.description,
      link: link ?? this.link,
      locale: locale ?? this.locale,
      nickname: nickname ?? this.nickname,
      slug: slug ?? this.slug,
      registeredDate: registeredDate ?? this.registeredDate,
      avatarUrls: avatarUrls ?? this.avatarUrls,
      meta: meta ?? this.meta,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'name': name,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'url': url,
      'description': description,
      'link': link,
      'locale': locale,
      'nickname': nickname,
      'slug': slug,
      'registered_date': registeredDate,
      'avatar_urls': avatarUrls,
      'meta': meta,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      username: map['username'],
      name: map['name'],
      firstName: map['first_name'],
      lastName: map['last_name'],
      email: map['email'],
      url: map['url'],
      description: map['description'],
      link: map['link'],
      locale: map['locale'],
      nickname: map['nickname'],
      slug: map['slug'],
      registeredDate: map['registered_date'],
      avatarUrls: Map<String, dynamic>.from(map['avatar_urls']),
      meta: map['meta'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(id: $id, username: $username, name: $name, firstName: $firstName, lastName: $lastName, email: $email, url: $url, description: $description, link: $link, locale: $locale, nickname: $nickname, slug: $slug, registeredDate: $registeredDate, avatarUrls: $avatarUrls, meta: $meta)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    final collectionEquals = const DeepCollectionEquality().equals;

    return o is User &&
        o.id == id &&
        o.username == username &&
        o.name == name &&
        o.firstName == firstName &&
        o.lastName == lastName &&
        o.email == email &&
        o.url == url &&
        o.description == description &&
        o.link == link &&
        o.locale == locale &&
        o.nickname == nickname &&
        o.slug == slug &&
        o.registeredDate == registeredDate &&
        collectionEquals(o.avatarUrls, avatarUrls) &&
        o.meta == meta;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        username.hashCode ^
        name.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        email.hashCode ^
        url.hashCode ^
        description.hashCode ^
        link.hashCode ^
        locale.hashCode ^
        nickname.hashCode ^
        slug.hashCode ^
        registeredDate.hashCode ^
        avatarUrls.hashCode ^
        meta.hashCode;
  }
}

List<User>? parseUsers(dynamic data) {
  if (data is String) {
    return jsonDecode(data)
        .cast<Map<String, dynamic>>()
        .map<User>((json) => User.fromMap(json))
        .toList();
  } else {
    return data
        .cast<Map<String, dynamic>>()
        .map<User>((json) => User.fromMap(json))
        .toList();
  }
}
