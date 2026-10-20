import 'package:flutter/material.dart';

import '../models/catalog.dart';

/// Replace the placeholder image URLs here when final product photos are ready.
const categories = [
  StoreCategory(label: 'Women', icon: Icons.female_outlined),
  StoreCategory(label: 'Men', icon: Icons.male_outlined),
  StoreCategory(label: 'Accessories', icon: Icons.shopping_bag_outlined),
  StoreCategory(label: 'Beauty', icon: Icons.spa_outlined),
];

const heroSlides = [
  HeroSlideData(imageUrl: 'assets/images/carousel_1.png'),
  HeroSlideData(imageUrl: 'assets/images/carousel_1.png'),
  HeroSlideData(imageUrl: 'assets/images/carousel_1.png'),
];

const featuredProducts = [
  Product(
    name: 'Turtleneck Sweater',
    price: r'$ 39.99',
    imageUrl: 'assets/images/featured_sweater.png',
  ),
  Product(
    name: 'Long Sleeve Dress',
    price: r'$ 45.00',
    imageUrl: 'assets/images/featured_dress.png',
  ),
  Product(
    name: 'Sportwear Set',
    price: r'$ 80.00',
    imageUrl: 'assets/images/featured_sweater.png',
  ),
];

const recommendedProducts = [
  Product(
    name: 'White fashion hoodie',
    price: r'$ 29.00',
    imageUrl: 'assets/images/recommended-1.png',
  ),
  Product(
    name: 'Cotton T-shirt',
    price: r'$ 30.00',
    imageUrl: 'assets/images/recommended-2.png',
  ),
];
