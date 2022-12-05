import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class view extends StatefulWidget {
  const view({super.key});

  @override
  State<view> createState() => _viewState();
}

class _viewState extends State<view> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Products').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Text("no data exists");
            }
            if (snapshot.connectionState == ConnectionState.done) {
              return Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              Image.network(
                                snapshot.data?.docs[index]['images'] ?? '',
                                height: 100,
                              ),
                              Text(snapshot.data?.docs[index]['pname'] ?? ''),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(snapshot.data?.docs[index]['pprice'] ?? ''),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(snapshot.data?.docs[index]['pquantity'] ??
                                  ''),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        )),
                  );
                });
          }),
    );
  }
}
