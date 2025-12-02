import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WARIT SHOP',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'WARIT SHOP'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _receiveController = TextEditingController();

  double _total = 0.0;
  double _change = 0.0;

  @override
  void dispose() {
    _priceController.dispose();
    _amountController.dispose();
    _receiveController.dispose();
    super.dispose();
  }

  void _calculateTotal() {
    final priceValue = double.tryParse(_priceController.text);
    final amountValue = double.tryParse(_amountController.text);
    if (priceValue == null || amountValue == null) {
      return;
    }

    setState(() {
      _total = priceValue * amountValue;
    });
  }

  void _calculateChange() {
    final receiveValue = double.tryParse(_receiveController.text);
    if (receiveValue == null) {
      return;
    }

    setState(() {
      _change = receiveValue - _total;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text("Calculate", style: TextStyle(fontSize: 44, fontFamily: 'maaja', fontStyle: FontStyle.italic, color: Colors.blue, fontWeight: FontWeight.bold, backgroundColor: Colors.pinkAccent)),
            Image.asset("assets/banana.png", width: 150, height: 150),
            Image.network("https://media4.giphy.com/media/v1.Y2lkPTc5MGI3NjExaHM4ZG05MTE4dzlhZjUwdm93M2IwY2tvd2FyZGsxZzBxMTljdjFseiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/Z5xk7fGO5FjjTElnpT/giphy.gif", width: 150, height: 150),
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
            const TextInputType.numberWithOptions(decimal: true, signed: false),
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
          const TextInputType.numberWithOptions(decimal: true, signed: false),
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
}
