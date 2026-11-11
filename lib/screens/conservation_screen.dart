import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// ConservationScreen provides educational material on wildlife conservation,
/// major survival threats, practical citizen actions, and SDG 15 alignment.
class ConservationScreen extends StatelessWidget {
  const ConservationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.warmOffWhite,
      appBar: AppBar(
        titleSpacing: 16,
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                color: AppTheme.paleSage,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.shield_rounded,
                color: AppTheme.forestGreen,
                size: 22,
              ),
            ),
            const SizedBox(width: 10),
            const Expanded(
              child: Text(
                'Conservation & SDG 15',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w800,
                  color: AppTheme.forestGreen,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section: SDG 15 Dedicated Card (Official Prompt Mandate)
            _buildSdg15Card(),
            const SizedBox(height: 24),

            // Section: Why Endangered Species Matter
            _buildSectionHeader(
              title: 'Why Endangered Species Matter',
              icon: Icons.public_rounded,
              color: AppTheme.forestGreen,
            ),
            const SizedBox(height: 10),
            _buildInfoCard(
              title: 'Ecosystem Balance & The Web of Life',
              description:
                  'Every species performs a specialized role in its ecosystem. When an apex predator like the tiger or a keystone seed disperser like the Asian elephant disappears, an ecological domino effect (known as a trophic cascade) occurs. This leads to rampant overgrazing, forest die-offs, altered river flows, and diminished soil fertility.',
              accentColor: AppTheme.emeraldGreen,
            ),
            const SizedBox(height: 12),
            _buildInfoCard(
              title: 'Biodiversity and Human Survival',
              description:
                  'Biodiversity is not just about exotic wildlife in remote lands; it directly underpins human agriculture, clean freshwater purification, medicine development, and climate regulation. Over 70% of modern cancer medicines and antibiotics trace their molecular roots to wild terrestrial organisms and rainforest plants.',
              accentColor: AppTheme.pineGreen,
            ),
            const SizedBox(height: 24),

            // Section: The Five Major Threats to Wildlife
            _buildSectionHeader(
              title: 'Primary Threats to Global Wildlife',
              icon: Icons.warning_amber_rounded,
              color: AppTheme.terracotta,
            ),
            const SizedBox(height: 12),
            _buildThreatCard(
              title: '1. Habitat Destruction & Fragmentation',
              description:
                  'Agricultural expansion, commercial logging, mining, and highway corridors slice vast animal territories into tiny isolated pockets, leading to genetic stagnation and frequent human-wildlife conflict.',
              icon: Icons.forest_outlined,
            ),
            const SizedBox(height: 10),
            _buildThreatCard(
              title: '2. Poaching & Illegal Wildlife Trade',
              description:
                  'A multi-billion dollar illicit underground market fuels the slaughter of rhinos, elephants, big cats, and pangolins for bogus traditional remedies, ornamental status symbols, and black-market exotic pets.',
              icon: Icons.gavel_rounded,
            ),
            const SizedBox(height: 10),
            _buildThreatCard(
              title: '3. Climate Change & Ocean Warming',
              description:
                  'Shifting weather extremes, prolonged droughts, melting polar ice caps, and coral bleaching disrupt migratory patterns, reproductive cycles, and food availability across global ecosystems.',
              icon: Icons.thermostat_rounded,
            ),
            const SizedBox(height: 10),
            _buildThreatCard(
              title: '4. Pollution & Plastic Waste',
              description:
                  'Chemical runoffs, pesticides, synthetic fertilizers, and millions of tonnes of discarded non-biodegradable plastics contaminate rivers, terrestrial soils, and marine food chains.',
              icon: Icons.delete_outline_rounded,
            ),
            const SizedBox(height: 10),
            _buildThreatCard(
              title: '5. Invasive Species',
              description:
                  'Non-native predatory mammals, insects, and aggressive plants introduced by international shipping outcompete indigenous wildlife, decimate ground-nesting birds, and alter local water tables.',
              icon: Icons.bug_report_outlined,
            ),
            const SizedBox(height: 24),

            // Section: Tangible Student & Citizen Actions
            _buildSectionHeader(
              title: 'Practical Actions You Can Take Today',
              icon: Icons.volunteer_activism_rounded,
              color: AppTheme.forestGreen,
            ),
            const SizedBox(height: 12),
            _buildActionItem(
              number: '01',
              title: 'Practice Conscious & Ethical Consumption',
              text:
                  'Choose sustainably certified products (RSPO palm oil, FSC wood and paper). Refuse souvenirs made from turtle shells, ivory, animal skins, or shark fins.',
            ),
            const SizedBox(height: 10),
            _buildActionItem(
              number: '02',
              title: 'Reduce Plastic Footprint & Recycle E-Waste',
              text:
                  'Eliminate single-use plastics and recycle obsolete smartphones and laptops. Recycling electronics recovers coltan and tantalum, directly saving gorilla habitats in Central Africa.',
            ),
            const SizedBox(height: 10),
            _buildActionItem(
              number: '03',
              title: 'Support Verified Community Conservation',
              text:
                  'Back conservation groups that employ local indigenous rangers and share tourism revenues directly with bordering farming communities.',
            ),
            const SizedBox(height: 10),
            _buildActionItem(
              number: '04',
              title: 'Participate in Citizen Science',
              text:
                  'Use community apps like iNaturalist and eBird to record local flora and fauna observations, contributing real field data to conservation researchers globally.',
            ),
            const SizedBox(height: 10),
            _buildActionItem(
              number: '05',
              title: 'Advocate & Spread Environmental Literacy',
              text:
                  'Share factual conservation stories with classmates and families to debunk superstition and foster empathy toward non-human creatures.',
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  /// Official SDG 15 Alignment Card required by specification.
  Widget _buildSdg15Card() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: AppTheme.forestGreen.withValues(alpha: 0.3),
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: AppTheme.forestGreen.withValues(alpha: 0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Banner Header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: const BoxDecoration(
              color: AppTheme.forestGreen,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(17),
                topRight: Radius.circular(17),
              ),
            ),
            child: Row(
              children: const [
                Icon(Icons.eco_rounded, color: AppTheme.paleSage, size: 22),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Aligned with UN Sustainable Development Goal 15: Life on Land',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13.5,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.2,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Exact Required Justification Text
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '"WildGuard supports SDG 15 by educating users about threatened wildlife, biodiversity, habitat loss, and conservation. By presenting species information and practical protection measures, the app encourages awareness and responsible action to protect terrestrial ecosystems and prevent biodiversity loss."',
                  style: TextStyle(
                    fontSize: 13.5,
                    fontStyle: FontStyle.italic,
                    height: 1.55,
                    color: AppTheme.textDark,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 14),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppTheme.paleSage.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Icon(Icons.water_rounded, color: AppTheme.pineGreen, size: 20),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Note: The gallery also includes selected marine species (such as the Blue Whale and Hawksbill Sea Turtle) to provide broader biodiversity awareness across interconnected biospheres, while its core educational focus remains dedicated to SDG 15 terrestrial habitats.',
                          style: TextStyle(
                            fontSize: 12,
                            height: 1.45,
                            color: AppTheme.textDark,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Educational Disclaimer: WildGuard is an educational student project created for academic demonstration. It does not claim official United Nations affiliation or imply direct measurable conservation outcomes.',
                  style: TextStyle(
                    fontSize: 11,
                    color: AppTheme.textLight,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader({
    required String title,
    required IconData icon,
    required Color color,
  }) {
    return Row(
      children: [
        Icon(icon, color: color, size: 22),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: AppTheme.textDark,
              letterSpacing: -0.2,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoCard({
    required String title,
    required String description,
    required Color accentColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppTheme.dividerColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 4,
                height: 18,
                decoration: BoxDecoration(
                  color: accentColor,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.textDark,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(
              fontSize: 13.5,
              height: 1.5,
              color: AppTheme.textMuted,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildThreatCard({
    required String title,
    required String description,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppTheme.dividerColor),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppTheme.statusCriticallyEndangeredBg,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: AppTheme.statusCriticallyEndangered, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.textDark,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 13,
                    height: 1.45,
                    color: AppTheme.textMuted,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionItem({
    required String number,
    required String title,
    required String text,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppTheme.dividerColor),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 32,
            height: 32,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppTheme.paleSage,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              number,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w800,
                color: AppTheme.forestGreen,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.textDark,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  text,
                  style: const TextStyle(
                    fontSize: 13,
                    height: 1.45,
                    color: AppTheme.textMuted,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
