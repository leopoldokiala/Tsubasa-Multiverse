class Player {
  final String id;
  final String name;
  final String nickname;
  final String nationality;
  final String position;
  final String team;
  final List<String> techniques;
  final List<String> rivals;
  final String imageUrl;
  final bool isBestPlayer;
  final bool isTsubasaTeammate;

  const Player({
    required this.id,
    required this.name,
    required this.nickname,
    required this.nationality,
    required this.position,
    required this.team,
    required this.techniques,
    required this.rivals,
    required this.imageUrl,
    required this.isBestPlayer,
    required this.isTsubasaTeammate,
  });
}
