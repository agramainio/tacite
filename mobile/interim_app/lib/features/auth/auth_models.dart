class AuthProfile {
  const AuthProfile({
    required this.id,
    required this.emailIdentifier,
    required this.locale,
    required this.timezone,
    this.displayAlias,
  });

  factory AuthProfile.fromJson(Map<String, dynamic> json) {
    return AuthProfile(
      id: json['id'] as String,
      emailIdentifier: json['email_identifier'] as String,
      displayAlias: json['display_alias'] as String?,
      locale: json['locale'] as String,
      timezone: json['timezone'] as String,
    );
  }

  final String id;
  final String emailIdentifier;
  final String? displayAlias;
  final String locale;
  final String timezone;
}
