// ignore_for_file: non_constant_identifier_names

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'google_event.dart';
part 'google_state.dart';

class GoogleBloc extends Bloc<GoogleEvent, GoogleState> {
  GoogleBloc() : super(GoogleInitial()) {
    on<Googlepressed>(_GoogleSignButtonPressed);
  }

  _GoogleSignButtonPressed(
      Googlepressed event, Emitter<GoogleState> emit) async {
    emit(GoogleLoadingstate());
    final GoogleSignIn googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    try {
      final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
            idToken: googleSignInAuthentication.idToken,
            accessToken: googleSignInAuthentication.accessToken);

        await firebaseAuth.signInWithCredential(credential);
        emit(GoogleSuccessState());
      }
    } catch (e) {
      emit(GoogleFailureState());
      debugPrint("error occured while google sign in $e");
    }
  }
}
