import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Status.dart';
import 'package:flutter_application_1/addimage.dart';
import 'package:flutter_application_1/viewproducts.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

displayMessage(String message) {
  Fluttertoast.showToast(msg: message);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Status(),
    );
  }
}

// class Page extends StatefulWidget {
//   const Page({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   CollectionReference _referenceShoppingList =
//       FirebaseFirestore.instance.collection('shopping_list');
//   late Stream<QuerySnapshot> _streamShoppingItems;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   initState() {
//     super.initState();

//     _streamShoppingItems = _referenceShoppingList.snapshots();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           // Here we take the value from the MyHomePage object that was created by
//           // the App.build method, and use it to set our appbar title.
//           // title: Text(widget.title),
//           // actions: [
//           //   IconButton(
//           //       onPressed: () async {
//           //         await GoogleSignIn().signOut();
//           //         FirebaseAuth.instance.signOut();
//           //       },
//           //       icon: Icon(Icons.power_settings_new))
//           // ],
//           ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: _streamShoppingItems,
//         builder: (BuildContext context, AsyncSnapshot snapshot) {
//           if (snapshot.hasError) {
//             return Center(child: Text(snapshot.error.toString()));
//           }

//           if (snapshot.connectionState == ConnectionState.active) {
//             QuerySnapshot querySnapshot = snapshot.data;
//             List<QueryDocumentSnapshot> listQueryDocumentSnapshot =
//                 querySnapshot.docs;

//             return ListView.builder(
//                 itemCount: listQueryDocumentSnapshot.length,
//                 itemBuilder: (context, index) {
//                   QueryDocumentSnapshot document =
//                       listQueryDocumentSnapshot[index];
//                   return ShoppingListItem(document: document);
//                 });
//           }

//           return Center(child: CircularProgressIndicator());
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.of(context)
//               .push(MaterialPageRoute(builder: (context) => MyHomePage()));
//         },
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }

// class ShoppingListItem extends StatefulWidget {
//   const ShoppingListItem({
//     Key? key,
//     required this.document,
//   }) : super(key: key);

//   final QueryDocumentSnapshot<Object?> document;

//   @override
//   State<ShoppingListItem> createState() => _ShoppingListItemState();
// }

// class _ShoppingListItemState extends State<ShoppingListItem> {
//   bool _purchased = false;

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       // onTap: () {
//       //   Navigator.of(context).push(MaterialPageRoute(
//       //       builder: (context) => ItemDetails(widget.document.id)));
//       // },
//       title: Text(widget.document['name']),
//       subtitle: Text(widget.document['quantity']),
//       trailing: Checkbox(
//         onChanged: (value) {
//           setState(() {
//             _purchased = value ?? false;
//           });
//         },
//         value: _purchased,
//       ),
//     );
//   }
// }
