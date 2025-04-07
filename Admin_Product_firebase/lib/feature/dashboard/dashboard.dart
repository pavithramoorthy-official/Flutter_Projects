import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:savings_admin/core/router/app_router.gr.dart';

import 'package:savings_admin/feature/add_products/add_product.dart';
import 'package:savings_admin/feature/add_products/model/product_model.dart';
import 'package:savings_admin/feature/dashboard/model/bill_model.dart';
import 'package:savings_admin/feature/notifier/searchDashboardNotifier.dart';
import 'package:savings_admin/feature/provider/bill_provider.dart';
import 'package:savings_admin/feature/provider/branch_provider.dart';
import 'package:savings_admin/feature/provider/searchDashboardProvider.dart';
import 'package:savings_admin/feature/view_products/view_product.dart';
import 'package:savings_admin/ui_components/ui_button.dart';
import 'package:savings_admin/ui_components/ui_space.dart';
import 'package:savings_admin/ui_components/ui_text.dart';

import '../provider/navigation_provider.dart';

@RoutePage()
class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  int _selectedIndex = 0;

  final List<Widget> _pages = [
    DashboardBody(),
    AddProductPage(),
    ViewProductPage(),
  ];

  void _navigateToPage(int index, {ProductModel, product}) {
    setState(() {
      _selectedIndex = index;
      if (index == 1 && product != null) {
        _pages[1] = AddProductPage(
          product: product,
        );
      } else {
        _pages[1] = AddProductPage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, ref, child) {
        final selectedIndex = ref.watch(navigationProvider);
        return Scaffold(
          appBar: _appbar(),
          body: _pages[selectedIndex.currentIndex],
          drawer: _buildDrawer(ref),
        );
      },
    );
  }

  AppBar _appbar() {
    return AppBar(
      title: UiText(label: "Admin"),
      backgroundColor: Colors.purple.shade200,
      foregroundColor: Colors.black,
      elevation: 1,
      actions: [
        IconButton(
            onPressed: () {
              context.router.replace(LoginRoute());
            },
            icon: Icon(Icons.logout)),
        UiSpace.horizontal(20),
      ],
    );
  }

  Drawer _buildDrawer(WidgetRef ref) {
    return Drawer(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.purpleAccent,
      child: ListView(
        padding: EdgeInsets.all(8),
        children: [
          ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: Colors.purple)),
              title: UiText(label: "Dashboard"),
              onTap: () {
                ref.read(navigationProvider.notifier).navigateTo(0);
                Navigator.of(context).pop();
                ref
                    .read(selectedBranchProvider.notifier)
                    .updateLocation("India");
                ref.read(billProvider.notifier).resetInvoice();
              }),
          UiSpace.vertical(5),
          ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: Colors.purple)),
              title: UiText(label: "Add Product"),
              onTap: () {
                ref.read(navigationProvider.notifier).navigateTo(1,
                    data: ProductModel(
                        productName: "",
                        productQuantity: 0,
                        productPrice: 0,
                        productDate: ""));
                Navigator.of(context).pop();
              }),
          UiSpace.vertical(5),
          ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: Colors.purple)),
              title: UiText(label: "View Product"),
              onTap: () {
                ref.read(navigationProvider.notifier).navigateTo(2);
                Navigator.of(context).pop();
              }),
        ],
      ),
    );
  }
}

class DashboardBody extends ConsumerStatefulWidget {
  const DashboardBody({super.key});

  @override
  ConsumerState<DashboardBody> createState() => _DashboardBodyState();
}

class _DashboardBodyState extends ConsumerState<DashboardBody> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void searchProduct() {
ref.read(searchDashboardProvider.notifier).SearchText(searchController.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
          final selectedValue = ref.watch(selectedBranchProvider);
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UiText(
                  label: "Bill Location ",
                  fontColor: Colors.purple.shade400,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 200,
                      child: RadioListTile<String>(
                        title: UiText(
                          label: "India",
                          fontColor: Colors.black87,
                        ),
                        value: "India",
                        groupValue: selectedValue,
                        onChanged: (value) {
                          ref
                              .read(selectedBranchProvider.notifier)
                              .updateLocation(value);

                          ref.read(billProvider.notifier).resetInvoice();
                        },
                        activeColor: Colors.purple.shade400,
                      ),
                    ),
                    SizedBox(
                      width: 200,
                      child: RadioListTile(
                        title: UiText(
                          label: "Chennai",
                          fontColor: Colors.black87,
                        ),
                        value: "Chennai",
                        groupValue: selectedValue,
                        onChanged: (value) {
                          // ref.read(selectedBranchProvider.notifier).state =
                          //     value!;
                          ref
                              .read(selectedBranchProvider.notifier)
                              .updateLocation(value);
                          ref.read(billProvider.notifier).resetInvoice();
                        },
                        activeColor: Colors.purple.shade400,
                      ),
                    ),
                    SizedBox(
                      width: 200,
                      child: RadioListTile(
                        title: UiText(
                          label: "Madurai",
                          fontColor: Colors.black87,
                        ),
                        value: "Madurai",
                        groupValue: selectedValue,
                        onChanged: (value) {
                          // ref.read(selectedBranchProvider.notifier).state =
                          //     value!;
                          ref
                              .read(selectedBranchProvider.notifier)
                              .updateLocation(value);
                          ref.read(billProvider.notifier).resetInvoice();
                        },
                        activeColor: Colors.purple.shade400,
                      ),
                    ),
                    SizedBox(
                      width: 200,
                      child: RadioListTile(
                        title: UiText(
                          label: "Theni",
                          fontColor: Colors.black87,
                        ),
                        value: "Theni",
                        groupValue: selectedValue,
                        onChanged: (value) {
                          // ref.read(selectedBranchProvider.notifier).state =
                          //     value!;
                          ref
                              .read(selectedBranchProvider.notifier)
                              .updateLocation(value);
                          ref.read(billProvider.notifier).resetInvoice();
                        },
                        activeColor: Colors.purple.shade400,
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        }),

        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            onChanged: (value) {
              searchProduct();
              },

            controller: searchController,
            decoration: InputDecoration(
              label: Text("Search"),
              prefixIcon: Icon(Icons.search),

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(35),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(35),
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(35),
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ),
        _buildBillList(),
      ],
    );
  }

  Widget _buildBillList() {
    return Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          final invoice = ref.watch(billProvider);
          final selectedBranch = ref.watch(selectedBranchProvider);
          final searchQuery = ref.watch(searchDashboardProvider);
          return Expanded(
            child: Row(
              children: [
                Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                      stream: _firestore.collection('bill').snapshots(),
                      //.where('location', isEqualTo: 'Chennai') // 🔹 Filter only Chennai
                      //as data is in array , filtering inside array doesn't work
                      builder: (context, snapshots) {
                        if (snapshots.connectionState ==
                            ConnectionState.waiting)
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        if (snapshots.hasError)
                          return Center(
                            child: Text("Error : ${snapshots.error}"),
                          );
                        if (!snapshots.hasData ||
                            snapshots.data!.docs.isEmpty) {
                          print("Error: ${snapshots.error}");
                          return Center(
                            child: Text("No Data Found"),
                          );
                        }

                        final dataDocs = snapshots.data!.docs;
                        final searchText = searchController.text.toLowerCase();
                        //filter based on location
                        final filteredBills = dataDocs.expand((doc) {
                          final data = doc.data() as Map<String, dynamic>;
                          final filteredLocationArray =
                              data['data'] as List<dynamic> ?? [];

                          return filteredLocationArray
                              .map((bill) => billData.fromJson(bill))
                              .where((d) =>
                           d.location == selectedBranch &&
                               (searchQuery!.isEmpty || d.billNumber!.contains(searchController.text))
                          )
                              .toList();
                        }).toList();

                        if (filteredBills.isEmpty) {
                          return Center(
                              child: UiText(
                                label: "No Bills Found for $selectedBranch",
                              ));
                        }

                        return ListView.builder(
                            itemCount: filteredBills.length,
                            itemBuilder: (context, index) {
                              final data =
                              dataDocs[index].data() as Map<String, dynamic>;
                              //data['data'] is a list of billData
                              final _bill = data['data'];

                              final _billModel = _bill[0];
                              //final _billData = billData.fromJson(_billModel);
                              final _billData = filteredBills[index];

                              return InkWell(
                                onTap: () {
                                  ref
                                      .read(billProvider.notifier)
                                      .updateBill(_billData);
                                },
                                child: Card(
                                  elevation: 2,
                                  //color: Colors.purple.shade50,
                                  margin: EdgeInsets.all(8),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              UiText(
                                                label: "Bill Number",
                                                fontColor: Colors.purple,
                                                // Assuming UiText has a fontColor property
                                                fontWeight: FontWeight.w100,
                                                fontSize: 15,
                                              ),
                                              UiText(
                                                label: "${_billData
                                                    .billNumber}",
                                                // Value in black
                                                fontWeight: FontWeight.w300,
                                              ),
                                              UiSpace.vertical(5),
                                              UiText(
                                                label: "Location  ",
                                                fontColor: Colors.purple,
                                                // Assuming UiText has a fontColor property
                                                fontWeight: FontWeight.w100,
                                                fontSize: 15,
                                              ),
                                              UiText(
                                                label: "${_billData.location}",
                                                // Value in black
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            });
                      }),
                ),
                Expanded(
                  child: Card(
                    elevation: 2,
                    margin: EdgeInsets.all(8),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: invoice.billNumber!.isEmpty
                          ? Center(
                        child: UiText(label: "click a bill to see details"),
                      )
                          : SingleChildScrollView(
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                UiText(
                                  label: "Bill Date ",
                                  fontColor: Colors.purple,
                                  // Assuming UiText has a fontColor property
                                  fontWeight: FontWeight.w100,
                                  fontSize: 15,
                                ),
                                UiText(
                                  label: "${invoice.date}",
                                  // Value in black
                                  fontWeight: FontWeight.w300,
                                ),
                                UiSpace.vertical(5),
                                UiText(
                                  label: "Bill Number",
                                  fontColor: Colors.purple,
                                  // Assuming UiText has a fontColor property
                                  fontWeight: FontWeight.w100,
                                  fontSize: 15,
                                ),
                                UiText(
                                  label: "${invoice.billNumber}",
                                  // Value in black
                                  fontWeight: FontWeight.w300,
                                ),
                                UiSpace.vertical(5),
                                UiText(
                                  label: "Location  ",
                                  fontColor: Colors.purple,
                                  // Assuming UiText has a fontColor property
                                  fontWeight: FontWeight.w100,
                                  fontSize: 15,
                                ),
                                UiText(
                                  label: "${invoice.location}",
                                  // Value in black
                                  fontWeight: FontWeight.w300,
                                ),
                                UiSpace.vertical(5),
                                UiText(
                                  label: "Total amount ",
                                  fontColor: Colors.purple,
                                  // Assuming UiText has a fontColor property
                                  fontWeight: FontWeight.w100,
                                  fontSize: 15,
                                ),
                                UiText(
                                  label: "Rs ${invoice.totalAmount}",
                                  // Value in black
                                  fontWeight: FontWeight.w300,
                                ),
                              ],
                            ),
                            UiSpace.vertical(40),
                            Card(
                              margin: EdgeInsets.all(8),
                              child: Table(
                                border: TableBorder.all(
                                    width: 1,
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(8)),
                                columnWidths: {
                                  0: IntrinsicColumnWidth(),
                                  1: IntrinsicColumnWidth(),
                                  2: IntrinsicColumnWidth(),
                                },
                                children: [
                                  TableRow(children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: UiText(
                                        label: "item name",
                                        fontWeight: FontWeight.w400,
                                        fontColor: Colors.purple.shade400,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: UiText(
                                        label: "quantity",
                                        fontWeight: FontWeight.w400,
                                        fontColor: Colors.purple.shade400,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: UiText(
                                        label: "price",
                                        fontWeight: FontWeight.w400,
                                        fontColor: Colors.purple.shade400,
                                      ),
                                    ),
                                  ]),
                                  ...invoice.items.map((list) {
                                    return TableRow(children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            8, 2, 8, 2),
                                        child: UiText(
                                          label: "${list.item_name}",
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            8, 2, 8, 2),
                                        child: UiText(
                                          label: "${list.item_quantity}",
                                          fontWeight: FontWeight.w400,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            8, 2, 8, 2),
                                        child: UiText(
                                          label: "${list.item_price}",
                                          fontWeight: FontWeight.w400,
                                          textAlign: TextAlign.right,
                                        ),
                                      ),
                                    ]);
                                  }).toList(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }


}
