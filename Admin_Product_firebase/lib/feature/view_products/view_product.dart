import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:savings_admin/feature/view_products/product_datasource.dart';
import 'package:savings_admin/feature/view_products/product_serivce.dart';

import 'package:savings_admin/ui_components/ui_text.dart';

import '../../core/router/app_router.gr.dart';
import '../add_products/model/product_model.dart';

@RoutePage()
class ViewProductPage extends StatefulWidget {
  const ViewProductPage({super.key});

  @override
  State<ViewProductPage> createState() => _ViewProductPageState();
}

class _ViewProductPageState extends State<ViewProductPage> {
  late final Future<List<ProductModel>> _fetchedProduct;
  List<ProductModel> _filteredProduct = [];
  List<ProductModel> _allProduct = [];
  ProductDatasource? _productDatasource;
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchedProduct = ProductService().fetchProductList().then((product) {
      _allProduct = product;
      _filteredProduct = sortProduct(product);
      return product;
    });
  }

  List<ProductModel> sortProduct(List<ProductModel> data){
    data.sort((a,b){
      DateTime dateA = DateFormat("MMMM d, yyyy h:mm a").parse(a.productDate);
      DateTime dateB = DateFormat("MMMM d, yyyy h:mm a").parse(b.productDate);
      return dateB.compareTo(dateA);
    });
    return data;
  }
  void _searchList(String searchText) {
    if (searchText.isEmpty) {
      setState(() {
        _filteredProduct = sortProduct(_allProduct);
      });
    } else {
      setState(() {
        _filteredProduct = _allProduct.where((data) {
          return data.productName
                  .toLowerCase()
                  .contains(searchText.toLowerCase()) ||
              data.productPrice.toString().contains(searchText.toLowerCase()) ||
              data.productQuantity
                  .toString()
                  .contains(searchText.toLowerCase()) ||
              data.productQuantity
                  .toString()
                  .contains(searchText.toLowerCase());
        }).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      return FutureBuilder(
          future: _fetchedProduct,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
              return Center(
                child: CircularProgressIndicator(),
              );
            else if (snapshot.hasError) {
              print("Snapshot : $snapshot");
              return Center(
                child: UiText(label: "Error : ${snapshot.error}"),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty)
              return Center(
                child: UiText(label: "No Records Found"),
              );

            //_productDatasource = ProductDatasource(snapshot.data!);
            _productDatasource =
                ProductDatasource(_filteredProduct, context, ref);
            return Center(
              child: Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextField(
                          onChanged: _searchList,
                          controller: searchController,
                          decoration: InputDecoration(
                            labelText: "Search",
                            prefixIcon: Icon(Icons.search),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(8)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(8)),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width *
                                0.8, // Adjust width
                            child: Card(
                              margin: EdgeInsets.zero,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: Colors.grey.shade300, width: 1),
                                // Table border
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: _filteredProduct.isEmpty
                                  ? Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: UiText(
                                        label: "Data Not Available",
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  : SingleChildScrollView(
                                      child: PaginatedDataTable(

                                        headingRowColor:
                                            MaterialStateProperty.all(
                                                Colors.purple.shade100),
                                        columnSpacing: 30.0,
                                        horizontalMargin: 10,
                                        dividerThickness: 1,
                                        arrowHeadColor: Colors.purple,
                                        header: UiText(label: "Products List"),
                                        columns: [
                                          DataColumn(
                                              label: UiText(label: "Date"),
                                              headingRowAlignment:
                                                  MainAxisAlignment.center),
                                          DataColumn(
                                              label: UiText(label: "Product"),
                                              headingRowAlignment:
                                                  MainAxisAlignment.center),
                                          DataColumn(
                                              label: UiText(label: "Quantity"),
                                              headingRowAlignment:
                                                  MainAxisAlignment.center),
                                          DataColumn(
                                              label: UiText(label: "Price"),
                                              headingRowAlignment:
                                                  MainAxisAlignment.center),
                                          DataColumn(
                                              label: UiText(label: "Actions"),
                                              headingRowAlignment:
                                                  MainAxisAlignment.center),
                                        ],
                                        source: _productDatasource!,
                                        rowsPerPage: _filteredProduct.length < 5
                                            ? _filteredProduct.length
                                            : 5,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
    });
  }
}
