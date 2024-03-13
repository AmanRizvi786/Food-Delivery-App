import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DatabaseMethods {
  Future addUserDetails(Map<String, dynamic> userInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .set(userInfoMap);
  }

  Future addFoodItem(Map<String, dynamic> userInfoMap, String name) async {
    return await FirebaseFirestore.instance.collection(name).add(userInfoMap);
  }

  Future<Stream<QuerySnapshot>> getFoodItem(String name) async {
    return await FirebaseFirestore.instance.collection(name).snapshots();
  }

  Future addFoodToCart(Map<String, dynamic> userInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .collection("Cart")
        .add(userInfoMap);
  }

  Future<Stream<QuerySnapshot>> getFoodCart(String id) async {
    return await FirebaseFirestore.instance.collection("users")
        .doc(id)
        .collection("Cart")
        .snapshots();
  }

  Future<Map<String, dynamic>?> getUserDetailsByEmail(String email) async {
    try {
      // Query Firestore collection for the user with the provided email
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('Email', isEqualTo: email)
          .limit(1)
          .get();

      // Check if any documents match the query
      if (querySnapshot.docs.isNotEmpty) {
        // Extract user details from the first document found
        return querySnapshot.docs.first.data();
      } else {
        // If no matching user found, return null
        return null;
      }
    } catch (e) {
      // Handle any errors that occur during the database query
      print("Error fetching user details: $e");
      return null;
    }
  }

  Future<void> deleteUser(String userId) async {
    try {
      // Get reference to the document to delete
      DocumentReference<Map<String, dynamic>> userDocRef =
      FirebaseFirestore.instance.collection('users').doc(userId);

      // Delete the document
      await userDocRef.delete();
    } catch (e) {
      // Handle any errors that occur during deletion
      print("Error deleting user: $e");
      throw e; // Optionally, rethrow the error to handle it in the UI
    }
  }

  Future<Map<String, dynamic>?> getUserDetailsById(String userId) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot =
      await FirebaseFirestore.instance.collection('users').doc(userId).get();
      if (snapshot.exists) {
        return snapshot.data();
      } else {
        return null;
      }
    } catch (e) {
      print("Error getting user details: $e");
      return null;
    }
  }




}
