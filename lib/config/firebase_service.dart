import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  static void initialize() async {
    await Firebase.initializeApp();
  }

  static FirebaseFirestore get firestoreInstance {
    return FirebaseFirestore.instance;
  }
} 
