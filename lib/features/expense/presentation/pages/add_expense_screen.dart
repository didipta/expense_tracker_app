import 'package:expense_tracker_app/shared/widgets/layout_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../widgets/dottedborderbox.dart';
import '../widgets/label.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final TextEditingController nameController = TextEditingController(text: 'Netflix');
  final TextEditingController amountController = TextEditingController(text: '\$ 48.00');
  DateTime selectedDate = DateTime(2025, 4, 17);

  void _pickDate() async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (date != null) {
      setState(() => selectedDate = date);
    }
  }

  void _clearAmount() {
    amountController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(12);
    final theme = Theme.of(context);

    return Scaffold(
      body: LayoutBody(child:  Padding(
        padding: EdgeInsets.all(20.w),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Label("Name"),
              TextField(
                controller: nameController,
                decoration: _fieldDecoration(),
              ),
              const SizedBox(height: 20),

              const Label("Amount"),
              Stack(
                alignment: Alignment.centerRight,
                children: [
                  TextField(
                    controller: amountController,
                    decoration: _fieldDecoration().copyWith(
                      prefixText: '\$ ',
                      prefixStyle:TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color:Theme.of(context).primaryColor,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: borderRadius,
                        borderSide: BorderSide(color: Theme.of(context).primaryColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: borderRadius,
                        borderSide: BorderSide(color:Theme.of(context).primaryColor),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  Positioned(
                    right: 10,
                    child: GestureDetector(
                      onTap: _clearAmount,
                      child: Text(
                        "Clear",
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),

              const Label("Date"),
              GestureDetector(
                onTap: _pickDate,
                child: AbsorbPointer(
                  child: TextFormField(
                    decoration: _fieldDecoration().copyWith(
                      hintText: DateFormat('EEE, dd MMM yyyy').format(selectedDate),
                      suffixIcon: const Icon(Icons.calendar_today),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              const Label("Invoice"),
              GestureDetector(
                onTap: () {},
                child: DottedBorderBox(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.add_circle_outline, color: Colors.grey),
                        SizedBox(width: 8),
                        Text(
                          "Add Invoice",
                          style: TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ), appBar:buildCustomAppBar(context)),
    );
  }

  InputDecoration _fieldDecoration() {
    return InputDecoration(
      filled: true,

      contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    );
  }

  Widget buildCustomAppBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(24.w, 12.h, 24.w, 24.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              context.go('/home');
    },
              child: Icon(Icons.arrow_back_ios_new_outlined, color: Colors.white)),
          Text(
            'Add Expense',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          Container(
            width: 40.w,
            height: 40.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.67.r),
              color: Colors.white.withOpacity(0.1),
            ),
            child: Icon(
              Icons.more_horiz,
              color: Colors.white,
              size: 24.w,
            ),
          ),
        ],
      ),
    );
  }
}
