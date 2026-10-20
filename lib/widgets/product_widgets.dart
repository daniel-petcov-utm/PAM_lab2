import 'package:flutter/material.dart';

import '../models/catalog.dart';
import 'store_widgets.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product, this.onTap});
  final Product product;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => Semantics(
    button: true,
    label: 'View ${product.name}',
    child: InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: SizedBox(
        width: 154,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                height: 205,
                width: 154,
                child: NetworkStoreImage(url: product.imageUrl),
              ),
            ),
            const SizedBox(height: 13),
            Text(
              product.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 5),
            Text(
              product.price,
              style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w800),
            ),
          ],
        ),
      ),
    ),
  );
}

class RecommendationCard extends StatelessWidget {
  const RecommendationCard({super.key, required this.product, this.onTap});
  final Product product;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => Semantics(
    button: true,
    label: 'View ${product.name}',
    child: InkWell(
      borderRadius: BorderRadius.circular(9),
      onTap: onTap,
      child: Container(
        width: 255,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(9),
          boxShadow: const [BoxShadow(color: Color(0x10000000), blurRadius: 9)],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                width: 70,
                height: 66,
                child: NetworkStoreImage(url: product.imageUrl),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    product.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    product.price,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
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

class PromoBanner extends StatelessWidget {
  const PromoBanner({
    super.key,
    required this.kicker,
    required this.title,
    required this.imageUrl,
    this.darkTitle = false,
  });
  final String kicker, title, imageUrl;
  final bool darkTitle;
  @override
  Widget build(BuildContext context) => Container(
    height: 182,
    decoration: BoxDecoration(
      color: const Color(0xfff7f7f9),
      borderRadius: BorderRadius.circular(12),
    ),
    clipBehavior: Clip.antiAlias,
    child: Stack(
      children: [
        const Positioned(
          right: 15,
          top: 22,
          width: 145,
          height: 145,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Color(0xffe9eaee),
              shape: BoxShape.circle,
            ),
          ),
        ),
        const Positioned(
          right: 35,
          top: 43,
          width: 105,
          height: 105,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Color(0xfff1f2f5),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          right: 22,
          bottom: -7,
          width: 130,
          height: 184,
          child: Image.asset(imageUrl, fit: BoxFit.contain),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(26, 29, 18, 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '|  $kicker',
                style: const TextStyle(color: Color(0xff9aa1b2), fontSize: 14),
              ),
              const SizedBox(height: 28),
              Text(
                title,
                style: TextStyle(
                  fontSize: darkTitle ? 22 : 24,
                  height: 1.36,
                  color: darkTitle
                      ? const Color(0xff313443)
                      : const Color(0xff737b8d),
                  fontWeight: darkTitle ? FontWeight.w700 : FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

/// Image-only mosaic for the Top Collection section.
class CollectionGrid extends StatelessWidget {
  const CollectionGrid({super.key});

  @override
  Widget build(BuildContext context) => const Column(
    children: [
      CollectionImageTile(
        aspectRatio: 2.21,
        imageUrl: 'assets/images/banner_1.png',
      ),
      SizedBox(height: 18),
      CollectionImageTile(
        aspectRatio: 1.36,
        imageUrl: 'assets/images/banner_2.png',
      ),
      SizedBox(height: 18),
      Row(
        children: [
          Expanded(
            child: CollectionImageTile(
              aspectRatio: .80,
              imageUrl: 'assets/images/banner_3.png',
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: CollectionImageTile(
              aspectRatio: .80,
              imageUrl: 'assets/images/banner_4.png',
            ),
          ),
        ],
      ),
    ],
  );
}

class CollectionImageTile extends StatelessWidget {
  const CollectionImageTile({
    super.key,
    required this.aspectRatio,
    required this.imageUrl,
  });

  final double aspectRatio;
  final String imageUrl;

  @override
  Widget build(BuildContext context) => AspectRatio(
    aspectRatio: aspectRatio,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: NetworkStoreImage(url: imageUrl),
    ),
  );
}
