import 'package:flutter/material.dart';

class DetailCashFlow extends StatelessWidget {
  final List<Map<String, dynamic>>
      cashFlowData; // List data pemasukan dan pengeluaran

  DetailCashFlow({required this.cashFlowData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Cash Flow'),
      ),
      body: ListView.builder(
        itemCount: cashFlowData.length,
        itemBuilder: (context, index) {
          final item = cashFlowData[index];
          final isExpense = item['type'] ==
              'expense'; // Memeriksa jenis data (pengeluaran atau pemasukan)

          return ListTile(
            title: Text(item['description']),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  isExpense
                      ? '- Rp ${item['amount']}'
                      : '+ Rp ${item['amount']}',
                  style: TextStyle(
                    color: isExpense ? Colors.red : Colors.green,
                  ),
                ),
                Text(
                  'Tanggal: 29-09-2023',
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            trailing: Icon(
              isExpense
                  ? Icons.arrow_forward_ios_rounded
                  : Icons.arrow_back_ios_rounded,
              color: isExpense ? Colors.red : Colors.green,
            ),
          );
        },
      ),
    );
  }
}
