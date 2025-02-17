import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class ZikirmatikScreen extends StatefulWidget {
  const ZikirmatikScreen({super.key});

  @override
  State<ZikirmatikScreen> createState() => _ZikirmatikScreenState();
}

class _ZikirmatikScreenState extends State<ZikirmatikScreen> {
  int _counter = 0;
  int _selectedZikirIndex = 0;
  final List<String> _zikirler = [
    'Sübhanallah',
    'Elhamdülillah',
    'Allahu Ekber',
    'La ilahe illallah',
    'Estağfirullah',
    'SubhanAllahi ve bihamdihi',
    'La havle vela kuvvete illa billah',
  ];

  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  Future<void> _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = prefs.getInt('counter_$_selectedZikirIndex') ?? 0;
    });
  }

  Future<void> _saveCounter() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('counter_$_selectedZikirIndex', _counter);
  }

  void _incrementCounter() {
    HapticFeedback.lightImpact();
    setState(() {
      _counter++;
    });
    _saveCounter();
  }

  void _resetCounter() {
    HapticFeedback.mediumImpact();
    setState(() {
      _counter = 0;
    });
    _saveCounter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.router.back(),
        ),
        title: const Text(
          'Zikirmatik',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).colorScheme.primary.withOpacity(0.8),
              Theme.of(context).colorScheme.secondary.withOpacity(0.5),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: DropdownButton<int>(
                      isExpanded: true,
                      value: _selectedZikirIndex,
                      items: List.generate(
                        _zikirler.length,
                        (index) => DropdownMenuItem(
                          value: index,
                          child: Text(
                            _zikirler[index],
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            _selectedZikirIndex = value;
                          });
                          _loadCounter();
                        }
                      },
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: _incrementCounter,
                  onLongPress: _resetCounter,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Card(
                          elevation: 12,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(24),
                            child: Text(
                              _counter.toString(),
                              style: const TextStyle(
                                fontSize: 72,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          _zikirler[_selectedZikirIndex],
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildActionButton(
                      icon: Icons.add,
                      onPressed: _incrementCounter,
                    ),
                    _buildActionButton(
                      icon: Icons.refresh,
                      onPressed: _resetCounter,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(24),
        backgroundColor: Colors.white,
      ),
      child: Icon(
        icon,
        size: 32,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
