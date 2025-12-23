import 'package:flutter/material.dart';

class CalculatePage extends StatefulWidget {
  const CalculatePage({Key? key}) : super(key: key);

  @override
  _CalculatePageState createState() => _CalculatePageState();
}

class _CalculatePageState extends State<CalculatePage> {
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _receiveController = TextEditingController();

  double _total = 0.0;
  double _change = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Calculate'), 
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              "Calculate",
              style: TextStyle(
                fontSize: 44,
                fontFamily: 'maaja',
                fontStyle: FontStyle.italic,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                backgroundColor: Colors.pinkAccent,
              ),
            ),
            Image.asset("assets/banana.png", width: 150, height: 150),
            Image.network(
              "https://media4.giphy.com/media/v1.Y2lkPTc5MGI3NjExaHM4ZG05MTE4dzlhZjUwdm93M2IwY2tvd2FyZGsxZzBxMTljdjFseiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/Z5xk7fGO5FjjTElnpT/giphy.gif",
              width: 150,
              height: 150,
            ),
            _priceTextField(),
            const SizedBox(height: 20),
            _amountTextField(),
            const SizedBox(height: 20),
            _calculateButton(),
            const SizedBox(height: 20),
            _showTotalText(),
            const SizedBox(height: 20),
            _receiveMoneyTextField(),
            const SizedBox(height: 20),
            _changeCalculateButton(),
            const SizedBox(height: 20),
            _showChangeText(),
          ],
        ),
      ),
    );
  }


  Widget _priceTextField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: _priceController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Price per item',
        ),
        keyboardType:
            const TextInputType.numberWithOptions(decimal: true),
      ),
    );
  }

  Widget _amountTextField() {
    return TextField(
      controller: _amountController,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Amount of items',
      ),
      keyboardType: TextInputType.number,
    );
  }

  Widget _calculateButton() {
    return ElevatedButton(
      onPressed: _calculateTotal,
      child: const Text('Calculate Total'),
    );
  }

  Widget _showTotalText() {
    return Text('Total: $_total Bath');
  }

  Widget _receiveMoneyTextField() {
    return TextField(
      controller: _receiveController,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Receive money',
      ),
      keyboardType:
          const TextInputType.numberWithOptions(decimal: true),
    );
  }

  Widget _changeCalculateButton() {
    return ElevatedButton(
      onPressed: _calculateChange,
      child: const Text('Calculate Change'),
    );
  }

  Widget _showChangeText() {
    return Text('Change: $_change Bath');
  }

  // ---------- logic ----------
  void _calculateTotal() {
    final price = double.tryParse(_priceController.text) ?? 0;
    final amount = double.tryParse(_amountController.text) ?? 0;

    setState(() {
      _total = price * amount;
    });
  }

  void _calculateChange() {
    final receive = double.tryParse(_receiveController.text) ?? 0;

    setState(() {
      _change = receive - _total;
    });
  }
}