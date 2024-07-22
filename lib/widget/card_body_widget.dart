import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';

class CardBody extends StatelessWidget {
  var item;
  int index;
  final Function handleDelete;

  CardBody({
    super.key,
    required this.item,
    required this.handleDelete,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 20,
      ),
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
         color:(index%2==0) ? Colors.blue.shade300 : Colors.pink.shade300,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              item.name,
              style: TextStyle(
                color: Color(0xff4B4B4B),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            InkWell(
              onTap: () async {
                if (await confirm(context)) {
                  return handleDelete(item.id);
                }
                return;
              },
              child: Icon(
                Icons.delete,
                size: 20,
                color: Color(0xff4B4B4B),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
