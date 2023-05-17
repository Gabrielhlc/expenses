import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    super.key,
    required this.tr,
    required this.onRemoveTransaction,
  });

  final Transaction tr;
  final void Function(String p1) onRemoveTransaction;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
              child: Text('R\$${tr.value}'),
            ),
          ),
        ),
        title: Text(
          tr.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle: Text(DateFormat('d MMM y').format(tr.date)),
        trailing: MediaQuery.of(context).size.width > 480
            ? TextButton.icon(
                onPressed: () => onRemoveTransaction(tr.id),
                icon: const Icon(Icons.delete),
                label: const Text('Excluir'),
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(
                      Theme.of(context).colorScheme.error),
                ),
              )
            : IconButton(
                onPressed: () => onRemoveTransaction(tr.id),
                icon: const Icon(Icons.delete),
                color: Theme.of(context).colorScheme.error,
              ),
      ),
    );
  }
}
