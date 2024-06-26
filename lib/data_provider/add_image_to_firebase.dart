
// ignore_for_file: avoid_print

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripx_admin_application/blocs/signupimage/profileimage_bloc.dart';



class Addimagetofirebase {
  Future<String?> addprofileimagetofirebase(context) async {
    try {
      firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
          .ref('travelslogo')
          .child(BlocProvider.of<ProfileimageBloc>(context, listen: false)
              .state
              .imagepath);
      final meta = firebase_storage.SettableMetadata(contentType: "image/jpeg");
      await ref.putData(
          BlocProvider.of<ProfileimageBloc>(context, listen: false)
              .state
              .imageInBytes!,
          meta);
      String url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      print("$e");
      return null;
    }
  }
}
