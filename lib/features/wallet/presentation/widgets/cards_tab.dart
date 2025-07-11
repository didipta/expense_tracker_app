import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardsTab extends StatelessWidget {
  const CardsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Image.asset('asset/cardimage.webp', width: double.infinity, fit: BoxFit.cover),
          const SizedBox(height: 16),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text("Add your debit Card", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ),
          const SizedBox(height: 4),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "This card must be connected to a bank account under your name",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          const SizedBox(height: 16),
          _buildTextField("NAME ON CARD"),
          const SizedBox(height: 12),
          _buildTextField("DEBIT CARD NUMBER"),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(child: _buildTextField("CVC")),
              const SizedBox(width: 12),
              Expanded(child: _buildTextField("EXPIRATION MM/YY")),
              const SizedBox(width: 12),
              Expanded(child: _buildTextField("ZIP")),
            ],
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Next"),
          )
        ],
      ),
    );
  }

  Widget _buildTextField(String label) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
      ),
    );
  }
}
