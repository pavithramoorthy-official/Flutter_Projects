import 'package:flutter/material.dart';
import 'package:savings_admin/ui_components/ui_space.dart';
import 'package:savings_admin/ui_components/ui_text.dart';

class UiTable extends StatelessWidget {
  const UiTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Table(
        border: TableBorder.all(
          color: Colors.white10,
          width: 1,
        ),
        children: [
          TableRow(
            children: [
              UiText(label: "SNo"),
              UiText(label: "Name"),
              UiText(label: "Quantity"),
              UiText(label: "Price"),
              UiText(label: "Action"),
            ]
          ),
          TableRow(
            children: [
              UiText(label: "1",fontWeight: FontWeight.w200,),
              UiText(label: "Apple",fontWeight: FontWeight.w200,),
              UiText(label: "100",fontWeight: FontWeight.w200,),
              UiText(label: "10",fontWeight: FontWeight.w200,),
              Row(children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
                UiSpace.horizontal(10),
                IconButton(onPressed: (){}, icon: Icon(Icons.delete_outline)),
              ],)
            ]
          )
        ],
      ),
    );
  }
}
