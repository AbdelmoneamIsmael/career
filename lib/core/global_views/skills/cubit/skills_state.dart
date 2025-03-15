sealed class SkillsState {}

final class SkillsInitial extends SkillsState {}

final class SkillsLoading extends SkillsState {}

final class SkillsError extends SkillsState {
  SkillsError(this.message) {
    print(message);
  }
  final String message;
}

final class SuccessGettingSkills extends SkillsState {}
