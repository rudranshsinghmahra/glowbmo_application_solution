import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:rudransh_glowbmo_application/services/firebase_services.dart';

class GridViewScreen extends StatefulWidget {
  const GridViewScreen({Key? key}) : super(key: key);

  @override
  State<GridViewScreen> createState() => _GridViewScreenState();
}

class _GridViewScreenState extends State<GridViewScreen> {
  FirebaseServices firebaseServices = FirebaseServices();
  TextEditingController gridNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 54, 54, 99),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 54, 54, 99),
        elevation: 0,
        title: const Text("Grid View Screen"),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: firebaseServices.myGrids.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong'));
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.data!.size == 0) {
            return Center(
              child: Neumorphic(
                style: const NeumorphicStyle(
                  boxShape: NeumorphicBoxShape.stadium(),
                  intensity: 1,
                  depth: 5,
                  shadowLightColor: Color.fromARGB(
                    255,
                    40,
                    46,
                    80,
                  ),
                  shadowDarkColor: Color.fromARGB(
                    255,
                    16,
                    18,
                    33,
                  ),
                ),
                child: NeumorphicButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Center(child: Text("Add Grid")),
                        content: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: MediaQuery.of(context).size.height * 0.2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Enter Grid Name"),
                              const SizedBox(
                                height: 5,
                              ),
                              TextField(
                                controller: gridNameController,
                                decoration: InputDecoration(
                                    hintText: "Enter Grid Name",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(1))),
                              ),
                            ],
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              "Cancel",
                              style:
                                  TextStyle(color: Colors.cyan, fontSize: 17),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              if (gridNameController.text.isNotEmpty) {
                                firebaseServices
                                    .addGridsToDatabase(
                                        gridNameController.text.trim())
                                    .then((value) => {
                                          gridNameController.clear(),
                                          Navigator.pop(context),
                                          showToast('Grid Added Successfully',
                                              context: context,
                                              animation:
                                                  StyledToastAnimation.scale,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                        });
                              } else {
                                Navigator.pop(context);
                                showToast('Please enter a name for Grid',
                                    context: context,
                                    animation: StyledToastAnimation.scale,
                                    borderRadius: BorderRadius.circular(20));
                              }
                            },
                            child: const Text(
                              "Submit",
                              style:
                                  TextStyle(color: Colors.cyan, fontSize: 17),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  child: const Text(
                    "Add Grids",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ),
            );
          }
          return Column(
            children: [
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 1,
                    mainAxisSpacing: 20,
                  ),
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Neumorphic(
                        style: NeumorphicStyle(
                          depth: 5,
                          intensity: 1,
                          shadowLightColor: const Color.fromARGB(
                            255,
                            40,
                            46,
                            80,
                          ),
                          shadowDarkColor: const Color.fromARGB(
                            255,
                            16,
                            18,
                            33,
                          ),
                          boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(30),
                          ),
                        ),
                        child: GestureDetector(
                          onLongPress: () {
                            firebaseServices
                                .deletedGridFromDatabase(
                                    snapshot.data?.docs[index].reference.id)
                                .then((value) => {
                                      showToast('Grid deleted successfully',
                                          context: context,
                                          animation: StyledToastAnimation.scale,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                    });
                          },
                          child: Container(
                            color: const Color.fromARGB(255, 207, 212, 234),
                            child: Center(
                              child: Text(
                                snapshot.data?.docs[index]['gridName'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 54, 54, 99),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Neumorphic(
                  style: const NeumorphicStyle(
                    boxShape: NeumorphicBoxShape.stadium(),
                    intensity: 1,
                    depth: 5,
                    shadowLightColor: Color.fromARGB(
                      255,
                      40,
                      46,
                      80,
                    ),
                    shadowDarkColor: Color.fromARGB(
                      255,
                      16,
                      18,
                      33,
                    ),
                  ),
                  child: NeumorphicButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Center(child: Text("Add Grid")),
                          content: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.7,
                            height: MediaQuery.of(context).size.height * 0.2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Enter Grid Name"),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextField(
                                  controller: gridNameController,
                                  decoration: InputDecoration(
                                      hintText: "Enter Grid Name",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(1))),
                                ),
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                "Cancel",
                                style:
                                    TextStyle(color: Colors.cyan, fontSize: 17),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                if (gridNameController.text.isNotEmpty) {
                                  firebaseServices
                                      .addGridsToDatabase(
                                          gridNameController.text)
                                      .then((value) => {
                                            gridNameController.clear(),
                                            Navigator.pop(context),
                                            showToast('Grid Added Successfully',
                                                context: context,
                                                animation:
                                                    StyledToastAnimation.scale,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                          });
                                } else {
                                  Navigator.pop(context);
                                  showToast('Please enter a name for Grid',
                                      context: context,
                                      animation: StyledToastAnimation.scale,
                                      borderRadius: BorderRadius.circular(20));
                                }
                              },
                              child: const Text(
                                "Submit",
                                style:
                                    TextStyle(color: Colors.cyan, fontSize: 17),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    child: const Text(
                      "Add Grids",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
