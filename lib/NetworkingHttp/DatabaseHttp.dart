import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:k_tech/Controllers/Users/Profile.dart';
import 'package:k_tech/Models/User/User.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference profileCollection = Firestore.instance.collection('profiles');

  Future<void> updateUserData(String name, String email, String mobile, List<String> subjects) async {
    return await profileCollection.document(uid).setData({
      'name': name,
      'email' : email,
      'mobile': mobile,
      'subjects': subjects,
    });
  }

  // user data from snapshots
  UserProfile _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserProfile(
        uid: uid,
        email: snapshot.data['email'],
        name: snapshot.data['name'],
        mobile: snapshot.data['mobile'],
        subjects: List.from(snapshot.data['subjects'])
    );
  }

  // get brews stream
  // get user doc stream
  Stream<UserProfile> get userProfile {

    return profileCollection.document(uid).snapshots()
        .map(_userDataFromSnapshot);
  }
}