class FootballMatch {
  final String team1Name;
  final String team2Name;
  final int team1Score;
  final int team2Score;
  final bool isRunning;
  final String winnerTeam;

  FootballMatch({
    required this.team1Name,
    required this.team2Name,
    required this.team1Score,
    required this.team2Score,
    required this.isRunning,
    required this.winnerTeam,
  });

  factory FootballMatch.fromJson(Map<String, dynamic> jsonData) {
    return FootballMatch(
      team1Name: jsonData["team1_name"],
      team2Name: jsonData["team2_name"],
      team1Score: jsonData["team1_score"],
      team2Score: jsonData["team2_score"],
      isRunning: jsonData["is_running"],
      winnerTeam: jsonData["winner_team"],
    );
  }
}
