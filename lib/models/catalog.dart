import 'package:flutter/material.dart';

class StoreCategory {
  const StoreCategory({required this.label, required this.icon});
  final String label;
  final IconData icon;
}

class HeroSlideData {
  const HeroSlideData({required this.imageUrl});
  final String imageUrl;
}

class Product {
  const Product({
    required this.name,
    required this.price,
    required this.imageUrl,
  });
  final String name;
  final String price;
  final String imageUrl;
}
