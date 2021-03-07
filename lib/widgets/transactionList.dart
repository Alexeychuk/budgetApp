import 'package:budgetApp/models/transaction.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;
  TransactionList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: transactions.isEmpty
            ? LayoutBuilder(
                builder: (ctx, constraints) => Column(
                      children: <Widget>[
                        Text('No transactions added',
                            style: Theme.of(context).textTheme.headline6),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: constraints.maxHeight * 0.6,
                          child: Image.asset(
                            'assets/images/waiting.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ))
            : ListView(
                children: transactions
                    .map((transaction) => TransactionListItem(
                        key: ValueKey(transaction.id),
                        transaction: transaction,
                        deleteTransaction: deleteTransaction))
                    .toList()));
  }
}
