import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'post_details_state.dart';

class PostDetailsCubit extends Cubit<PostDetailsState> {
  PostDetailsCubit() : super(PostDetailsInitial());
  
}
