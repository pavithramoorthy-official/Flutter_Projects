import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement/riverpod/controller/provider/bool_provider.dart';
import 'package:statemanagement/riverpod/controller/provider/list_provider.dart';
import 'package:statemanagement/riverpod/controller/provider/map_provider.dart';
import 'package:statemanagement/riverpod/controller/provider/string_provider.dart';

import 'controller/provider/counter_provider.dart';

class Riverpodstatemanagement extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RiverpodstatemanagementState();
}

class _RiverpodstatemanagementState
    extends ConsumerState<Riverpodstatemanagement> {
  final int number = 0;
  final String word = 'Hello';
  final TextEditingController controller = TextEditingController();
  final TextEditingController listController = TextEditingController();
  final TextEditingController keyController = TextEditingController();
  final TextEditingController valueController = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    listController.dispose();
    keyController.dispose();
    valueController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: _buildbody(),
    );
  }

  AppBar _appbar() {
    return AppBar(
      title: Text("Riverpod State Management",
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
      ),
      centerTitle: true,
    );
  }

  Widget _buildbody() {
    final counterValue = ref.watch(counterProvider);
    final stringValue = ref.watch(StringProvider);
    final boolValue = ref.watch(boolProvider);
    final listValue = ref.watch(listProvider);
    final mapValue = ref.watch(mapProvider);
    ref.listen<int>(counterProvider, (oldvalue, newvalue) {
      if (newvalue > 10)
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Greater than 10")));
      if (newvalue < 0)
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Below Zero")));
    });

    ref.listen(boolProvider, (oldValue, newValue) {
      if (newValue == true)
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("True")));
    });
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Column(

              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildCounter(counterValue),
                _buildString(stringValue),
                _buildBoolean(boolValue),
                _buildList(listValue),
                _buildMap(mapValue),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildCounter(int a) {
    return Card(
      color: Colors.purple.shade50,
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              "Number : $a",
              style: const TextStyle(
                color: Colors.purple,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    ref.read(counterProvider.notifier).increment();
                  },
                  child: Text("Add 1"),
                ),
                ElevatedButton(
                  onPressed: () {
                    ref.read(counterProvider.notifier).decrement();
                  },
                  child: Text("minus 1"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  _buildString(String b) {
    return Card(
      elevation: 1,
      color: Colors.green.shade50,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              "String : $b",
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder()
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(StringProvider.notifier).updateString(controller.text);
                controller.clear();
              },
              child: Text("Update String"),
            ),
          ],
        ),
      ),
    );
  }

  _buildBoolean(bool a) {
    return Card(

      elevation: 1,
      color: Colors.purple.shade50,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              "Boolean : $a",
              style: TextStyle(
                color: Colors.purple,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(boolProvider.notifier).updateBoolValue(!a);
              },
              child: Text("Toggle"),
            )
          ],
        ),
      ),
    );
  }

  _buildList(List a) {
    return Card(
      elevation: 1,
      color: Colors.green.shade50,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              "List : $a",
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: listController,
              decoration: InputDecoration(
                  border: OutlineInputBorder()
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(listProvider.notifier).updateList(
                    listController.text.split(",").map(int.parse).toList());
                listController.clear();
              },
              child: Text("Update List"),
            )
          ],
        ),
      ),
    );
  }

  _buildMap(Map a) {
    return Card(
      elevation: 1,
      color: Colors.purple.shade50,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              "Map : $a",
              style: TextStyle(
                color: Colors.purple,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: keyController,
              decoration: InputDecoration(
                  border: OutlineInputBorder()
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(

              controller: valueController,
              decoration: InputDecoration(
                  border: OutlineInputBorder()
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(mapProvider.notifier).updateMap(keyController.text,valueController.text);
                keyController.clear();
                valueController.clear();
              },
              child: Text("Update Map"),
            )
          ],
        ),
      ),
    );
  }
}
