sealed class AllAreasState {}

final class AllAreasInitial extends AllAreasState {}

final class AllAreasLoading extends AllAreasState {}

final class AllAreasError extends AllAreasState {
  AllAreasError(this.message) {
    print(message);
  }
  final String message;
}

final class SuccessGettingAllAreas extends AllAreasState {}
