import 'dart:async';

import '../validators.dart';
import 'package:rxdart/rxdart.dart';

class Bloc extends Object with Validators {
  final _email = new BehaviorSubject<String>();
  final _password = new BehaviorSubject<String>();

  // Add data to the stream
  Stream<String> get email => _email.stream.transform(validateEmail);

  Stream<String> get password => _password.stream.transform(validatePassword);

  Stream<bool> get submitButton =>
      Observable.combineLatest2(email, password, (e, p) => true);

  // Change data
  Function(String) get changeEmail => _email.sink.add;

  Function(String) get changePassword => _password.sink.add;

  dispose() {
    _email.close();
    _password.close();
  }

  submit(){
    String email = _email.value;
    String password = _password.value;
    print("Email is $email and password is $password");
  }
}

final bloc = Bloc();
