import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:math' as math;

@RoutePage()
class QiblaScreen extends StatefulWidget {
  const QiblaScreen({super.key});

  @override
  State<QiblaScreen> createState() => _QiblaScreenState();
}

class _QiblaScreenState extends State<QiblaScreen>
    with SingleTickerProviderStateMixin {
  double? direction;
  double? qiblaDirection;
  late AnimationController _animationController;
  Position? currentPosition;
  bool isCalibrating = false;
  // Pusula dinleyicisini tutmak için
  StreamSubscription<CompassEvent>? _compassSubscription;

  // Kabe'nin koordinatları
  final double kaabaLat = 21.422487;
  final double kaabaLng = 39.826206;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _startListening();
    _getCurrentLocation();
  }

  @override
  void dispose() {
    _animationController.dispose();
    // Pusula dinleyicisini iptal et
    _compassSubscription?.cancel();
    super.dispose();
  }

  Future<void> _getCurrentLocation() async {
    try {
      final position = await Geolocator.getCurrentPosition();
      if (!mounted) return; // mounted kontrolü
      setState(() {
        currentPosition = position;
        _calculateQiblaDirection();
      });
    } catch (e) {
      debugPrint('Konum alınamadı: $e');
    }
  }

  void _calculateQiblaDirection() {
    if (currentPosition == null) return;

    final userLat = currentPosition!.latitude;
    final userLng = currentPosition!.longitude;

    // Kıble açısını hesapla
    final latDiff = kaabaLat - userLat;
    final lngDiff = kaabaLng - userLng;
    final angle = math.atan2(lngDiff, latDiff);
    setState(() {
      qiblaDirection = angle * 180 / math.pi;
    });
  }

  void _startListening() {
    _compassSubscription = FlutterCompass.events?.listen((event) {
      if (!mounted) return; // mounted kontrolü
      setState(() {
        direction = event.heading;
        if (direction != null) {
          _animationController.value = direction! / 360;
        }
      });
    });
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
          'Kıble Pusulası',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 32),
          _buildCompassStatus(),
          const SizedBox(height: 16),
          _buildQiblaInfo(),
          const SizedBox(height: 16),
          Expanded(
            child: _buildCompass(),
          ),
          const SizedBox(height: 32),
          _buildInstructions(),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildCompassStatus() {
    if (direction == null) {
      return const Card(
        margin: EdgeInsets.symmetric(horizontal: 16),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(Icons.warning_amber_rounded, color: Colors.orange),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Pusula kalibre ediliyor. Lütfen cihazınızı 8 şeklinde hareket ettirin.',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      );
    }

    // Kıble durumuna göre mesaj göster
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      color: _isQiblaFound() ? Colors.green.shade50 : Colors.orange.shade50,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(
              _isQiblaFound() ? Icons.check_circle : Icons.info_outline,
              color: _isQiblaFound() ? Colors.green : Colors.orange,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                _isQiblaFound()
                    ? 'Kıble bulundu! Telefonunuz Kâbe\'yi gösteriyor.'
                    : 'Telefonu yeşil ok yönünde çevirin.',
                style: TextStyle(
                  fontSize: 16,
                  color: _isQiblaFound()
                      ? Colors.green.shade900
                      : Colors.orange.shade900,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCompass() {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Dış çerçeve
        Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey.shade300, width: 2),
            gradient: RadialGradient(
              colors: [
                Colors.grey.shade100,
                Colors.white,
              ],
            ),
          ),
        ),
        // Pusula
        if (direction != null)
          AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return Transform.rotate(
                angle: (direction! * math.pi / 180) * -1,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      'assets/images/kible.png',
                      width: 260,
                      height: 260,
                    ),
                    // Kıble yönü
                    if (qiblaDirection != null)
                      Transform.rotate(
                        angle: ((qiblaDirection! + direction!) * math.pi / 180),
                        child: const Icon(
                          Icons.location_on,
                          color: Colors.green,
                          size: 40,
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
        // Merkez nokta - Kıble bulunduğunda yeşil, bulunamadığında kırmızı
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: _isQiblaFound() ? Colors.green : Colors.red,
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }

  // Kıble yönünün bulunup bulunmadığını kontrol eden metod
  bool _isQiblaFound() {
    if (qiblaDirection == null || direction == null) return false;

    // Kıble yönü ile mevcut yön arasındaki farkı hesapla
    final difference = (qiblaDirection! + direction!).abs() % 360;
    // 5 derecelik bir tolerans ile kıble yönünü kontrol et
    return difference <= 5 || difference >= 355;
  }

  Widget _buildQiblaInfo() {
    if (currentPosition == null ||
        qiblaDirection == null ||
        direction == null) {
      return const SizedBox.shrink();
    }

    // Kıble açısı farkını hesapla
    final difference = (qiblaDirection! + direction!).abs() % 360;
    final angleToTurn = difference <= 180 ? difference : 360 - difference;

    // Kabe'ye olan uzaklığı hesapla (km cinsinden)
    final distance = Geolocator.distanceBetween(
          currentPosition!.latitude,
          currentPosition!.longitude,
          kaabaLat,
          kaabaLng,
        ) /
        1000; // metreyi kilometreye çevir

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildInfoItem(
                    icon: Icons.rotate_right,
                    title: 'Dönüş Açısı',
                    value: '${angleToTurn.toStringAsFixed(1)}°',
                    color: _isQiblaFound() ? Colors.green : Colors.orange,
                  ),
                  _buildInfoItem(
                    icon: Icons.location_on,
                    title: 'Kabe\'ye Uzaklık',
                    value: '${distance.toStringAsFixed(0)} km',
                    color: Colors.blue,
                  ),
                  _buildInfoItem(
                    icon: Icons.compass_calibration,
                    title: 'Kıble Açısı',
                    value: '${qiblaDirection!.toStringAsFixed(1)}°',
                    color: Colors.purple,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoItem({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
  }) {
    return Expanded(
      child: Column(
        children: [
          Icon(icon, color: color),
          const SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: color,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildInstructions() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Column(
        children: [
          Text(
            'Kıbleyi Bulmak İçin',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            '1. Telefonunuzu düz tutun\n'
            '2. Yeşil ok Kâbe\'yi gösterir\n'
            '3. Telefonu ok yönünde çevirin',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
