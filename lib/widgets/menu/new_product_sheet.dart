import 'package:baia_ui/constants.dart';
import 'package:baia_ui/utils.dart';
import 'package:baia_ui/widgets/io/app_text_field.dart';
import 'package:baia_ui/widgets/materialApp/app_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewItemBottomSheet extends StatefulWidget {
  final void Function(String name, double price)? onAdd;
  const NewItemBottomSheet({super.key, this.onAdd});

  @override
  State<NewItemBottomSheet> createState() => _NewItemBottomSheetState();
}

class _NewItemBottomSheetState extends State<NewItemBottomSheet> {
  final TextEditingController newNameController = TextEditingController();
  final TextEditingController newPriceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Nuevo producto',
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(height: 16),
            const Text(
              "Añade los productos que tienes en venta para poder brindar esta informacion a tu cliente",
              style: TextStyle(fontSize: 12),
            ),
            const SizedBox(height: 16),
            AppTextField(
              hintText: 'Name',
              controller: newNameController,
            ),
            const SizedBox(height: 16),
            AppTextField(
              hintText: "Price",
              controller: newPriceController,
            ),
            const SizedBox(height: 16),
            const AppTextField(
              hintText: "Descripcion",
            ),
            const SizedBox(height: 16),
            Center(
              child: AppTextButton(
                widthScale: 0.85,
                text: "Guardar producto",
                onPressed: () {
                  if (widget.onAdd != null) {
                    final name = newNameController.text;
                    final price =
                        double.tryParse(newPriceController.text) ?? 0.0;
                    widget.onAdd!(name, price);
                  }
                  Navigator.pop(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
