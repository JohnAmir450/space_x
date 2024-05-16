import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  Future<void> getUserData() async {
    try {
      final uid = FirebaseAuth.instance.currentUser!.uid;
      final getCollection =
          FirebaseFirestore.instance.collection('users').doc(uid);
      final docSnashot = await getCollection.get();
      if (docSnashot.exists) {
        final userData = docSnashot.data();
        emit(HomeScreenCubitStateSuccess(userData));
      } else {
        emit(HomeScreenCubitStateError('No User Doc Found'));
      }
    } catch (e) {
      emit(HomeScreenCubitStateError('An error occurred'));
    }
  }
}
