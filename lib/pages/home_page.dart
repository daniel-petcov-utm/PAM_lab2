import 'package:flutter/material.dart';

import '../data/store_data.dart';
import '../models/catalog.dart';
import 'product_details_page.dart';
import '../widgets/product_widgets.dart';
import '../widgets/store_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedCategory = 0;
  int _heroPage = 0;
  final _heroController = PageController();

  @override
  void dispose() {
    _heroController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: ListView(
        padding: const EdgeInsets.only(bottom: 28),
        children: [
          const StoreTopBar(),
          const SizedBox(height: 20),
          CategorySelector(
            selectedIndex: _selectedCategory,
            onSelected: (index) => setState(() => _selectedCategory = index),
          ),
          const SizedBox(height: 32),
          HeroCarousel(
            controller: _heroController,
            currentPage: _heroPage,
            onPageChanged: (index) => setState(() => _heroPage = index),
          ),
          const SizedBox(height: 34),
          const SectionHeading(title: 'Feature Products'),
          const SizedBox(height: 20),
          SizedBox(
            height: 282,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 38),
              scrollDirection: Axis.horizontal,
              itemCount: featuredProducts.length,
              separatorBuilder: (_, _) => const SizedBox(width: 22),
              itemBuilder: (_, index) {
                final product = featuredProducts[index];
                return ProductCard(
                  product: product,
                  onTap: () => _openProduct(product),
                );
              },
            ),
          ),
          const SizedBox(height: 22),
          const PromoBanner(
            kicker: 'NEW COLLECTION',
            title: 'HANG OUT\n& PARTY',
            imageUrl: 'assets/images/new_collection_girl.png',
          ),
          const SizedBox(height: 45),
          const SectionHeading(title: 'Recommended'),
          const SizedBox(height: 20),
          SizedBox(
            height: 83,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 38),
              scrollDirection: Axis.horizontal,
              itemCount: recommendedProducts.length,
              separatorBuilder: (_, _) => const SizedBox(width: 18),
              itemBuilder: (_, index) {
                final product = recommendedProducts[index];
                return RecommendationCard(
                  product: product,
                  onTap: () => _openProduct(product),
                );
              },
            ),
          ),
          const SizedBox(height: 44),
          const SectionHeading(title: 'Top Collection'),
          const SizedBox(height: 28),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: CollectionGrid(),
          ),
        ],
      ),
    ),
  );

  void _openProduct(Product product) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => ProductDetailsPage(product: product)),
    );
  }
}
