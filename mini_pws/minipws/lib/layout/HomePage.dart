// ignore_for_file: file_names, use_build_context_synchronously

import 'dart:io';
import 'package:minipws/model/productDb.dart';
import 'package:minipws/model/service.dart';
import 'package:objectbox/objectbox.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _priceController = TextEditingController();

  File? _image;
  // This will store the selected image

  late final Store _store;

  final Servicess _service = Servicess();

  // Initialize the ImagePicker
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          _openBottomSheet(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _openBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 16,
            right: 16,
            top: 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Title
              Text(
                'Add Product',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              // Name Field
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Product Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding:
                     const  EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
              ),
              const SizedBox(height: 16),

              // Price Field
              TextField(
                controller: _priceController,
                decoration: InputDecoration(
                  labelText: 'Product Price',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),

              // Image Picker
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child:  const Text('Pick Image'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  _image != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.file(_image!,
                              height: 50, width: 50, fit: BoxFit.cover),
                        )
                      : const Text('No image selected'),
                ],
              ),
              const SizedBox(height: 16),

              // Divider
              const Divider(),

              // Add Product Button
              ElevatedButton(
                onPressed: () async {
                  await _saveProduct();

                  Navigator.pop(context); // Close the bottom sheet
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.amber[50],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const  Text('Add Product'),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _saveProduct() async {
    String name = _nameController.text;
    String price = _priceController.text;
    String imagePath = _image?.path ?? 'No image selected';

    Product product =
        Product(name: name, price: price as double, image: imagePath);

    await _service.addPerson(product);
    Navigator.pop(context); // Save the product to the database
  }


  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _store.close();
    super.dispose();
  }
}
