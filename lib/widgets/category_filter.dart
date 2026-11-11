import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// CategoryFilter displays a horizontal list of [ChoiceChip] widgets
/// enabling users to filter wildlife species by their taxonomic group.
class CategoryFilter extends StatelessWidget {
  final List<String> categories;
  final String selectedCategory;
  final ValueChanged<String> onSelected;

  const CategoryFilter({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onSelected,
  });

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'Mammals':
        return Icons.pets_rounded;
      case 'Birds':
        return Icons.flutter_dash_rounded;
      case 'Reptiles':
        return Icons.shield_rounded;
      case 'Amphibians':
        return Icons.water_drop_rounded;
      case 'Marine Life':
        return Icons.waves_rounded;
      case 'Freshwater':
        return Icons.water_rounded;
      default:
        return Icons.grid_view_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            for (int index = 0; index < categories.length; index++) ...[
              if (index > 0) const SizedBox(width: 8),
              _buildChoiceChip(categories[index]),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildChoiceChip(String category) {
    final isSelected = category == selectedCategory;

    return ChoiceChip(
      showCheckmark: false,
      avatar: Icon(
        _getCategoryIcon(category),
        size: 16,
        color: isSelected ? Colors.white : AppTheme.forestGreen,
      ),
      label: Text(category),
      selected: isSelected,
      onSelected: (selected) {
        if (selected) {
          onSelected(category);
        }
      },
      selectedColor: AppTheme.forestGreen,
      backgroundColor: Colors.white,
      labelStyle: TextStyle(
        fontSize: 13,
        fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
        color: isSelected ? Colors.white : AppTheme.textDark,
      ),
      side: BorderSide(
        color: isSelected ? AppTheme.forestGreen : AppTheme.dividerColor,
        width: 1,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
      ),
      elevation: isSelected ? 2 : 0,
      pressElevation: 1,
    );
  }
}
