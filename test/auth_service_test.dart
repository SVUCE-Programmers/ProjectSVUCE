import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rxdart/rxdart.dart';
import 'package:svuce_app/services/authentication_service.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockFirebaseUser extends Mock implements FirebaseUser {}

class MockAuthResult extends Mock implements AuthResult {}

void main() {
  MockFirebaseAuth _auth = MockFirebaseAuth();
  BehaviorSubject<MockFirebaseUser> _user = BehaviorSubject<MockFirebaseUser>();

  when(_auth.onAuthStateChanged).thenAnswer((_) {
    return _user;
  });

  AuthenticationService service = AuthenticationService(firebaseAuth: _auth);

  group('user repository test', () {
    // when there's an user with email: email and password: password we'll return mockuser
    when(_auth.signInWithEmailAndPassword(email: "email", password: "password"))
        .thenAnswer((_) async {
      _user.add(MockFirebaseUser());
      return MockAuthResult();
    });

    //when an user doesn't exist we'll throw error
    when(_auth.signInWithEmailAndPassword(
            email: "theemailthatdoesntexist", password: "pass"))
        .thenThrow(Exception('Error Occured'));

    test("sign in with email and password", () async {
      bool signedIn =
          await service.loginAsStudent(email: "email", password: "password");
      expect(signedIn, true);
    });

    test("sign in fails with incorrect email and password", () async {
      var signedIn = await service.loginAsStudent(
          email: "theemailthatdoesntexist", password: "pass");
      expect(signedIn, 'Error Occured');
    });
  });
}
