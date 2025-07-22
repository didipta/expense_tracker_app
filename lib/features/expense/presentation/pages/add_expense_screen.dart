import 'package:expense_tracker_app/features/expense/domain/entities/expense.dart';
import 'package:expense_tracker_app/shared/widgets/layout_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../blocs/expense_bloc.dart';
import '../blocs/expense_event.dart';
import '../blocs/expense_state.dart';
import '../widgets/dottedborderbox.dart';
import '../widgets/label.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final TextEditingController nameController =
  TextEditingController();
  final TextEditingController amountController =
  TextEditingController();
  DateTime selectedDate = DateTime.now();

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

    return BlocListener<ExpenseBloc, ExpenseState>(
      listener: (context, state) {
        if (state is ExpenseAddedState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Expense saved successfully!')),
          );
          context.go('/home');
        } else if (state is ExpenseError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: ${state.message}')),
          );
        }
      },
      child: Scaffold(
        body: LayoutBody(
          child: Padding(
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
                    decoration: _fieldDecoration().copyWith(
                      hintText: "Enter expense name",
                      border: OutlineInputBorder(
                        borderRadius: borderRadius,
                        borderSide: BorderSide(color: theme.primaryColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: borderRadius,
                        borderSide: BorderSide(color: theme.primaryColor),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Label("Amount"),
                  Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      TextField(
                        controller: amountController,
                        decoration: _fieldDecoration().copyWith(
                          hintText: "Enter amount",
                          prefixText: '\$ ',
                          prefixStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: theme.primaryColor,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: borderRadius,
                            borderSide: BorderSide(color: theme.primaryColor),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: borderRadius,
                            borderSide: BorderSide(color: theme.primaryColor),
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
                            style: TextStyle(color: theme.primaryColor),
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
                          hintText:
                          DateFormat('EEE, dd MMM yyyy').format(selectedDate),
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
                      child: SizedBox(
                        height: 50.h,
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
                  const SizedBox(height: 20),
                  BlocBuilder<ExpenseBloc, ExpenseState>(
                    builder: (context, state) {
                      final isLoading = state is ExpenseLoading;

                      return ElevatedButton(
                        onPressed: isLoading
                            ? null
                            : () {
                          final title = nameController.text;
                          final amount = int.tryParse(amountController.text) ?? 0;

                          final newExpense = Expense(
                            amount: amount,
                            date: selectedDate,
                            title: title,
                          );

                          context.read<ExpenseBloc>().add(AddExpenseEvent(newExpense));
                        },
                        child: isLoading
                            ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                            : Center(
                          child: Text(
                            "Save Expense",
                            style: theme.textTheme.titleMedium
                                ?.copyWith(color: Colors.white),
                          ),
                        ),
                      );
                    },
                  ),

                ],
              ),
            ),
          ),
          appBar: buildCustomAppBar(context),
        ),
      ),
    );
  }

  InputDecoration _fieldDecoration() {
    return InputDecoration(
      filled: true,
      contentPadding:
      const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    );
  }

  PreferredSizeWidget buildCustomAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(80.h),
      child: Padding(
        padding: EdgeInsets.fromLTRB(24.w, 12.h, 24.w, 24.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
                onTap: () {
                  context.go('/home');
                },
                child: const Icon(Icons.arrow_back_ios_new_outlined,
                    color: Colors.white)),
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
      ),
    );
  }
}
