sealed class AllGovernoratesState {}

final class AllGovernoratesInitial extends AllGovernoratesState {}

final class AllGovernoratesLoading extends AllGovernoratesState {}

final class AllGovernoratesError extends AllGovernoratesState {
  AllGovernoratesError(this.message) {
    print(message);
  }
  final String message;
}

final class SuccessGettingAllGovernorates extends AllGovernoratesState {}
