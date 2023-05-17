import 'package:flutter/material.dart';
import '../models/transaction.dart';

import 'transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemoveTransaction;

  const TransactionList(this.transactions, this.onRemoveTransaction,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: <Widget>[
                const SizedBox(height: 20),
                Text(
                  'Nenhuma transação cadastrada!',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          })
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              final tr = transactions[index];
              return TransactionItem(
                tr: tr,
                onRemoveTransaction: onRemoveTransaction,
              );
            },
          );
  }
}
