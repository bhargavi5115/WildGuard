import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// AboutScreen presents WildGuard's conservation mission, taxonomy standards,
/// UN Sustainable Development Goal 15 alignment, official API attributions, and legal disclaimers.
class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

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
                Icons.info_rounded,
                color: AppTheme.forestGreen,
                size: 22,
              ),
            ),
            const SizedBox(width: 10),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About WildGuard',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w800,
                      color: AppTheme.forestGreen,
                      letterSpacing: -0.3,
                    ),
                  ),
                  Text(
                    'Mission • Standards • Attributions',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 10.5,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.emeraldGreen,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
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
            // App Branding Hero Card
            _buildBrandingCard(),
            const SizedBox(height: 24),

            // Conservation Mission & Purpose
            _buildSectionHeader('Conservation Mission', Icons.eco_rounded),
            const SizedBox(height: 10),
            _buildMissionCard(),
            const SizedBox(height: 24),

            // UN SDG 15 Alignment Section
            _buildSectionHeader('UN SDG 15 Alignment', Icons.public_rounded),
            const SizedBox(height: 10),
            _buildSdgSummaryCard(),
            const SizedBox(height: 24),

            // Conservation Reference Standards
            _buildSectionHeader('Conservation Classification Standards', Icons.fact_check_rounded),
            const SizedBox(height: 10),
            _buildStandardItem(
              title: 'IUCN Red List of Threatened Species',
              body:
                  'The international gold standard for assessing global extinction risk. WildGuard adopts official IUCN classifications: Critically Endangered (CR), Endangered (EN), and Vulnerable (VU).',
            ),
            const SizedBox(height: 8),
            _buildStandardItem(
              title: 'Official Wikimedia Commons Integration',
              body:
                  'Integrates dynamically with the official Wikimedia Commons API to discover openly licensed wildlife photography with full photographer attribution and Creative Commons licensing metadata.',
            ),
            const SizedBox(height: 8),
            _buildStandardItem(
              title: 'Offline-First Wildlife Architecture',
              body:
                  'Bundles essential taxonomic facts, geographic ranges, survival threats, and local fallback photography to guarantee full application availability even without active network access.',
            ),
            const SizedBox(height: 24),

            // Attributions & References
            _buildSectionHeader('Data & Asset References', Icons.menu_book_rounded),
            const SizedBox(height: 10),
            _buildAttributionCard(),
            const SizedBox(height: 24),

            // Disclaimer & Legal
            _buildSectionHeader('Disclaimer', Icons.gavel_rounded),
            const SizedBox(height: 10),
            _buildDisclaimerCard(),
            const SizedBox(height: 36),
          ],
        ),
      ),
    );
  }

  Widget _buildBrandingCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppTheme.dividerColor),
        boxShadow: [
          BoxShadow(
            color: AppTheme.forestGreen.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: AppTheme.forestGreen,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.forest_rounded,
              color: AppTheme.paleSage,
              size: 44,
            ),
          ),
          const SizedBox(height: 14),
          const Text(
            'WildGuard',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: AppTheme.forestGreen,
              letterSpacing: -0.3,
            ),
          ),
          const SizedBox(height: 3),
          const Text(
            'Discover • Protect • Preserve',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: AppTheme.emeraldGreen,
              letterSpacing: 0.8,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: AppTheme.paleSage,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              'Endangered Species Gallery • Version 1.0.0',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: AppTheme.forestGreen,
              ),
            ),
          ),
          const SizedBox(height: 14),
          const Text(
            'A modern, interactive wildlife conservation application dedicated to raising awareness for Earth\'s most imperiled species across terrestrial, freshwater, and marine biospheres.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13.5,
              height: 1.5,
              color: AppTheme.textMuted,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMissionCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.dividerColor),
      ),
      child: const Text(
        'WildGuard seeks to bridge scientific conservation research with everyday public awareness. By documenting threatened species, their ecological niches, survival challenges, and tangible citizen protection measures, we empower communities to take active roles in preserving global biodiversity.',
        style: TextStyle(
          fontSize: 13.5,
          height: 1.55,
          color: AppTheme.textDark,
        ),
      ),
    );
  }

  Widget _buildSdgSummaryCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.dividerColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Sustainable Development Goal 15: Life on Land',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: AppTheme.forestGreen,
            ),
          ),
          SizedBox(height: 6),
          Text(
            'Target 15.5 Mandate:\n"Take urgent and significant action to reduce the degradation of natural habitats, halt the loss of biodiversity and, by 2020, protect and prevent the extinction of threatened species."\n\nWildGuard translates this global conservation framework into an accessible educational experience, incorporating connected freshwater and marine species to reflect the holistic nature of planetary biodiversity.',
            style: TextStyle(
              fontSize: 13,
              height: 1.5,
              color: AppTheme.textMuted,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStandardItem({required String title, required String body}) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.dividerColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 13.5,
              fontWeight: FontWeight.w700,
              color: AppTheme.forestGreen,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            body,
            style: const TextStyle(
              fontSize: 12.5,
              height: 1.45,
              color: AppTheme.textDark,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAttributionCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.dividerColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            '• IUCN Red List of Threatened Species: Taxonomic names, conservation statuses, geographic ranges, and population metrics.',
            style: TextStyle(fontSize: 12.5, height: 1.45, color: AppTheme.textDark),
          ),
          SizedBox(height: 6),
          Text(
            '• World Wildlife Fund (WWF): Species factsheets, ecological niches, and frontline threat analyses.',
            style: TextStyle(fontSize: 12.5, height: 1.45, color: AppTheme.textDark),
          ),
          SizedBox(height: 6),
          Text(
            '• Official Wikimedia Commons API: Dynamic wildlife photography and metadata licensed under Creative Commons and Public Domain.',
            style: TextStyle(fontSize: 12.5, height: 1.45, color: AppTheme.textDark),
          ),
          SizedBox(height: 6),
          Text(
            '• CITES: Appendices regulating international trade in specimens of wild fauna and flora.',
            style: TextStyle(fontSize: 12.5, height: 1.45, color: AppTheme.textDark),
          ),
        ],
      ),
    );
  }

  Widget _buildDisclaimerCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.dividerColor),
      ),
      child: const Text(
        'WildGuard is an independent, non-commercial educational gallery. All factual scientific information is referenced from recognized global conservation databases. Media assets from Wikimedia Commons remain the copyright of their respective authors and are accessed in accordance with Creative Commons licensing standards.',
        style: TextStyle(
          fontSize: 12.5,
          height: 1.5,
          color: AppTheme.textMuted,
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: AppTheme.forestGreen, size: 20),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16.5,
              fontWeight: FontWeight.w700,
              color: AppTheme.textDark,
            ),
          ),
        ),
      ],
    );
  }
}
