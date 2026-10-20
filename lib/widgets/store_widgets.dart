import 'package:flutter/material.dart';

import '../data/store_data.dart';
import '../models/catalog.dart';

class StoreTopBar extends StatelessWidget {
  const StoreTopBar({super.key});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 25),
    child: SizedBox(
      height: 65,
      child: Row(
        children: [
          const Icon(Icons.menu_rounded, size: 31, color: Color(0xff332b29)),
          const Expanded(
            child: Center(
              child: Text(
                'GemStore',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
            ),
          ),
          Stack(
            clipBehavior: Clip.none,
            children: const [
              Icon(
                Icons.notifications_none_rounded,
                size: 29,
                color: Color(0xff332b29),
              ),
              Positioned(
                right: 1,
                top: 1,
                child: CircleAvatar(
                  radius: 4,
                  backgroundColor: Color(0xffed4b72),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

class CategorySelector extends StatelessWidget {
  const CategorySelector({
    super.key,
    required this.selectedIndex,
    required this.onSelected,
  });
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: List.generate(categories.length, (index) {
      final category = categories[index];
      final selected = selectedIndex == index;
      return Semantics(
        button: true,
        selected: selected,
        label: category.label,
        child: InkWell(
          borderRadius: BorderRadius.circular(40),
          onTap: () => onSelected(index),
          child: SizedBox(
            width: 72,
            child: Column(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 180),
                  width: 52,
                  height: 52,
                  padding: EdgeInsets.all(selected ? 4 : 2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: selected
                        ? Border.all(color: const Color(0xff372b29), width: 2)
                        : null,
                  ),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: selected
                          ? const Color(0xff372b29)
                          : const Color(0xfff2f2f2),
                    ),
                    child: Icon(
                      category.icon,
                      color: selected ? Colors.white : const Color(0xffa9a9a9),
                      size: 26,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  category.label,
                  style: TextStyle(
                    fontSize: 12,
                    color: selected
                        ? const Color(0xff372b29)
                        : const Color(0xffb0b0b0),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }),
  );
}

class HeroCarousel extends StatelessWidget {
  const HeroCarousel({
    super.key,
    required this.controller,
    required this.currentPage,
    required this.onPageChanged,
  });
  final PageController controller;
  final int currentPage;
  final ValueChanged<int> onPageChanged;

  @override
  Widget build(BuildContext context) => SizedBox(
    height: 202,
    child: Stack(
      children: [
        PageView.builder(
          controller: controller,
          itemCount: heroSlides.length,
          onPageChanged: onPageChanged,
          itemBuilder: (_, index) => HeroSlide(slide: heroSlides[index]),
        ),
        Positioned(
          bottom: 11,
          left: 0,
          right: 0,
          child: IgnorePointer(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                heroSlides.length,
                (index) => CarouselDot(isActive: index == currentPage),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

class CarouselDot extends StatelessWidget {
  const CarouselDot({super.key, required this.isActive});
  final bool isActive;
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4),
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      width: isActive ? 12 : 6,
      height: isActive ? 12 : 6,
      padding: EdgeInsets.all(isActive ? 2 : 0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: isActive ? Border.all(color: Colors.white, width: 1.5) : null,
      ),
      child: const DecoratedBox(
        decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
      ),
    ),
  );
}

class HeroSlide extends StatelessWidget {
  const HeroSlide({super.key, required this.slide});
  final HeroSlideData slide;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 18),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Stack(
        fit: StackFit.expand,
        children: [
          NetworkStoreImage(url: slide.imageUrl),
          const Positioned(
            top: 27,
            right: 22,
            child: Text(
              'Autumn\nCollection\n2021',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                height: 1.42,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

class SectionHeading extends StatelessWidget {
  const SectionHeading({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 38),
    child: Row(
      children: [
        Expanded(
          child: FittedBox(
            alignment: Alignment.centerLeft,
            fit: BoxFit.scaleDown,
            child: Text(
              title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),
          ),
        ),
        const SizedBox(width: 12),
        const Text(
          'Show all',
          style: TextStyle(color: Color(0xff9e9e9e), fontSize: 16),
        ),
      ],
    ),
  );
}

class NetworkStoreImage extends StatelessWidget {
  const NetworkStoreImage({super.key, required this.url});
  final String url;

  @override
  Widget build(BuildContext context) {
    const fallback = ColoredBox(color: Color(0xffe7e7e7));
    final isAsset = url.startsWith('assets/');

    return isAsset
        ? Image.asset(
            url,
            fit: BoxFit.cover,
            errorBuilder: (_, _, _) => fallback,
          )
        : Image.network(
            url,
            fit: BoxFit.cover,
            errorBuilder: (_, _, _) => fallback,
          );
  }
}
