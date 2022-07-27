//packages
import 'package:chat_app/models/chat_user.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

//services
import '../services/database_service.dart';
import '../services/navigation_service.dart';

//Models
import '../models/chat_user.dart';

class Authenticationprovider extends ChangeNotifier {
  late final FirebaseAuth _auth;
  late final NavigationService _navigationService;
  late final DataBaseService _dataBaseService;

  late ChatUser user;

  Authenticationprovider() {
    _auth = FirebaseAuth.instance;
    _navigationService = GetIt.instance.get<NavigationService>();
    _dataBaseService = GetIt.instance.get<DataBaseService>();
    //_auth.signOut();

    _auth.authStateChanges().listen((_user) {
      if (_user != null) {
        _dataBaseService.updateUserLastTimeSeen(_user.uid);
        _dataBaseService.getUser(_user.uid).then(
          (_snapshot) {
            Map<String, dynamic> _userData =
                _snapshot.data()! as Map<String, dynamic>;
            user = ChatUser.fromJSON(
              {
                "uid": _user.uid,
                "name": _userData["name"],
                "email": _userData["email"],
                "image": _userData["image"],
                "last_active": _userData["last_active"],
              },
            );
            // ignore: avoid_print
            _navigationService.removeAndNavigateToRoute('/home');
          },
        );
      } else {
        //if(_navigationService. != '/logom')
        
        _navigationService.removeAndNavigateToRoute('/login');
        
      }
    });
  }

  Future<void> loginusingEmailAndPassword(
      String _email, String _password) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: _email, password: _password);

      // print(_auth.currentUser);

    } on FirebaseAuthException

    // print("Error logging user into Firebase");

    catch (e) {
      print(e.code);
    }
  }

  Future<String?> registerUSerUsingEmailAndPassword(
      String _email, String _password) async {
    try {
      UserCredential _credential = await _auth.createUserWithEmailAndPassword(
          email: _email, password: _password);

      return _credential.user!.uid;
    } on FirebaseAuthException {
      print("Error Registering User.");
    } catch (e) {
      print(e);
    }
  }

  Future<void> logout() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print(e);
    }
  }
}
