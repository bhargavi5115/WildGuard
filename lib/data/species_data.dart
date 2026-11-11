import '../models/species.dart';

/// Comprehensive verified dataset of threatened and endangered wildlife species for WildGuard.
/// Factual content sourced from official IUCN Red List assessments, WWF factsheets, and CITES appendices.
class SpeciesData {
  SpeciesData._();

  /// List of category filters available in the gallery.
  static const List<String> categories = [
    'All',
    'Mammals',
    'Birds',
    'Reptiles',
    'Amphibians',
    'Marine Life',
    'Freshwater',
  ];

  /// The master collection of 53 authentic endangered wildlife species.
  static const List<Species> allSpecies = [
    // -------------------------------------------------------------------------
    // MAMMALS
    // -------------------------------------------------------------------------
    Species(
      id: 'bengal_tiger',
      commonName: 'Bengal Tiger',
      scientificName: 'Panthera tigris tigris',
      category: 'Mammals',
      conservationStatus: ConservationStatus.endangered,
      habitat: 'Tropical dry and moist deciduous forests, mangrove swamps, and alluvial grasslands.',
      geographicDistribution: 'India, Bangladesh, Nepal, and Bhutan',
      diet: 'Carnivore (chital deer, sambar, wild boar, gaur, water buffalo)',
      populationEstimate: '~3,500 – 4,500 mature individuals remaining in the wild',
      description:
          'The Bengal tiger is an iconic apex predator and keystone species. By regulating herbivore populations, it prevents overgrazing and safeguards forest vegetation and watersheds across the Indian subcontinent.',
      interestingFact:
          'No two tigers share identical stripe patterns; each pattern is entirely unique and functions just like human fingerprints for wildlife identification.',
      threats: [
        'Habitat fragmentation from infrastructure expansion',
        'Human-wildlife conflict near agricultural fringes',
        'Illegal poaching for traditional medicine markets',
        'Prey depletion caused by unregulated bushmeat hunting',
      ],
      conservationAction:
          'Protected reserve corridors under India\'s Project Tiger, community-based anti-poaching patrols, and real-time camera trap monitoring.',
      howYouCanHelp: [
        'Boycott products made from tiger bones, claws, or skins',
        'Support certified wildlife reserves that empower local forest communities',
        'Advocate for ecological wildlife underpasses and overpasses across highways',
      ],
      imageAssetPath: 'assets/images/tiger.jpg',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/97/Bengal_tiger_%28Panthera_tigris_tigris%29_female_3.jpg/640px-Bengal_tiger_%28Panthera_tigris_tigris%29_female_3.jpg',
      imageAttribution: 'Charles J. Sharp / Wikimedia Commons / CC BY-SA 4.0',
      sourceReference: 'IUCN Red List (2024 assessment) / WWF Species Factsheet',
    ),
    Species(
      id: 'asian_elephant',
      commonName: 'Asian Elephant',
      scientificName: 'Elephas maximus',
      category: 'Mammals',
      conservationStatus: ConservationStatus.endangered,
      habitat: 'Subtropical moist broadleaf forests and dry deciduous woodlands.',
      geographicDistribution: 'South and Southeast Asia (13 range states including India, Sri Lanka, Thailand)',
      diet: 'Herbivore (grasses, tree bark, roots, leaves, bananas, bamboo)',
      populationEstimate: '~40,000 – 50,000 wild individuals across 13 range states',
      description:
          'Asian elephants are celebrated "ecosystem engineers." Through their foraging and movement, they clear paths in dense forests, dig vital waterholes during droughts, and disperse seeds from dozens of tree species over long distances.',
      interestingFact:
          'An Asian elephant\'s trunk contains over 40,000 individual muscles, allowing it to fell large trees or delicately grasp a single blade of grass.',
      threats: [
        'Loss of historical migration corridors to human settlements',
        'Agricultural encroachment and crop-raiding retaliation',
        'Poaching of bull elephants for ivory tusks',
        'Electrocution from low-hanging power lines near plantations',
      ],
      conservationAction:
          'Establishing dedicated elephant corridors ("Right of Passage"), installing acoustic early-warning systems, and deploying chili-based bio-fences.',
      howYouCanHelp: [
        'Purchase deforestation-free, sustainably certified palm oil and coffee',
        'Never participate in abusive captive elephant rides or shows',
        'Support organizations purchasing land to reconnect fragmented migratory corridors',
      ],
      imageAssetPath: 'assets/images/asian_elephant.jpg',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/98/Elephas_maximus_%28Bandipur%29.jpg/640px-Elephas_maximus_%28Bandipur%29.jpg',
      imageAttribution: 'Yathin S Krishnappa / Wikimedia Commons / CC BY-SA 3.0',
      sourceReference: 'IUCN Red List (Elephas maximus) / IUCN SSC Asian Elephant Specialist Group',
    ),
    Species(
      id: 'amur_leopard',
      commonName: 'Amur Leopard',
      scientificName: 'Panthera pardus orientalis',
      category: 'Mammals',
      conservationStatus: ConservationStatus.criticallyEndangered,
      habitat: 'Temperate mixed broadleaf and coniferous forests.',
      geographicDistribution: 'Primorsky Krai (Russian Far East) and northeast China (Jilin Province)',
      diet: 'Carnivore (roe deer, sika deer, badgers, hares, wild boar)',
      populationEstimate: '~120 – 130 individuals surviving in the wild',
      description:
          'The Amur leopard is recognized as one of the world\'s rarest and most imperiled big cats. Perfectly adapted to freezing winters, its dense, cream-colored winter coat can grow up to 7.5 cm in thickness.',
      interestingFact:
          'Amur leopards can leap up to 5.8 meters horizontally and 3 meters vertically, frequently caching prey high in tree canopies away from competing predators.',
      threats: [
        'Extreme genetic inbreeding caused by a severely reduced gene pool',
        'Uncontrolled forest fires destroying Manchurian oak forests',
        'Scarcity of natural prey (roe deer and sika deer) from poaching',
        'Encroachment by logging and commercial infrastructure',
      ],
      conservationAction:
          'Expansion of the "Land of the Leopard" National Park in Russia, cross-border anti-poaching cooperation with China, and supplemental winter feeding of prey.',
      howYouCanHelp: [
        'Support camera-trap monitoring and winter ranger tracking programs',
        'Spread awareness about temperate big cat conservation',
        'Advocate for strong international trade bans on endangered cat pelts',
      ],
      imageAssetPath: 'assets/images/amur_leopard.jpg',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/Amur_Leopard_7.jpg/640px-Amur_Leopard_7.jpg',
      imageAttribution: 'Keven Law / Wikimedia Commons / CC BY-SA 2.0',
      sourceReference: 'IUCN Red List / Land of the Leopard National Park Research Reports',
    ),
    Species(
      id: 'sumatran_orangutan',
      commonName: 'Sumatran Orangutan',
      scientificName: 'Pongo abelii',
      category: 'Mammals',
      conservationStatus: ConservationStatus.criticallyEndangered,
      habitat: 'Primary tropical lowland rainforests and peat swamp forests.',
      geographicDistribution: 'Northern Sumatra (Aceh and North Sumatra provinces, Indonesia)',
      diet: 'Frugivore/Omnivore (wild figs, jackfruit, lianas, leaves, insects)',
      populationEstimate: '~13,800 individuals confined to fragmented forest blocks',
      description:
          'Sumatran orangutans are almost exclusively arboreal primates known for their profound intelligence and cultural transmission of tool use. They spend over 95% of their lives high in the canopy.',
      interestingFact:
          'Wild orangutans craft elaborate leaf umbrellas during heavy monsoon downpours and use twigs as probes to safely harvest honey from stingless bee hives.',
      threats: [
        'Rapid deforestation for industrial oil palm plantations',
        'Slash-and-burn peatland forest clearing and destructive wildfires',
        'Illegal pet trade targeting orphaned infant orangutans',
        'Construction of roadways slicing through the Leuser Ecosystem',
      ],
      conservationAction:
          'Safeguarding the 2.6-million-hectare Leuser Ecosystem, operating rehabilitation sanctuaries, and translocating stranded apes to secure reserves.',
      howYouCanHelp: [
        'Check food labels and demand certified deforestation-free sustainable palm oil (RSPO)',
        'Support grassroots anti-logging patrols in northern Sumatra',
        'Refuse to share social media content portraying captive primates as pets',
      ],
      imageAssetPath: 'assets/images/sumatran_orangutan.jpg',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/03/Pongo_abelii_in_Zoo_Zurich_1.jpg/640px-Pongo_abelii_in_Zoo_Zurich_1.jpg',
      imageAttribution: 'Adrian Michael / Wikimedia Commons / CC BY-SA 3.0',
      sourceReference: 'IUCN Red List / Sumatran Orangutan Conservation Programme (SOCP)',
    ),
    Species(
      id: 'bornean_orangutan',
      commonName: 'Bornean Orangutan',
      scientificName: 'Pongo pygmaeus',
      category: 'Mammals',
      conservationStatus: ConservationStatus.criticallyEndangered,
      habitat: 'Tropical and subtropical moist broadleaf forests, peat swamp forests, and dipterocarp woods.',
      geographicDistribution: 'Island of Borneo (shared by Indonesia, Malaysia, and Brunei)',
      diet: 'Omnivore (wild fruits, bark, shoots, seeds, bird eggs, insects)',
      populationEstimate: '~104,700 individuals remaining (over 60% decline since 1950)',
      description:
          'Distinguished by their dark brown-to-maroon coats and broad cheek pads in dominant adult males, Bornean orangutans play an essential role in dispersing large-seeded forest trees that few other canopy dwellers can ingest.',
      interestingFact:
          'Bornean orangutans build a fresh, intricately woven sleeping nest in the canopy every single evening, complete with a mattress of leaves and a woven blanket.',
      threats: [
        'Forest fires and clearing for oil palm and pulp paper plantations',
        'Habitat fragmentation from logging concessions',
        'Illegal hunting and retaliation killings when entering fruit orchards',
        'Infant capture for illicit wildlife trade',
      ],
      conservationAction:
          'Establishing high-conservation-value (HCV) forest corridors, reforestation projects on degraded peatlands, and rescued ape rehabilitation at Sepilok and Nyaru Menteng.',
      howYouCanHelp: [
        'Support certified Forest Stewardship Council (FSC) timber and paper products',
        'Donate to orangutan rescue centers caring for displaced infants',
        'Support carbon offset projects that protect peat swamp forests',
      ],
    imageAssetPath: 'assets/images/bornean_orangutan.jpg',
    
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/be/Orang_Utan%2C_Semenggok_Forest_Reserve%2C_Sarawak%2C_Borneo%2C_Malaysia.JPG/640px-Orang_Utan%2C_Semenggok_Forest_Reserve%2C_Sarawak%2C_Borneo%2C_Malaysia.JPG',
      imageAttribution: 'Elemer/Wikimedia Commons / CC BY-SA 3.0',
      sourceReference: 'IUCN Red List (Pongo pygmaeus) / WWF Heart of Borneo Initiative',
    ),
    Species(
      id: 'javan_rhino',
      commonName: 'Javan Rhinoceros',
      scientificName: 'Rhinoceros sondaicus',
      category: 'Mammals',
      conservationStatus: ConservationStatus.criticallyEndangered,
      habitat: 'Dense tropical lowland rainforests, reed beds, and marshy coastal plains.',
      geographicDistribution: 'Confined strictly to Ujung Kulon National Park on the western tip of Java, Indonesia',
      diet: 'Herbivore/Browser (tender twigs, fallen fruits, young leaves, bamboo shoots)',
      populationEstimate: '~75 – 80 mature individuals surviving in a single national park',
      description:
          'The Javan rhino is among the most critically endangered large mammals on Earth. Featuring mosaic-patterned armor-like skin folds, this solitary browser survives in only one isolated refuge.',
      interestingFact:
          'Unlike African rhinos which boast two horns, female Javan rhinos typically have no horn at all, while males possess a modest single horn averaging only 25 cm.',
      threats: [
        'Extreme vulnerability to catastrophic tsunamis and Anak Krakatau volcanic eruptions',
        'Encroachment of invasive Arenga palm choking out native food plants',
        'Severe genetic bottleneck risk from total population isolation',
        'Ongoing threat of poaching syndicates targeting rhino horns',
      ],
      conservationAction:
          'Rhino Protection Units (RPUs) patrolling Ujung Kulon 24/7, manual eradication of invasive Arenga palm, and plans for a second wild subpopulation reserve.',
      howYouCanHelp: [
        'Support funding for anti-poaching ranger rations and thermal tracking equipment',
        'Advocate for international agreements enforcing CITES Appendix I protections',
        'Help educate peers on the medical falsehood of rhino horn efficacy',
      ],
      imageAssetPath: 'assets/images/javan_rhino.jpg',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/66/Rhinoceros_sondaicus.jpg/640px-Rhinoceros_sondaicus.jpg',
      imageAttribution: 'Biodiversity Heritage Library / Wikimedia Commons / CC BY 2.0',
      sourceReference: 'IUCN Red List / International Rhino Foundation (IRF) Annual Report',
    ),
    Species(
      id: 'black_rhino',
      commonName: 'Black Rhinoceros',
      scientificName: 'Diceros bicornis',
      category: 'Mammals',
      conservationStatus: ConservationStatus.criticallyEndangered,
      habitat: 'Semi-arid savannas, acacia scrublands, and riverine woodlands.',
      geographicDistribution: 'Southern and Eastern Africa (Namibia, South Africa, Kenya, Zimbabwe)',
      diet: 'Herbivore/Browser (woody shrubs, thorn bushes, acacia shoots, succulents)',
      populationEstimate: '~6,400 individuals in the wild (slowly recovering from ~2,400 in 1995)',
      description:
          'Distinguished by its pointed, prehensile upper lip adapted for grasping thorny acacia branches, the black rhino is a keystone megaherbivore that shapes savanna vegetation architectures.',
      interestingFact:
          'Despite weighing up to 1,400 kg, black rhinos can sprint at speeds reaching 55 km/h and turn rapidly on a tight radius while charging.',
      threats: [
        'Organized transnational crime syndicates poaching for illicit horn markets',
        'Habitat loss and fragmentation reducing breeding opportunities',
        'Civil instability disrupting wildlife ranger law enforcement',
        'Severe regional droughts exacerbated by changing climate patterns',
      ],
      conservationAction:
          'Community conservancies in Namibia, dehorning programs in high-risk zones, microchip horn tracking, and cross-border translocation to historical ranges.',
      howYouCanHelp: [
        'Support community-led conservation conservancies that share tourism revenue',
        'Help fund canine tracking units trained to intercept poached horns at airports',
        'Reject any luxury jewelry or carved decorative items containing rhino horn',
      ],
      imageAssetPath: 'assets/images/black_rhino.jpg',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5e/Diceros_bicornis_in_Chester_Zoo%2C_England.jpg/640px-Diceros_bicornis_in_Chester_Zoo%2C_England.jpg',
      imageAttribution: 'Peter Trimming / Wikimedia Commons / CC BY-SA 2.0',
      sourceReference: 'IUCN Red List / Save the Rhino International Data',
    ),
    Species(
      id: 'red_panda',
      commonName: 'Red Panda',
      scientificName: 'Ailurus fulgens',
      category: 'Mammals',
      conservationStatus: ConservationStatus.endangered,
      habitat: 'Temperate montane mixed coniferous and deciduous forests with dense bamboo understory.',
      geographicDistribution: 'Eastern Himalayas (Nepal, India, Bhutan, northern Myanmar, southwest China)',
      diet: 'Specialized Herbivore (98% bamboo leaves and shoots, supplemented by berries and acorns)',
      populationEstimate: '<10,000 mature wild individuals remaining across fragmented ranges',
      description:
          'The red panda is the sole living member of the ancient mammalian family Ailuridae. Adorned with reddish-brown fur and a bushy ringed tail, it serves as a critical indicator of Himalayan forest health.',
      interestingFact:
          'Like the unrelated giant panda, red pandas have an elongated wrist bone called a "false thumb" that functions as an opposable thumb to grasp slender bamboo stalks.',
      threats: [
        'Forest clearing for timber, firewood collection, and livestock grazing',
        'Accidental trapping in wire snares set for wild boar and musk deer',
        'Canine distemper virus transmission from feral village dogs',
        'Climate change pushing temperate bamboo bands to higher, fragmented elevations',
      ],
      conservationAction:
          'Community-based forest monitoring by Red Panda Network "Forest Guardians," vaccination of village domestic dogs, and introducing energy-efficient cookstoves.',
      howYouCanHelp: [
        'Support community-managed eco-tourism in the Singalila and Langtang ranges',
        'Purchase sustainable bio-briquettes to reduce Himalayan firewood logging',
        'Advocate for international wildlife snare clearance campaigns',
      ],
      imageAssetPath: 'assets/images/red_panda.jpg',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/RedPandaFullBody.JPG/640px-RedPandaFullBody.JPG',
      imageAttribution: 'Greg Hume / Wikimedia Commons / CC BY-SA 3.0',
      sourceReference: 'IUCN Red List / Red Panda Network Field Conservation Reports',
    ),
    Species(
      id: 'african_wild_dog',
      commonName: 'African Wild Dog',
      scientificName: 'Lycaon pictus',
      category: 'Mammals',
      conservationStatus: ConservationStatus.endangered,
      habitat: 'Open savannas, grasslands, and semi-arid scrub woodlands.',
      geographicDistribution: 'Fragmented pockets across Sub-Saharan Africa (Botswana, Zimbabwe, Tanzania, South Africa)',
      diet: 'Carnivore (impala, gazelles, kudu, warthogs, bushbuck)',
      populationEstimate: '~6,600 wild individuals across only 14 surviving pack populations',
      description:
          'Also called the Painted Wolf, the African wild dog is celebrated for its cooperative pack social structure and remarkable hunting coordination, achieving an extraordinary 80% hunt success rate.',
      interestingFact:
          'Packs make collective decisions through an acoustic "sneezing" voting system; more sneezes within the pack correspond to an immediate departure for a hunt.',
      threats: [
        'Extreme habitat fragmentation requiring vast uninterrupted hunting ranges',
        'Viral outbreaks of rabies and canine distemper contracted from domestic dogs',
        'Accidental snaring by bushmeat hunters setting wire loop traps',
        'Targeted retaliatory persecution by pastoralists defending livestock',
      ],
      conservationAction:
          'Fencing wildlife dispersal corridors, anti-snare ranger sweeps, GPS radio-collaring for early boundary warnings, and mobile domestic dog vaccination clinics.',
      howYouCanHelp: [
        'Support rabies vaccination drives for domestic dogs bordering wildlife reserves',
        'Contribute to snare-removal ranger teams across Southern Africa',
        'Promote predator-friendly livestock boma enclosures for rural farming communities',
      ],
      imageAssetPath: 'assets/images/african_wild_dog.jpg',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/ba/African_wild_dog_%28Lycaon_pictus_pictus%29.jpg/640px-African_wild_dog_%28Lycaon_pictus_pictus%29.jpg',
      imageAttribution: 'Charles J. Sharp / Wikimedia Commons / CC BY-SA 4.0',
      sourceReference: 'IUCN Red List / African Wildlife Foundation (AWF)',
    ),
    Species(
      id: 'mountain_gorilla',
      commonName: 'Mountain Gorilla',
      scientificName: 'Gorilla beringei beringei',
      category: 'Mammals',
      conservationStatus: ConservationStatus.endangered,
      habitat: 'Lush tropical montane and subalpine cloud forests at elevations of 2,200 to 4,300 meters.',
      geographicDistribution: 'Virunga Volcanoes (DR Congo, Rwanda, Uganda) and Bwindi Impenetrable National Park',
      diet: 'Herbivore (wild celery, bamboo shoots, giant lobelias, thistles, wood nettles)',
      populationEstimate: '~1,063 individuals surviving in two small isolated populations',
      description:
          'Possessing thicker and longer fur than lowland relatives to thrive in chilly misty volcanic highlands, mountain gorillas live in peaceful, tightly bonded social troops led by a mature silverback patriarch.',
      interestingFact:
          'Mountain gorillas share approximately 98.4% of their DNA sequence with humans, making them exquisitely vulnerable to human respiratory viruses.',
      threats: [
        'High risk of zoonotic disease transmission from humans and ecotourists',
        'Habitat degradation from illegal firewood gathering and charcoal production',
        'Collateral casualties from wire snares set for forest antelopes',
        'Armed regional civil conflicts encroaching into national park boundaries',
      ],
      conservationAction:
          'Pioneering "extreme conservation" protocols with dedicated Gorilla Doctors, strict 7-meter tourist distancing rules with face masks, and community revenue sharing.',
      howYouCanHelp: [
        'Always wear protective face masks and maintain strict distance when visiting great apes',
        'Recycle obsolete cell phones to reduce demand for illegal coltan mining in the Congo Basin',
        'Support clean-water and medical health programs for communities surrounding gorilla parks',
      ],
      imageAssetPath: 'assets/images/mountain_gorilla.jpg',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0d/Mountain_Gorilla_in_Uganda.jpg/640px-Mountain_Gorilla_in_Uganda.jpg',
      imageAttribution: 'Radu Sigheti / Wikimedia Commons / Public Domain',
      sourceReference: 'IUCN Red List / Dian Fossey Gorilla Fund International',
    ),
    Species(
      id: 'sumatran_tiger',
      commonName: 'Sumatran Tiger',
      scientificName: 'Panthera tigris sumatrae',
      category: 'Mammals',
      conservationStatus: ConservationStatus.criticallyEndangered,
      habitat: 'Lowland tropical rainforests, peat swamp forests, and sub-montane ridge woods.',
      geographicDistribution: 'Island of Sumatra, Indonesia',
      diet: 'Carnivore (wild pigs, muntjac deer, sambar, tapirs)',
      populationEstimate: '<400 wild individuals remaining in fragmented national park blocks',
      description:
          'The smallest of all surviving tiger subspecies, the Sumatran tiger evolved narrow, closely spaced stripes and webbed paws that allow it to maneuver swiftly through dense island jungles and swim across wide rivers in pursuit of prey.',
      interestingFact:
          'Sumatran tigers feature distinctive ruffs of long hair around their necks and cheeks, giving them a stately, bearded appearance compared to mainland tigers.',
      threats: [
        'Devastating deforestation driven by oil palm plantations and acacia paper concessions',
        'Poaching with nylon and steel wire cable snares',
        'Human-wildlife conflicts near villages bordering fragmented forests',
        'Depletion of native ungulate prey base',
      ],
      conservationAction:
          'Deployment of rapid-response SMART patrol units, establishing village conflict mitigation teams, and prosecuting illegal wildlife traffickers under Indonesian law.',
      howYouCanHelp: [
        'Support certified zero-deforestation paper and timber sourcing',
        'Contribute to anti-snare ranger teams active in Bukit Barisan Selatan and Kerinci Seblat',
        'Educate consumers against buying exotic cat bone remedies and taxidermy',
      ],
      imageAssetPath: 'assets/images/sumatran_tiger.jpg',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b9/Sumatran_Tiger_at_London_Zoo_2.jpg/640px-Sumatran_Tiger_at_London_Zoo_2.jpg',
      imageAttribution: 'Captain-tucker / Wikimedia Commons / CC BY-SA 3.0',
      sourceReference: 'IUCN Red List (Panthera tigris ssp. sumatrae) / Sumatran Tiger Trust',
    ),
    Species(
      id: 'saola',
      commonName: 'Saola',
      scientificName: 'Pseudoryx nghetinhensis',
      category: 'Mammals',
      conservationStatus: ConservationStatus.criticallyEndangered,
      habitat: 'Wet evergreen montane forests with little or no dry season.',
      geographicDistribution: 'Annamite Mountain Range along the border of Vietnam and Laos',
      diet: 'Herbivore/Browser (broadleaf foliage, fig leaves, herbs along mountain streams)',
      populationEstimate: '<100 individuals (possibly only dozens; none exist in captivity)',
      description:
          'Often hailed as the "Asian Unicorn," the saola was scientifically discovered only in 1992. Possessing long, gently curved parallel horns and vivid white facial markings, it is one of the most enigmatic large mammals on Earth.',
      interestingFact:
          'No biologist has ever observed a saola alive in the wild; its existence is confirmed through local indigenous knowledge, skeletal remains, and rare automatic camera trap images.',
      threats: [
        'Intensive commercial snaring with millions of wire loop traps set for bushmeat',
        'Road construction slicing through primeval Annamite cloud forests',
        'Hunting pressure from cross-border wildlife trafficking rings',
        'Extremely low population density impairing natural mate finding',
      ],
      conservationAction:
          'Intensive snare removal campaigns by forest guards, developing a conservation breeding center in Bach Ma National Park, and environmental DNA (eDNA) water sampling to detect wild individuals.',
      howYouCanHelp: [
        'Support the Saola Working Group and local ranger patrol units in Vietnam and Laos',
        'Advocate for international funding to remove wire snares from the Annamite ranges',
        'Support eDNA water-sampling technology used to detect elusive wildlife',
      ],
    imageAssetPath: 'assets/images/saola.jpg',
    
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Saola_sketch.jpg/640px-Saola_sketch.jpg',
      imageAttribution: 'Wikimedia Commons / Public Domain',
      sourceReference: 'IUCN Red List (Pseudoryx nghetinhensis) / IUCN SSC Saola Working Group',
    ),
    Species(
      id: 'snow_leopard',
      commonName: 'Snow Leopard',
      scientificName: 'Panthera uncia',
      category: 'Mammals',
      conservationStatus: ConservationStatus.vulnerable,
      habitat: 'High-altitude alpine and subalpine zones, rocky precipices, and scrub plateaus.',
      geographicDistribution: '12 countries across Central and South Asia (Himalayas, Tibetan Plateau, Altai, Pamir)',
      diet: 'Carnivore (blue sheep/bharal, Asiatic ibex, argali, marmots, pikas)',
      populationEstimate: '~4,000 – 6,500 individuals across high Central Asian mountain ranges',
      description:
          'Referred to as the "Ghost of the Mountains," the snow leopard is an extraordinarily elusive big cat. Its smoky-gray rosette coat provides camouflage against rugged granite cliffs, and its thick tail provides balance and warmth.',
      interestingFact:
          'Snow leopards have immense nasal cavities that warm icy mountain air before it reaches their lungs, and wide fur-padded paws that act as natural snowshoes.',
      threats: [
        'Retaliatory killings by livestock herders following corral predation',
        'Poaching for pelt trade and bones used in illegal folk remedies',
        'Prey loss from competition with domestic livestock herds',
        'Shrinking alpine habitat as global warming elevates tree lines',
      ],
      conservationAction:
          'Predator-proof corral construction for pastoralist communities, livestock insurance programs, and community-managed wildlife monitoring across Mongolia, India, and Nepal.',
      howYouCanHelp: [
        'Support community snow leopard enterprise programs that sell handmade wool handicrafts',
        'Contribute to predator-proof mesh corral construction projects in remote valleys',
        'Advocate for trans-boundary peace parks across Central Asian mountain borders',
      ],
    imageAssetPath: 'assets/images/snow_leopard.jpg',
    
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Snow_leopard_portrait.jpg/640px-Snow_leopard_portrait.jpg',
      imageAttribution: 'Bernard Landgraf / Wikimedia Commons / CC BY-SA 3.0',
      sourceReference: 'IUCN Red List / Snow Leopard Trust Annual Conservation Report',
    ),
    Species(
      id: 'giant_panda',
      commonName: 'Giant Panda',
      scientificName: 'Ailuropoda melanoleuca',
      category: 'Mammals',
      conservationStatus: ConservationStatus.vulnerable,
      habitat: 'Temperate montane broadleaf and mixed coniferous forests with dense bamboo undergrowth.',
      geographicDistribution: 'Sichuan, Shaanxi, and Gansu provinces in central-western China',
      diet: 'Specialized Herbivore (bamboo makes up 99% of its diet, eating up to 38 kg daily)',
      populationEstimate: '~1,864 wild individuals (gradually rising thanks to national reserves)',
      description:
          'The giant panda is an international ambassador for wildlife conservation. Once driven toward extinction, decades of dedicated habitat preservation and bamboo corridor restoration have allowed wild populations to stabilize.',
      interestingFact:
          'Newborn giant panda cubs are pink, hairless, blind, and weigh merely 100 grams—approximately 1/900th the weight of their mother, the smallest relative offspring of any non-marsupial mammal.',
      threats: [
        'Habitat fragmentation preventing gene flow between isolated mountain pockets',
        'Periodic synchronous flowering and natural die-off of bamboo species',
        'Infrastructure development, roads, and high-speed rail cutting across reserves',
        'Climate change impacting mountain bamboo survival zones',
      ],
      conservationAction:
          'Creation of the Giant Panda National Park spanning 27,000 square kilometers, bamboo corridor reconnection, and cutting-edge captive breeding and wild reintroduction programs.',
      howYouCanHelp: [
        'Support reforestation programs in the Minshan and Qionglai mountain ranges',
        'Choose certified eco-friendly bamboo products sourced from non-wildlife reserves',
        'Learn about how flagship species conservation protects thousands of co-existing organisms',
      ],
      imageAssetPath: 'assets/images/giant_panda.jpg',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0f/Grosser_Panda.JPG/640px-Grosser_Panda.JPG',
      imageAttribution: 'J. Patrick Fischer / Wikimedia Commons / CC BY-SA 3.0',
      sourceReference: 'IUCN Red List / China National Forestry and Grassland Administration',
    ),
    Species(
      id: 'sunda_pangolin',
      commonName: 'Sunda Pangolin',
      scientificName: 'Manis javanica',
      category: 'Mammals',
      conservationStatus: ConservationStatus.criticallyEndangered,
      habitat: 'Primary and secondary tropical rainforests, grasslands, and agricultural plantations.',
      geographicDistribution: 'Southeast Asia (Indonesia, Malaysia, Thailand, Vietnam, Cambodia, Myanmar)',
      diet: 'Insectivore (specialized ant and termite feeder consuming up to 70 million insects yearly)',
      populationEstimate: 'Unknown; population has plunged by >80% over the last two decades',
      description:
          'The Sunda pangolin is an extraordinary scaly mammal that rolls into a tight, impenetrable armor ball when threatened. Possessing a sticky tongue longer than its body, it acts as an indispensable natural controller of forest insect populations.',
      interestingFact:
          'Pangolin scales are composed of keratin—the exact same structural protein found in human fingernails and hair—with zero proven medicinal properties.',
      threats: [
        'Vicious commercial poaching; widely cited as the most illegally trafficked wild mammal on Earth',
        'Black market demand for traditional medicine scales and luxury restaurant bushmeat',
        'Loss of natural forest cover from logging and agricultural clearing',
        'Forest fires destroying dead logs and hollow tree roosting sites',
      ],
      conservationAction:
          'Strict international commercial trade ban under CITES Appendix I, canine-assisted anti-poaching customs detection, and rescued pangolin rehabilitation programs.',
      howYouCanHelp: [
        'Report illegal pangolin scale sales, remedies, or meat to wildlife crime tip lines',
        'Educate communities about the biological reality of keratin scales having no curative powers',
        'Support pangolin rescue centers providing surgical care and release for confiscated animals',
      ],
    imageAssetPath: 'assets/images/sunda_pangolin.jpg',
    
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c5/Manis_javanica_in_tree.jpg/640px-Manis_javanica_in_tree.jpg',
      imageAttribution: 'Piekfrosch / Wikimedia Commons / CC BY-SA 3.0',
      sourceReference: 'IUCN Red List (Manis javanica) / IUCN SSC Pangolin Specialist Group',
    ),
    Species(
      id: 'iberian_lynx',
      commonName: 'Iberian Lynx',
      scientificName: 'Lynx pardinus',
      category: 'Mammals',
      conservationStatus: ConservationStatus.endangered,
      habitat: 'Mediterranean scrubland, holm oak woodlands, and open pasture mosaics.',
      geographicDistribution: 'Iberian Peninsula (southern and central Spain and Portugal)',
      diet: 'Specialized Carnivore (European wild rabbits comprise over 80% of its caloric intake)',
      populationEstimate: '~2,000 individuals (a historic conservation recovery from <100 in 2002)',
      description:
          'With distinctive beard-like facial ruffs and black ear tufts, the Iberian lynx is an emblem of modern European conservation success. Through collaborative captive breeding, habitat restoration, and rabbit reintroduction, it has been pulled back from the brink of extinction.',
      interestingFact:
          'The black tufts of hair atop a lynx\'s ears act like antennae, significantly enhancing its ability to pinpoint the precise location of rustling prey in dense scrub.',
      threats: [
        'Rabbit hemorrhagic disease (RHD) decimating its essential prey supply',
        'Vehicular road collisions along rural Spanish highways',
        'Illegal trapping, snares, and poison baits set for agricultural pests',
        'Genetic vulnerability resulting from a historic severe population bottleneck',
      ],
      conservationAction:
          'European Union LIFE projects, captive breeding centers in Spain and Portugal, wildlife highway underpasses with fencing, and micro-habitat rabbit restocking.',
      howYouCanHelp: [
        'Support wildlife overpass and underpass construction across European highway networks',
        'Advocate for non-toxic, ecological approaches to rodent and predator control',
        'Support conservation initiatives that partner with rural landowners and farmers',
      ],
    imageAssetPath: 'assets/images/iberian_lynx.jpg',
    
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/07/Linces13.jpg/640px-Linces13.jpg',
      imageAttribution: 'Programa de Conservación Ex-situ del Lince Ibérico / CC BY 3.0',
      sourceReference: 'IUCN Red List (Lynx pardinus) / LIFE LynxConnect Project Reports',
    ),
    Species(
      id: 'cheetah',
      commonName: 'Cheetah',
      scientificName: 'Acinonyx jubatus',
      category: 'Mammals',
      conservationStatus: ConservationStatus.vulnerable,
      habitat: 'Open grasslands, dry savannas, and arid semi-desert plains.',
      geographicDistribution: 'Eastern and Southern Africa, with a tiny critically endangered relict population in Iran',
      diet: 'Carnivore (gazelles, impalas, springbok, young wildebeest, hares)',
      populationEstimate: '~6,500 – 7,100 adult individuals remaining in the wild',
      description:
          'The world\'s fastest land mammal, the cheetah can accelerate from 0 to 95 km/h in under three seconds. Unlike other big cats, it hunts during daylight hours relying on eyesight, exceptional speed, and flexible spinal anatomy.',
      interestingFact:
          'The dark "tear stripes" running from the inner corners of a cheetah\'s eyes down to its mouth function like anti-glare football paint, reducing blinding sun glare across bright savannas.',
      threats: [
        'Vast home range requirements triggering conflict with pastoral farmers outside protected areas',
        'Illegal pet trade demand in the Middle East driving cub poaching in the Horn of Africa',
        'Severe genetic uniformity stemming from an ancient prehistoric population bottleneck',
        'Competition from larger carnivores (lions, hyenas) who frequently steal cheetah kills',
      ],
      conservationAction:
          'Cheetah Conservation Fund (CCF) Livestock Guarding Dog program using Anatolian shepherds, trans-boundary habitat corridors, and anti-trafficking law enforcement in Somaliland.',
      howYouCanHelp: [
        'Support programs providing livestock guardian dogs to African farmers to prevent predator conflict',
        'Report online advertisements offering pet cheetah cubs for sale',
        'Advocate for large-scale wildlife corridors reconnecting fragmented national parks',
      ],
    imageAssetPath: 'assets/images/cheetah.jpg',
    
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/Cheetah_in_Kruger_National_Park.jpg/640px-Cheetah_in_Kruger_National_Park.jpg',
      imageAttribution: 'Charles J. Sharp / Wikimedia Commons / CC BY-SA 4.0',
      sourceReference: 'IUCN Red List (Acinonyx jubatus) / Cheetah Conservation Fund (CCF)',
    ),
    Species(
      id: 'koala',
      commonName: 'Koala',
      scientificName: 'Phascolarctos cinereus',
      category: 'Mammals',
      conservationStatus: ConservationStatus.vulnerable,
      habitat: 'Open eucalyptus woodlands, coastal forests, and temperate bushland.',
      geographicDistribution: 'Eastern and south-eastern Australia (Queensland, New South Wales, Victoria, ACT)',
      diet: 'Specialized Herbivore (exclusively leaves of selected Eucalyptus tree species)',
      populationEstimate: '~30,000 – 60,000 individuals; listed as Endangered in eastern states in 2022',
      description:
          'An iconic arboreal marsupial, the koala possesses specialized gut microbes and a multi-chambered digestive tract capable of detoxifying the harsh cineole terpenes found in fibrous eucalyptus foliage.',
      interestingFact:
          'Koalas sleep for 18 to 22 hours per day to conserve the very limited metabolic energy yielded from their toxic, low-calorie eucalyptus diet.',
      threats: [
        'Catastrophic mega-bushfires intensified by extreme climate change and drought',
        'Severe land clearing for urbanization, mining, and agricultural developments',
        'Widespread endemic Chlamydia infections causing blindness and reproductive failure',
        'Dog attacks and vehicle strikes as koalas are forced to cross highways between trees',
      ],
      conservationAction:
          'Koala Chlamydia vaccination trials, community wildlife corridor tree plantings, installation of koala-friendly highway fencing, and bushfire emergency response rescue teams.',
      howYouCanHelp: [
        'Support community koala hospital and tree-planting charities in eastern Australia',
        'Drive slowly through posted wildlife zones, especially during dawn and dusk',
        'Advocate for strong environmental legislation halting primary native bushland clearing',
      ],
    imageAssetPath: 'assets/images/koala.jpg',
    
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/49/Koala_climbing_tree.jpg/640px-Koala_climbing_tree.jpg',
      imageAttribution: 'Diliff / Wikimedia Commons / CC BY-SA 3.0',
      sourceReference: 'IUCN Red List / Australian Government Threatened Species Scientific Committee',
    ),

    // -------------------------------------------------------------------------
    // BIRDS
    // -------------------------------------------------------------------------
    Species(
      id: 'philippine_eagle',
      commonName: 'Philippine Eagle',
      scientificName: 'Pithecophaga jefferyi',
      category: 'Birds',
      conservationStatus: ConservationStatus.criticallyEndangered,
      habitat: 'Lush primary dipterocarp rainforests and steep montane forest valleys.',
      geographicDistribution: 'Four main islands of the Philippines (Luzon, Samar, Leyte, Mindanao)',
      diet: 'Carnivore (flying lemurs, palm civets, flying foxes, monkeys, monitor lizards, snakes)',
      populationEstimate: '<400 breeding pairs surviving in fragmented island canopies',
      description:
          'Known also as the Monkey-eating Eagle, the Philippine Eagle is one of the world\'s largest, most powerful birds of prey. With a 2-meter wingspan and a majestic crest of spiky feathers, it is the national bird of the Philippines.',
      interestingFact:
          'Philippine Eagles are strictly monogamous, mating for life. A pair rears only a single chick every two years, investing extraordinary parental care until the young eaglet achieves independence.',
      threats: [
        'Massive deforestation driven by illegal commercial logging and slash-and-burn agriculture',
        'Opportunistic shooting and retaliatory hunting by villagers',
        'Pesticide contamination accumulating through forest trophic levels',
        'Typhoon devastation and canopy nest destruction caused by intense tropical cyclones',
      ],
      conservationAction:
          'The Philippine Eagle Foundation (PEF) captive breeding and wild rehabilitation programs, indigenous forest-guard community wardens, and satellite GPS telemetry.',
      howYouCanHelp: [
        'Support indigenous forest ranger cooperatives safeguarding Philippine Eagle nesting territories',
        'Raise awareness on the critical link between dipterocarp canopy protection and watershed safety',
        'Advocate for strict enforcement of national wildlife protection legislation in the Philippines',
      ],
      imageAssetPath: 'assets/images/philippine_eagle.jpg',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/07/Philippine_Eagle_2.jpg/640px-Philippine_Eagle_2.jpg',
      imageAttribution: 'Stefan Cruysberghs / Wikimedia Commons / CC BY-SA 3.0',
      sourceReference: 'IUCN Red List / Philippine Eagle Foundation (PEF) Field Reports',
    ),
    Species(
      id: 'snowy_owl',
      commonName: 'Snowy Owl',
      scientificName: 'Bubo scandiacus',
      category: 'Birds',
      conservationStatus: ConservationStatus.vulnerable,
      habitat: 'Open, treeless Arctic tundra, coastal dunes, and subarctic barrier islands.',
      geographicDistribution: 'Circumpolar Arctic regions (Alaska, northern Canada, Greenland, Scandinavia, Siberia)',
      diet: 'Carnivore (primarily lemmings; also ptarmigans, ducks, seabirds, hares)',
      populationEstimate: '~14,000 – 28,000 mature breeding pairs worldwide (steeply declining)',
      description:
          'A majestic Arctic nomad, the snowy owl is adorned with dense white plumage and brilliant yellow eyes. Unlike most nocturnal owls, snowy owls are diurnal, hunting across the Arctic tundra during continuous 24-hour summer daylight.',
      interestingFact:
          'Snowy owl breeding success is tied intimately to boom-and-bust lemming population cycles; in years with abundant lemmings, a pair can successfully fledge up to 10 chicks.',
      threats: [
        'Rapid Arctic warming melting permafrost and disrupting lemming snow-pack breeding cycles',
        'Collision with coastal wind turbines, power distribution grids, and airport airplanes',
        'Illegal shooting and accidental poisoning during southern winter irruption flights',
        'Industrial resource extraction and shipping route expansion into pristine tundra',
      ],
      conservationAction:
          'Project SNOWstorm solar-powered GPS tracking research, Arctic flyway habitat protection, and airport relocation programs moving owls safely away from runways.',
      howYouCanHelp: [
        'Support Arctic climate research and greenhouse gas mitigation initiatives',
        'Give resting migratory owls plenty of respectful distance when observed during winter irruptions',
        'Support wildlife rehabilitation centers equipping birds with telemetry tracking bands',
      ],
      imageAssetPath: 'assets/images/snowy_owl_photo.jpg',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e3/Bubo_scandiacus_%28Linnaeus%2C_1758%29_Male.jpg/640px-Bubo_scandiacus_%28Linnaeus%2C_1758%29_Male.jpg',
      imageAttribution: 'Ómar Runólfsson / Wikimedia Commons / CC BY 2.0',
      sourceReference: 'IUCN Red List / Project SNOWstorm Tracking Research',
    ),
    Species(
      id: 'california_condor',
      commonName: 'California Condor',
      scientificName: 'Gymnogyps californianus',
      category: 'Birds',
      conservationStatus: ConservationStatus.criticallyEndangered,
      habitat: 'Rocky shrubland, coniferous forest canyons, and oak savannas with high cliff faces.',
      geographicDistribution: 'Southwestern United States (California, Arizona, Utah) and Baja California (Mexico)',
      diet: 'Scavenger / Obligate Carnivore (carrion of deer, elk, cattle, marine mammals)',
      populationEstimate: '~560 total individuals (~340 living in the wild; rescued from only 22 in 1987)',
      description:
          'The largest flying land bird in North America, the California condor boasts a massive wingspan exceeding 3 meters. Able to soar for hours on thermal updrafts without flapping, this scavenger plays an essential role in sanitizing ecosystems by consuming carrion.',
      interestingFact:
          'Condors do not possess vocal cords; their vocalizations are restricted to guttural grunts and hisses made by vibrating air in their windpipe.',
      threats: [
        'Lead poisoning caused by ingesting lead ammunition bullet fragments left in game carcasses',
        'Micro-trash ingestion by nestlings (bottle caps, glass shards, wires brought by parents)',
        'Collisions with high-voltage electrical transmission lines',
        'Highly pathogenic avian influenza (HPAI) outbreaks',
      ],
      conservationAction:
          'Intensive captive breeding and release by San Diego Zoo Wildlife Alliance and Peregrine Fund, non-lead ammunition exchange programs, and condor HPAI vaccination trials.',
      howYouCanHelp: [
        'Hunters can switch to non-lead copper ammunition to prevent lethal poisoning of scavenging wildlife',
        'Pack out all micro-trash, bottle caps, and plastics when hiking or camping in condor habitat',
        'Support captive condor reintroduction and medical chelation facilities',
      ],
    imageAssetPath: 'assets/images/california_condor.jpg',
    
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c2/California_Condor_in_flight.jpg/640px-California_Condor_in_flight.jpg',
      imageAttribution: 'David Jordan / Wikimedia Commons / CC BY 2.0',
      sourceReference: 'IUCN Red List / US Fish and Wildlife Service California Condor Recovery Program',
    ),
    Species(
      id: 'kakapo',
      commonName: 'Kakapo',
      scientificName: 'Strigops habroptilus',
      category: 'Birds',
      conservationStatus: ConservationStatus.criticallyEndangered,
      habitat: 'Native podocarp and southern beech forests on predator-free offshore islands.',
      geographicDistribution: 'Confined to predator-free sanctuary islands of New Zealand (Whenua Hou, Anchor Island)',
      diet: 'Herbivore (rimu tree fruit, fern rhizomes, mosses, seeds, tussock grass stems)',
      populationEstimate: '~240 individuals (strictly monitored and managed by the Kakapo Recovery team)',
      description:
          'The kakapo is the world\'s only flightless, nocturnal, and heaviest parrot. Featuring moss-green plumage that blends into native ferns, it evolved for millions of years in New Zealand without native terrestrial mammalian predators.',
      interestingFact:
          'Kakapo breeding is tied exclusively to the masting of native rimu trees, which bear fruit only once every two to four years, producing the super-rich nutrients required to raise chicks.',
      threats: [
        'Devastating vulnerability to invasive stoats, feral cats, and rats',
        'Extremely low genetic diversity leading to poor egg hatching success',
        'Susceptibility to avian fungal infections (Aspergillosis)',
        'Total dependence on intensive human island management',
      ],
      conservationAction:
          'Complete eradication of introduced mammalian predators on sanctuary islands, smart-transmitter health monitoring, artificial insemination, and supplemental dietary feeding.',
      howYouCanHelp: [
        'Support New Zealand\'s "Predator Free 2050" initiative to eliminate introduced stoats and rats',
        'Support genome sequencing initiatives aimed at preserving avian genetic health',
        'Adopt a kakapo through the New Zealand Department of Conservation Kakapo Recovery team',
      ],
    imageAssetPath: 'assets/images/kakapo.jpg',
    
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5a/Strigops_habroptilus_1.jpg/640px-Strigops_habroptilus_1.jpg',
      imageAttribution: 'Mnolf / Wikimedia Commons / CC BY-SA 3.0',
      sourceReference: 'IUCN Red List / New Zealand Department of Conservation (DOC)',
    ),
    Species(
      id: 'whooping_crane',
      commonName: 'Whooping Crane',
      scientificName: 'Grus americana',
      category: 'Birds',
      conservationStatus: ConservationStatus.endangered,
      habitat: 'Wetland marshes, shallow lakes, coastal lagoons, and sedge meadows.',
      geographicDistribution: 'North America (Wood Buffalo National Park in Canada to Aransas NWR in Texas, USA)',
      diet: 'Omnivore (blue crabs, clams, wolfberries, frogs, minnows, aquatic plant tubers)',
      populationEstimate: '~800 individuals total (~650 wild; miraculous comeback from just 15 in 1941)',
      description:
          'Standing at 1.5 meters tall with a pristine white plumage, red crown, and jet-black wingtips, the whooping crane is the tallest native bird in North America. Its bugling call can be heard over several kilometers.',
      interestingFact:
          'During early reintroduction efforts, biologists dressed in full-body white crane suits and used ultralight aircraft to lead captive-bred young cranes along their 4,000 km migration route.',
      threats: [
        'Powerline collisions along the 4,000-kilometer central migratory flyway',
        'Wetland habitat loss from coastal development and freshwater diversion',
        'Chemical and oil spill risks near Gulf Coast wintering grounds',
        'Extreme weather events and late spring blizzards impacting nesting grounds',
      ],
      conservationAction:
          'Cross-border flyway habitat protection, marking power lines with reflective bird diverters, captive breeding at the International Crane Foundation, and wetland water-flow agreements.',
      howYouCanHelp: [
        'Support wetland conservation and the protection of natural prairie pothole ecosystems',
        'Advocate for utility companies to install flight diverters on power lines crossing flyways',
        'Support the International Crane Foundation in their global crane recovery work',
      ],
    imageAssetPath: 'assets/images/whooping_crane.jpg',
    
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/69/Whooping_crane_pair.jpg/640px-Whooping_crane_pair.jpg',
      imageAttribution: 'USFWS / Wikimedia Commons / Public Domain',
      sourceReference: 'IUCN Red List / International Crane Foundation (ICF) Annual Surveys',
    ),
    Species(
      id: 'spixs_macaw',
      commonName: 'Spix\'s Macaw',
      scientificName: 'Cyanopsitta spixii',
      category: 'Birds',
      conservationStatus: ConservationStatus.criticallyEndangered,
      habitat: 'Riparian gallery forests dominated by craibeira (Tabebuia caraiba) trees within the semi-arid Caatinga.',
      geographicDistribution: 'Northeastern Brazil (Bahia State; historically Extinct in the Wild, now reintroduced)',
      diet: 'Frugivore/Granivore (seeds and nuts of favela and pinhão-bravo plants)',
      populationEstimate: '~200 individuals in captive breeding facilities; over 20 reintroduced into the wild',
      description:
          'Also called the Little Blue Macaw, this radiant cyan parrot gained worldwide fame as the inspiration for the animated film "Rio." Decimated by the illegal cage bird trade and damming of creek systems, dedicated international breeding has permitted historic reintroductions into its native Caatinga.',
      interestingFact:
          'Spix\'s Macaws depend exclusively on ancient, hollow craibeira trees that line seasonal creek beds for nesting cavities, requiring trees that are over 100 years old.',
      threats: [
        'Historic catastrophic poaching for private international bird collections',
        'Loss of riparian craibeira gallery forests from goat overgrazing and damming',
        'Competition for scarce tree hollows with introduced aggressive Africanized honeybees',
        'Vulnerability of naive captive-reared birds to wild raptor predators upon release',
      ],
      conservationAction:
          'Establishment of the Spix\'s Macaw Wildlife Refuge and Environmental Protection Area, captive breeding at Pairi Daiza and ACTP, and soft-release wild reintroduction protocols.',
      howYouCanHelp: [
        'Never purchase wild-caught exotic parrots or patronize unregulated bird dealers',
        'Support habitat restoration and native tree planting in the Brazilian Caatinga',
        'Support international wildlife trade compliance enforcement under CITES',
      ],
      imageAssetPath: 'assets/images/spixs_macaw.jpg',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/Spix_macaw_in_flight.jpg/640px-Spix_macaw_in_flight.jpg',
      imageAttribution: 'ACTP / Wikimedia Commons / CC BY-SA 4.0',
      sourceReference: 'IUCN Red List / Association for the Conservation of Threatened Parrots (ACTP)',
    ),
    Species(
      id: 'harpy_eagle',
      commonName: 'Harpy Eagle',
      scientificName: 'Harpia harpyja',
      category: 'Birds',
      conservationStatus: ConservationStatus.vulnerable,
      habitat: 'Undisturbed continuous lowland tropical rainforest canopy.',
      geographicDistribution: 'Central and South America (Amazon Basin, Pantanal, Darien Gap)',
      diet: 'Apex Carnivore (sloths, capuchin and howler monkeys, coatimundis, anteaters, iguanas)',
      populationEstimate: '~50,000 individuals, but declining rapidly with regional extirpations north of the Amazon',
      description:
          'The harpy eagle is one of the most formidable raptors on the planet. Its talons are larger than those of a grizzly bear, allowing it to snatch 10-kilogram sloths and monkeys right off canopy branches mid-flight.',
      interestingFact:
          'A female harpy eagle can have rear talons measuring up to 13 cm in length, exerting crushing pressures exceeding 500 psi to immobilize tree-dwelling mammals instantly.',
      threats: [
        'Extensive canopy deforestation across the "Arc of Deforestation" in the southern Amazon',
        'Direct shooting by rural settlers out of unfounded fear for livestock or curiosity',
        'Fragmentation isolating breeding pairs who require up to 100 square kilometers per pair',
        'Slow reproductive cycle: raising a single eaglet takes over two full years',
      ],
      conservationAction:
          'Harpy Eagle Conservation Project (Projeto Harpia) nest mapping and satellite tracking, indigenous community nest-guarding stipends, and environmental education campaigns.',
      howYouCanHelp: [
        'Boycott beef and soy products linked to illegal Amazonian deforestation',
        'Support community-based canopy ecotourism that values live eagles over timber',
        'Support grassroots research teams tracking and monitoring remote rainforest raptor nests',
      ],
    imageAssetPath: 'assets/images/harpy_eagle.jpg',
    
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/17/Harpia_harpyja_01.jpg/640px-Harpia_harpyja_01.jpg',
      imageAttribution: 'Tomás Munita / Wikimedia Commons / CC BY-SA 3.0',
      sourceReference: 'IUCN Red List / Projeto Harpia / The Peregrine Fund',
    ),
    Species(
      id: 'northern_bald_ibis',
      commonName: 'Northern Bald Ibis',
      scientificName: 'Geronticus eremita',
      category: 'Birds',
      conservationStatus: ConservationStatus.endangered,
      habitat: 'Arid rocky cliff ledges for nesting, adjacent to open semi-desert steppes and pastures.',
      geographicDistribution: 'Morocco (Souss-Massa National Park); reintroduced migratory flocks in Central Europe',
      diet: 'Omnivore / Insectivore (beetles, grasshoppers, scorpions, small lizards, snails)',
      populationEstimate: '~800 wild individuals in Morocco; growing reintroduced European migratory population',
      description:
          'Featuring a bald red face, shaggy neck ruff, and iridescent bronze-green plumage, the Northern Bald Ibis once nested across southern Europe and the Middle East before disappearing. Today, intensive rewilding and microlight flight training are re-establishing its migratory flyways.',
      interestingFact:
          'Human foster parents flying ultralight aircraft have successfully guided captive-bred young ibises over the Alps to teach them their historical ancestral migration routes to wintering sites in Tuscany.',
      threats: [
        'Electrocution on uninsulated rural power lines along migration corridors',
        'Illegal bird shooting during Mediterranean migration crossings',
        'Habitat loss due to intensive agricultural pesticides poisoning steppe insects',
        'High vulnerability of nesting cliff colonies to human disturbance',
      ],
      conservationAction:
          'Souss-Massa National Park wardens in Morocco, the Waldrappteam EU-LIFE migration project using ultralight gliders, and retrofitting hazardous power poles.',
      howYouCanHelp: [
        'Support the Waldrappteam reintroduction project re-establishing migratory flocks in Europe',
        'Advocate for wildlife-safe insulation of electrical infrastructure along international flyways',
        'Promote pesticide-free organic farming that protects ground-dwelling insect biodiversity',
      ],
    imageAssetPath: 'assets/images/northern_bald_ibis.jpg',
    
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b5/Geronticus_eremita_-_Tiergarten_Sch%C3%B6nbrunn_01.jpg/640px-Geronticus_eremita_-_Tiergarten_Sch%C3%B6nbrunn_01.jpg',
      imageAttribution: 'Norbert Nagel / Wikimedia Commons / CC BY-SA 3.0',
      sourceReference: 'IUCN Red List / Waldrappteam Conservation Biology Reports',
    ),
    Species(
      id: 'north_island_brown_kiwi',
      commonName: 'Kiwi (North Island Brown)',
      scientificName: 'Apteryx mantelli',
      category: 'Birds',
      conservationStatus: ConservationStatus.vulnerable,
      habitat: 'Subtropical and temperate native forests, kauri woodlands, and dense regenerating scrub.',
      geographicDistribution: 'North Island of New Zealand (Northland, Coromandel, Taranaki, Bay of Plenty)',
      diet: 'Insectivore / Omnivore (earthworms, cicada nymphs, beetle larvae, fallen berries)',
      populationEstimate: '~25,000 individuals (recovering steadily due to intensive predator trapping)',
      description:
          'New Zealand\'s beloved national icon, the kiwi is an evolutionary marvel: a flightless bird with hair-like plumage, tiny vestigial wings hidden beneath its feathers, heavy marrow-filled bones, and nostrils located at the very tip of its long bill.',
      interestingFact:
          'Relative to its body size, the female kiwi lays one of the largest eggs of any bird—up to 20% of her entire body weight, roughly equivalent to a human mother giving birth to a 14-kilogram baby.',
      threats: [
        'Predation of kiwi chicks by introduced stoats, weasels, and feral cats (up to 95% mortality without trapping)',
        'Uncontrolled pet dogs killing adult breeding kiwis in suburban bush fringes',
        'Habitat clearing and fragmentation of dense lowland native bush',
        'Vehicular strikes on rural roads cutting through kiwi reserves',
      ],
      conservationAction:
          '"Operation Nest Egg" which collects wild eggs, hatches them in biosecure sanctuaries, and releases juveniles only when they reach a stoat-resistant 1.2 kg weight.',
      howYouCanHelp: [
        'Always keep pet dogs leashed and enrolled in Kiwi Aversion Training when living near native bush',
        'Support community-led predator trapping networks across New Zealand',
        'Drive slowly on rural roads bearing yellow "Kiwi Crossing" warning signs',
      ],
      imageAssetPath: 'assets/images/north_island_brown_kiwi.jpg',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e0/Te_Tuhi_North_Island_Brown_Kiwi.jpg/640px-Te_Tuhi_North_Island_Brown_Kiwi.jpg',
      imageAttribution: 'Maungatautari Ecological Island Trust / Wikimedia Commons / CC BY-SA 3.0',
      sourceReference: 'IUCN Red List / Save the Kiwi Trust Annual Review',
    ),

    // -------------------------------------------------------------------------
    // REPTILES
    // -------------------------------------------------------------------------
    Species(
      id: 'galapagos_tortoise',
      commonName: 'Galápagos Giant Tortoise',
      scientificName: 'Chelonoidis niger',
      category: 'Reptiles',
      conservationStatus: ConservationStatus.criticallyEndangered,
      habitat: 'Arid volcanic lowlands, scrubby transition zones, and humid lush highlands.',
      geographicDistribution: 'Galápagos Archipelago, Ecuador (subspecies endemic to individual islands)',
      diet: 'Herbivore (cactus pads, native grasses, fallen fruits, lichens, leaves)',
      populationEstimate: '~15,000 – 20,000 across the archipelago (recovering from a low of ~3,000)',
      description:
          'Celebrated evolutionary pioneers that inspired Charles Darwin\'s theory of natural selection, Galápagos giant tortoises can weigh over 400 kg and live for well over a century. They shape island landscapes by trampling paths and dispersing seeds.',
      interestingFact:
          'Tortoise shell morphology evolved to match island vegetation: dome-shaped shells on islands with lush ground forage, and saddleback shells with elevated neck arches on dry islands where tortoises must reach up for tall prickly pear cacti.',
      threats: [
        'Historic exploitation by whalers who took an estimated 100,000 tortoises as live shipboard meat',
        'Invasive species: feral pigs, rats, and ants digging up and preying on eggs and hatchlings',
        'Invasive feral goats and donkeys destroying native vegetation and competing for forage',
        'Volcanic eruptions and invasive alien plants altering native habitats',
      ],
      conservationAction:
          'Eradication of invasive goats and rats from multiple islands, captive incubation and head-start repatriation programs at the Charles Darwin Research Station.',
      howYouCanHelp: [
        'Support the Charles Darwin Foundation in their archipelago restoration work',
        'Comply strictly with biosecurity inspections when traveling to island reserves to prevent transporting seeds or pests',
        'Advocate for marine and terrestrial reserve boundary protections around volcanic islands',
      ],
      imageAssetPath: 'assets/images/galapagos_tortoise.jpg',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/Galapagos_giant_tortoise_Chelonoidis_nigra.jpg/640px-Galapagos_giant_tortoise_Chelonoidis_nigra.jpg',
      imageAttribution: 'Putneymark / Wikimedia Commons / CC BY-SA 2.0',
      sourceReference: 'IUCN Red List / Charles Darwin Foundation Conservation Science',
    ),
    Species(
      id: 'komodo_dragon',
      commonName: 'Komodo Dragon',
      scientificName: 'Varanus komodoensis',
      category: 'Reptiles',
      conservationStatus: ConservationStatus.endangered,
      habitat: 'Tropical dry deciduous savanna, thorn scrub woodlands, and coastal mangroves.',
      geographicDistribution: 'Lesser Sunda Islands of Indonesia (Komodo, Rinca, Flores, Gili Motang, Nusa Kode)',
      diet: 'Carnivore (Timor deer, wild pigs, water buffalo, monkeys, birds, carrion)',
      populationEstimate: '~3,000 – 3,500 wild individuals across five Indonesian islands',
      description:
          'The largest living lizard on Earth, the Komodo dragon can reach 3 meters in length and exceed 70 kg in weight. Equipped with serrated shark-like teeth and venom glands that inject toxic proteins preventing blood clotting, it is the unchallenged apex predator of its island realm.',
      interestingFact:
          'Young Komodo dragons spend the first few years of their lives high up in trees to avoid being cannibalized by larger adult dragons, frequently rolling in faeces to make themselves unpalatable.',
      threats: [
        'Rising sea levels and climate change projected to submerge up to 30% of their lowland island habitat',
        'Poaching of Timor deer, the dragon\'s primary wild ungulate food source',
        'Agricultural encroachment, burning, and human tourism expansion outside national park boundaries',
        'Habitat fragmentation preventing gene exchange between isolated island populations',
      ],
      conservationAction:
          'Strict park protection within Komodo National Park, community deer-monitoring patrols, eco-tourism visitor limits, and satellite tracking studies by the Komodo Survival Program.',
      howYouCanHelp: [
        'Support sustainable, regulated ecotourism guidelines that prevent disturbing wild dragon foraging',
        'Support local ranger anti-poaching operations safeguarding Timor deer populations',
        'Advocate for global climate action to mitigate sea-level rise on fragile island ecosystems',
      ],
    imageAssetPath: 'assets/images/komodo_dragon.jpg',
    
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Komodo_dragon_profile.jpg/640px-Komodo_dragon_profile.jpg',
      imageAttribution: 'Adhi Rachdian / Wikimedia Commons / CC BY 2.0',
      sourceReference: 'IUCN Red List (Varanus komodoensis) / Komodo Survival Program',
    ),
    Species(
      id: 'gharial',
      commonName: 'Gharial',
      scientificName: 'Gavialis gangeticus',
      category: 'Reptiles',
      conservationStatus: ConservationStatus.criticallyEndangered,
      habitat: 'Deep, fast-flowing freshwater rivers with clear water, sandbanks, and deep pools.',
      geographicDistribution: 'Northern Indian subcontinent (Chambal, Girwa, and Son rivers in India; Narayani in Nepal)',
      diet: 'Specialized Piscivore (exclusively fish, captured using interlocking needle-like teeth)',
      populationEstimate: '<650 adult breeding individuals surviving in fragmented river systems',
      description:
          'A unique survivor of an ancient crocodilian lineage, the gharial is recognizable by its extraordinarily long, slender snout lined with 110 razor-sharp interlocking teeth. Adult males develop a bulbous nasal growth called a "ghara" used to emit resonant acoustic buzzes and bubbles.',
      interestingFact:
          'Gharials are so adapted for an aquatic lifestyle that their leg muscles are too weak to support their weight off the ground; when on land to bask or nest, they must slide forward on their bellies.',
      threats: [
        'Sand mining destroying vital sandy riverbanks required for nesting and basking',
        'Dam construction and irrigation canals severely disrupting natural river hydrology',
        'Drowning in commercial monofilament nylon fishing gill nets',
        'Severe river pollution from agricultural runoff and industrial effluents',
      ],
      conservationAction:
          'National Chambal Sanctuary protection, head-starting incubation hatcheries by the Gharial Ecology Project, and community nest-guarding initiatives along sandy riverbars.',
      howYouCanHelp: [
        'Advocate against illegal mechanized river sand mining that destroys riparian nesting banks',
        'Support freshwater river revitalization projects across the Ganges and Brahmaputra basins',
        'Promote safe fishing net alternatives that prevent accidental crocodilian entanglement',
      ],
    imageAssetPath: 'assets/images/gharial.jpg',
    
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Gharial_San_Diego.jpg/640px-Gharial_San_Diego.jpg',
      imageAttribution: 'Tarah / Wikimedia Commons / CC BY 2.0',
      sourceReference: 'IUCN Red List (Gavialis gangeticus) / Gharial Ecology Project',
    ),
    Species(
      id: 'radiated_tortoise',
      commonName: 'Radiated Tortoise',
      scientificName: 'Astrochelys radiata',
      category: 'Reptiles',
      conservationStatus: ConservationStatus.criticallyEndangered,
      habitat: 'Arid spiny spoor forests, thorn scrub, and dry coastal savannas.',
      geographicDistribution: 'Southern and south-western Madagascar',
      diet: 'Herbivore (grasses, succulents, fallen fruit, invasive prickly pear cactus)',
      populationEstimate: 'Severely declining; millions historically, now reduced by >80% over three generations',
      description:
          'Considered one of the world\'s most beautiful tortoises, the radiated tortoise displays a high-domed carapace marked with brilliant yellow star-like radiation lines emanating from the center of each dark scute.',
      interestingFact:
          'Traditional local Malagasy folklore (fady) historically prohibited harming or eating the tortoise, providing centuries of cultural protection until external migrant poachers ignored traditional taboos.',
      threats: [
        'Massive commercial poaching for urban bushmeat markets in southern Madagascar',
        'Illegal international pet trade smuggling thousands of tortoises out annually',
        'Deforestation of unique spiny forests for charcoal production and corn farming',
        'Severe regional droughts drying up seasonal food succulents',
      ],
      conservationAction:
          'Turtle Survival Alliance (TSA) conservation centers in Madagascar caring for over 25,000 confiscated tortoises, community anti-poaching networks, and reforestation projects.',
      howYouCanHelp: [
        'Support the Turtle Survival Alliance in caring for thousands of confiscated tortoises',
        'Never purchase tortoises without verified legal captive-bred documentation',
        'Support sustainable alternative livelihoods for rural Malagasy communities',
      ],
    imageAssetPath: 'assets/images/radiated_tortoise.jpg',
    
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cf/Astrochelys_radiata_01.jpg/640px-Astrochelys_radiata_01.jpg',
      imageAttribution: 'TimVickers / Wikimedia Commons / Public Domain',
      sourceReference: 'IUCN Red List (Astrochelys radiata) / Turtle Survival Alliance (TSA)',
    ),
    Species(
      id: 'chinese_alligator',
      commonName: 'Chinese Alligator',
      scientificName: 'Alligator sinensis',
      category: 'Reptiles',
      conservationStatus: ConservationStatus.criticallyEndangered,
      habitat: 'Low-elevation freshwater marshes, ponds, lakes, irrigation canals, and agricultural ditches.',
      geographicDistribution: 'Lower Yangtze River basin (Anhui and Zhejiang provinces, eastern China)',
      diet: 'Carnivore (freshwater snails, clams, fish, crustaceans, frogs, small rodents)',
      populationEstimate: '<150 mature individuals in the wild; thousands safely bred in captive conservation centers',
      description:
          'One of only two extant alligator species in the world, the Chinese alligator is a timid, heavily armored reptile that rarely exceeds 1.5 meters in length. It spends winter months hibernating deep inside elaborate subterranean tunnel complexes.',
      interestingFact:
          'The Chinese alligator is believed to be the biological inspiration for the traditional Chinese mythological dragon, associated with rain, wisdom, and the aquatic realm.',
      threats: [
        'Historic conversion of wetland swamps into intensive rice paddy agriculture',
        'Poisoning from agricultural molluscicides and chemical fertilizers used in rice fields',
        'Destruction of subterranean hibernation burrows by irrigation maintenance',
        'Extreme historical fragmentation confining wild survivors to tiny farmland ponds',
      ],
      conservationAction:
          'Anhui Research Center for Chinese Alligator Reproduction (ARCCAR) captive breeding, wetland habitat re-creation, and successful wild reintroductions in protected Anhui reserves.',
      howYouCanHelp: [
        'Support wetland restoration programs in the Yangtze River floodplains',
        'Promote organic rice cultivation techniques that eliminate toxic chemical molluscicides',
        'Support captive-breeding release programs rewilding native Asian crocodilians',
      ],
    imageAssetPath: 'assets/images/chinese_alligator.jpg',
    
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b2/Chinese_Alligator_Alligator_sinensis_Head_2200px.jpg/640px-Chinese_Alligator_Alligator_sinensis_Head_2200px.jpg',
      imageAttribution: 'Trisha M Shears / Wikimedia Commons / Public Domain',
      sourceReference: 'IUCN Red List (Alligator sinensis) / ARCCAR Conservation Reports',
    ),
    Species(
      id: 'ploughshare_tortoise',
      commonName: 'Ploughshare Tortoise',
      scientificName: 'Astrochelys yniphora',
      category: 'Reptiles',
      conservationStatus: ConservationStatus.criticallyEndangered,
      habitat: 'Dry deciduous bamboo scrub and spiny woodland mosaics.',
      geographicDistribution: 'Endemic strictly to Baly Bay National Park in north-western Madagascar',
      diet: 'Herbivore (leaves, bamboo shoots, fallen fruits, dead leaves)',
      populationEstimate: '<100 individuals remaining in the wild (on the absolute verge of extinction)',
      description:
          'Known locally as the Angonoka, the ploughshare tortoise is named for the distinctive forward-pointing horn on its lower shell (gular plastron) which males use to grapple and flip rivals during courtship jousts.',
      interestingFact:
          'To deter black-market wildlife smugglers who covet their distinctive golden-brown shells, conservationists have taken the dramatic step of permanently engraving identifying serial numbers onto the shells of wild tortoises.',
      threats: [
        'Catastrophic illegal pet trade poaching driven by astronomical black market prices',
        'Brush fires set deliberately by cattle pastoralists to stimulate fresh grass shoots',
        'Invasive wild pigs preying on eggs and small hatchlings',
        'Extreme geographic confinement to a single small national park',
      ],
      conservationAction:
          'Armed community patrols, firebreak construction around Baly Bay National Park, shell-engraving marking protocols, and captive assurance colonies at Durrell Wildlife Conservation Trust.',
      howYouCanHelp: [
        'Support Durrell Wildlife Conservation Trust in their Baly Bay anti-poaching operations',
        'Never purchase rare exotic tortoises online or through pet trade channels',
        'Advocate for international customs crackdowns on Malagasy wildlife trafficking routes',
      ],
      imageAssetPath: 'assets/images/ploughshare_tortoise.jpg',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/Angonoka_tortoise.jpg/640px-Angonoka_tortoise.jpg',
      imageAttribution: 'Durrell Wildlife Conservation Trust / Wikimedia Commons / CC BY-SA 3.0',
      sourceReference: 'IUCN Red List (Astrochelys yniphora) / Durrell Wildlife Conservation Trust',
    ),
    Species(
      id: 'orinoco_crocodile',
      commonName: 'Orinoco Crocodile',
      scientificName: 'Crocodylus intermedius',
      category: 'Reptiles',
      conservationStatus: ConservationStatus.criticallyEndangered,
      habitat: 'Freshwater rivers, oxbow lagoons, and seasonal floodplains within savanna landscapes.',
      geographicDistribution: 'Orinoco River basin in Colombia and Venezuela',
      diet: 'Carnivore (fish, capybaras, aquatic birds, turtles, caimans)',
      populationEstimate: '~250 – 500 mature individuals remaining in the wild',
      description:
          'The largest predator in the Americas, historical male Orinoco crocodiles were reported to reach lengths exceeding 5 meters. Decimated by commercial hide hunting in the mid-20th century, it is now confined to remote savanna river basins.',
      interestingFact:
          'Unlike many crocodilians whose skin darkens with age, Orinoco crocodiles can undergo subtle physiological color phases, shifting from pale yellowish-tan to dark grayish-green depending on water conditions.',
      threats: [
        'Historic industrial commercial hide poaching that wiped out millions of individuals',
        'Illegal collection of eggs and hatchlings for meat by riverbank communities',
        'River pollution from agricultural run-off and gold mining mercury',
        'Competition with the smaller but highly adaptable spectacled caiman',
      ],
      conservationAction:
          'Captive breeding and head-start release programs in Venezuelan llanos ranches, establishing protected biological reserves along the Capanaparo and Cravo Norte rivers.',
      howYouCanHelp: [
        'Support wildlife head-starting facilities that rear crocodile hatchlings past vulnerable sizes',
        'Support wetland conservation agreements with cattle ranches across the Colombian and Venezuelan llanos',
        'Advocate against commercial leather products sourced from threatened crocodilians',
      ],
      imageAssetPath: 'assets/images/orinoco_crocodile.jpg',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4b/Crocodylus_intermedius_Dallas_World_Aquarium.jpg/640px-Crocodylus_intermedius_Dallas_World_Aquarium.jpg',
      imageAttribution: 'Postdlf / Wikimedia Commons / CC BY-SA 3.0',
      sourceReference: 'IUCN Red List (Crocodylus intermedius) / IUCN Crocodile Specialist Group',
    ),

    // -------------------------------------------------------------------------
    // AMPHIBIANS
    // -------------------------------------------------------------------------
    Species(
      id: 'axolotl',
      commonName: 'Axolotl',
      scientificName: 'Ambystoma mexicanum',
      category: 'Amphibians',
      conservationStatus: ConservationStatus.criticallyEndangered,
      habitat: 'High-altitude freshwater canal systems, shallow lakes, and chinampa wetland channels.',
      geographicDistribution: 'Lake Xochimilco complex near Mexico City, Mexico',
      diet: 'Carnivore (aquatic insects, small crustaceans, worms, tiny fish)',
      populationEstimate: '<1,000 individuals in the wild; critically close to wild extinction',
      description:
          'Celebrated as a biological wonder, the axolotl exhibits neoteny—retaining its juvenile larval characteristics, including external frilly gills and a finned tail, throughout its entire adult life without undergoing terrestrial metamorphosis.',
      interestingFact:
          'Axolotls possess near-miraculous regenerative abilities, capable of regrowing lost limbs, tail sections, heart tissue, spinal cord segments, and even portions of their brain without any scar tissue.',
      threats: [
        'Severe water pollution and sewage contamination in the Xochimilco canal basin',
        'Introduction of invasive predatory fish (Nile tilapia and common carp) that devour axolotl eggs',
        'Urban desiccation and draining of historical lakes for Mexico City infrastructure',
        'Loss of traditional chinampa floating agricultural islands',
      ],
      conservationAction:
          'Restoration of traditional agro-ecological "chinampa" canals by UNAM researchers, installing bio-filters, removing invasive carp, and breeding genetic safety-net colonies.',
      howYouCanHelp: [
        'Support indigenous Xochimilco chinampero farmers practicing chemical-free agriculture',
        'Contribute to UNAM\'s "AdoptAxolotl" ecological canal restoration initiative',
        'Learn how medical regeneration research relies on preserving wild amphibian genomes',
      ],
      imageAssetPath: 'assets/images/axolotl.jpg',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/06/Axolotl_in_aquarium.jpg/640px-Axolotl_in_aquarium.jpg',
      imageAttribution: 'LoKiLeCh / Wikimedia Commons / CC BY-SA 3.0',
      sourceReference: 'IUCN Red List (Ambystoma mexicanum) / UNAM Institute of Biology',
    ),
    Species(
      id: 'golden_poison_frog',
      commonName: 'Golden Poison Frog',
      scientificName: 'Phyllobates terribilis',
      category: 'Amphibians',
      conservationStatus: ConservationStatus.endangered,
      habitat: 'Primary lowland wet tropical rainforests with high humidity and abundant rainfall.',
      geographicDistribution: 'Pacific coastal rainforests of the Cauca and Valle del Cauca departments, Colombia',
      diet: 'Carnivore/Insectivore (ants, termites, tiny beetles, fruit flies)',
      populationEstimate: 'Severely fragmented; confined to a narrow strip of <250 square kilometers',
      description:
          'Despite measuring barely 5 centimeters, the golden poison frog is widely considered the most toxic animal on Earth. Its skin secretions contain potent batrachotoxin alkaloids accumulated from its diet of specialized forest insects.',
      interestingFact:
          'A single wild golden poison frog contains approximately one milligram of batrachotoxin—enough lethal poison to stop the hearts of an estimated 10 to 20 adult humans.',
      threats: [
        'Rampant deforestation for illegal timber concessions and agricultural expansion',
        'Contamination of forest streams from illegal gold panning and pesticide runoff',
        'The deadly worldwide amphibian fungal pandemic Batrachochytrium dendrobatidis (chytrid fungus)',
        'Extremely limited geographic range making any localized forest fire or clearing catastrophic',
      ],
      conservationAction:
          'Establishment of the Rana Terribilis Amphibian Reserve by Rainforest Trust and ProAves, continuous forest ranger monitoring, and captive assurance breeding.',
      howYouCanHelp: [
        'Support Rainforest Trust and ProAves in expanding protected reserves in the Chocó biodiversity hotspot',
        'Boycott illegally mined gold that pollutes pristine Colombian rainforest headwaters',
        'Support global amphibian disease research combating chytrid fungus transmission',
      ],
      imageAssetPath: 'assets/images/golden_poison_frog.jpg',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/90/Phyllobates_terribilis_2.jpg/640px-Phyllobates_terribilis_2.jpg',
      imageAttribution: 'Wilfried Berns / Wikimedia Commons / CC BY-SA 2.0',
      sourceReference: 'IUCN Red List (Phyllobates terribilis) / ProAves Colombia',
    ),
    Species(
      id: 'panamanian_golden_frog',
      commonName: 'Panamanian Golden Frog',
      scientificName: 'Atelopus zeteki',
      category: 'Amphibians',
      conservationStatus: ConservationStatus.criticallyEndangered,
      habitat: 'Wet montane cloud forest streams and fast-flowing rocky waterfalls.',
      geographicDistribution: 'Cordillera Central mountain streams of Panama (believed Extinct in the Wild since 2007)',
      diet: 'Insectivore (small beetles, ants, springtails, flies, midges)',
      populationEstimate: 'Zero verified wild sightings since 2007; thriving in biosecure captive breeding centers',
      description:
          'Considered a national treasure and cultural symbol of good fortune in Panama, this brilliant yellow-and-black toad evolved alongside loud, roaring mountain waterfalls where acoustic calls could not be heard, developing a unique visual "semaphore" language.',
      interestingFact:
          'To communicate across the thunderous roar of mountain cascades, golden frogs developed a visual signaling behavior called "semaphoring"—waving their front limbs and tapping their feet to signal territory and courtship.',
      threats: [
        'Devastating waves of the chytrid fungus (Bd) that swept through Central America in the 1990s and 2000s',
        'Historic deforestation for agricultural grazing and road construction',
        'Water contamination from agricultural chemicals washing into mountain streams',
        'Historic illegal pet trade collection',
      ],
      conservationAction:
          'Emergency rescue missions before chytrid arrival established biosecure breeding colonies at the El Valle Amphibian Conservation Center (EVACC) and Smithsonian Tropical Research Institute, preparing for future wild reintroduction.',
      howYouCanHelp: [
        'Support the Smithsonian Tropical Research Institute (STRI) in their amphibian rescue initiatives',
        'Support clean freshwater watershed protection in Central America',
        'Learn about how global amphibian decline represents an early warning for ecosystem collapse',
      ],
      imageAssetPath: 'assets/images/panamanian_golden_frog.jpg',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0a/Panamanian_Golden_Frog_Atelopus_zeteki_1.jpg/640px-Panamanian_Golden_Frog_Atelopus_zeteki_1.jpg',
      imageAttribution: 'Brian Gratwicke / Wikimedia Commons / CC BY 2.0',
      sourceReference: 'IUCN Red List / Smithsonian Tropical Research Institute (STRI)',
    ),
    Species(
      id: 'hellbender',
      commonName: 'Hellbender',
      scientificName: 'Cryptobranchus alleganiensis',
      category: 'Amphibians',
      conservationStatus: ConservationStatus.vulnerable,
      habitat: 'Fast-flowing, cold, clean rocky streams and rivers with abundant large flat boulders.',
      geographicDistribution: 'Eastern United States (Appalachian Mountains and Ozarks)',
      diet: 'Carnivore (primarily freshwater crayfish; also small fish, worms, aquatic insects)',
      populationEstimate: 'Rapidly declining; local populations have collapsed by >70% across their historical range',
      description:
          'The largest amphibian in North America, reaching up to 74 cm in length, the hellbender is nicknamed the "snot otter" or "devil dog." Its flattened body and wrinkled, folded skin are biological adaptations designed to maximize cutaneous respiration directly from oxygen-rich river currents.',
      interestingFact:
          'Hellbenders absorb over 90% of their oxygen directly through the folds of their skin, making them exquisitely sensitive bioindicators of stream health—they simply cannot survive in silted or polluted rivers.',
      threats: [
        'Sedimentation from construction and agriculture filling the spaces under large rocks where they nest',
        'River damming slowing currents and reducing dissolved oxygen levels',
        'Widespread recreational disturbance: people moving river rocks to build play dams',
        'Infection from the amphibian chytrid fungus',
      ],
      conservationAction:
          'Installation of artificial concrete nesting boxes ("hellbender hotels"), captive head-starting by the Saint Louis Zoo and Nashville Zoo, and riverbank tree-planting initiatives to prevent erosion.',
      howYouCanHelp: [
        'Never move, stack, or overturn rocks in rivers and mountain streams—it destroys hellbender homes',
        'Support riparian buffer tree plantings that filter sediment and keep streams clean and cold',
        'Advocate for strong clean-water protections safeguarding mountain waterways',
      ],
      imageAssetPath: 'assets/images/eastern_hellbender.jpg',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/52/Eastern_Hellbender_%28Cryptobranchus_alleganiensis%29.jpg/640px-Eastern_Hellbender_%28Cryptobranchus_alleganiensis%29.jpg',
      imageAttribution: 'Brian Gratwicke / Wikimedia Commons / CC BY 2.0',
      sourceReference: 'IUCN Red List (Cryptobranchus alleganiensis) / US Fish & Wildlife Service',
    ),
    Species(
      id: 'mountain_chicken_frog',
      commonName: 'Mountain Chicken Frog',
      scientificName: 'Leptodactylus fallax',
      category: 'Amphibians',
      conservationStatus: ConservationStatus.criticallyEndangered,
      habitat: 'Dense tropical forest undergrowth, ravine plantations, and moist volcanic valleys.',
      geographicDistribution: 'Caribbean islands of Dominica and Montserrat',
      diet: 'Carnivore (crickets, millipedes, tarantulas, small snakes, frogs, geckos)',
      populationEstimate: '<100 wild individuals remaining (decimated by over 99% in just two decades)',
      description:
          'Despite its name, the mountain chicken is one of the largest frogs in the world, growing to over 20 cm in body length and weighing up to 1 kg. Nicknamed for its white meat that historically tasted like chicken, this giant frog is now on the brink of total extinction.',
      interestingFact:
          'Mountain chicken frogs exhibit remarkable maternal care: the mother lays unfertilized eggs specifically to feed her developing tadpoles inside an underground foam nest cavity.',
      threats: [
        'Catastrophic chytrid fungal infection that eradicated over 99% of the population in under two years',
        'Historic intensive hunting for traditional Caribbean bushmeat cuisine',
        'Volcanic eruptions of the Soufrière Hills volcano on Montserrat destroying habitat',
        'Severe hurricanes stripping forest canopy cover and desiccating breeding sites',
      ],
      conservationAction:
          'The Mountain Chicken Recovery Programme: establishing biosecure captive breeding centers in Europe, testing heated environmental refuges that kill chytrid fungus, and wild telemetry monitoring.',
      howYouCanHelp: [
        'Support the Mountain Chicken Recovery Programme led by Durrell and the Zoological Society of London',
        'Advocate for strict island biosecurity measures preventing pathogen introductions',
        'Raise awareness about how fungal epidemics can push resilient species to extinction in months',
      ],
      imageAssetPath: 'assets/images/mountain_chicken_frog.jpg',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/22/Mountain_chicken_frog_%28Leptodactylus_fallax%29.jpg/640px-Mountain_chicken_frog_%28Leptodactylus_fallax%29.jpg',
      imageAttribution: 'TimVickers / Wikimedia Commons / Public Domain',
      sourceReference: 'IUCN Red List (Leptodactylus fallax) / Mountain Chicken Recovery Programme',
    ),
    Species(
      id: 'olm',
      commonName: 'Olm',
      scientificName: 'Proteus anguinus',
      category: 'Amphibians',
      conservationStatus: ConservationStatus.vulnerable,
      habitat: 'Subterranean subterranean limestone karst water systems, flooded underground caverns, and deep sinkholes.',
      geographicDistribution: 'Dinaric Alps of southeastern Europe (Slovenia, Croatia, Bosnia & Herzegovina, Italy)',
      diet: 'Carnivore (small subterranean cave shrimp, aquatic snails, worms, insect larvae)',
      populationEstimate: 'Unknown due to inaccessible cave habitats; highly threatened by ground-water pollution',
      description:
          'Often called the "Human Fish" or "Baby Dragon" in medieval European folklore, the olm is an entirely cave-dwelling aquatic salamander. Lacking eyes and skin pigment, it possesses extraordinary non-visual sensory systems and an astonishing lifespan exceeding 100 years.',
      interestingFact:
          'Due to its exceptionally low metabolic rate in cold underground cave waters, an olm can survive for up to 10 years without consuming any food whatsoever.',
      threats: [
        'Agricultural pesticides, heavy metals, and municipal wastewater leaking into karst groundwater',
        'Hydroelectric dams altering subterranean water tables and cave flow dynamics',
        'Illegal collection of cave specimens for underground biological trade',
        'Extreme specialization rendering it incapable of surviving outside subterranean habitats',
      ],
      conservationAction:
          'Strict legal protection in Slovenia and the EU Habitats Directive, groundwater quality monitoring across the Dinaric karst, and biosecure subterranean breeding research at Postojna Cave.',
      howYouCanHelp: [
        'Support groundwater conservation and proper hazardous waste disposal in karst limestone regions',
        'Protect surface wetlands and sinkholes that feed underground cave aquifer systems',
        'Support speleological societies mapping subterranean biodiversity',
      ],
      imageAssetPath: 'assets/images/olm.jpg',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f0/Proteus_anguinus_Postojnska_Jama_Slovenija.jpg/640px-Proteus_anguinus_Postojnska_Jama_Slovenija.jpg',
      imageAttribution: 'Arne Hodalič / Wikimedia Commons / CC BY-SA 3.0',
      sourceReference: 'IUCN Red List (Proteus anguinus) / Postojna Cave Biology Laboratory',
    ),

    // -------------------------------------------------------------------------
    // MARINE LIFE
    // -------------------------------------------------------------------------
    Species(
      id: 'blue_whale',
      commonName: 'Blue Whale',
      scientificName: 'Balaenoptera musculus',
      category: 'Marine Life',
      conservationStatus: ConservationStatus.endangered,
      habitat: 'Pelagic open ocean waters, polar feeding margins, and equatorial breeding zones.',
      geographicDistribution: 'All world oceans except the Arctic (Southern Ocean, North Atlantic, North Pacific)',
      diet: 'Carnivore/Filter Feeder (consumes up to 4 metric tons of tiny krill per day)',
      populationEstimate: '~10,000 – 25,000 individuals (~3–10% of historic pre-whaling abundance)',
      description:
          'The blue whale is the largest known animal ever to have lived on Planet Earth, reaching lengths of up to 30 meters and weights exceeding 190 metric tons. A majestic gentle giant, its heart alone is the size of a small car.',
      interestingFact:
          'A blue whale\'s underwater vocalizations can reach an astounding 188 decibels—louder than a jet engine—traveling hundreds of kilometers across deep ocean basins to communicate with distant pods.',
      threats: [
        'Commercial ship strikes along high-density maritime shipping lanes',
        'Lethal entanglement in heavy commercial fishing gear and deep-sea gill nets',
        'Anthropogenic ocean noise pollution disrupting long-distance acoustic communication',
        'Climate change impacting Antarctic sea ice cover and krill abundance',
      ],
      conservationAction:
          'International Whaling Commission (IWC) commercial hunting ban, rerouting international shipping corridors away from coastal feeding zones, and acoustic buoy monitoring.',
      howYouCanHelp: [
        'Support shifting commercial vessel shipping lanes away from known whale migration corridors',
        'Advocate for slower vessel speeds in critical marine whale habitats to prevent deadly ship strikes',
        'Reduce single-use plastic waste that breaks down into toxic marine microplastics',
      ],
      imageAssetPath: 'assets/images/blue_whale.jpg',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1c/Anim1754_-_Flickr_-_NOAA_Photo_Library.jpg/640px-Anim1754_-_Flickr_-_NOAA_Photo_Library.jpg',
      imageAttribution: 'NOAA Photo Library / Wikimedia Commons / Public Domain',
      sourceReference: 'IUCN Red List / International Whaling Commission (IWC)',
    ),
    Species(
      id: 'hawksbill_turtle',
      commonName: 'Hawksbill Sea Turtle',
      scientificName: 'Eretmochelys imbricata',
      category: 'Marine Life',
      conservationStatus: ConservationStatus.criticallyEndangered,
      habitat: 'Tropical coral reefs, coastal rocky shoals, and tropical sandy nesting beaches.',
      geographicDistribution: 'Tropical and subtropical waters of the Atlantic, Pacific, and Indian Oceans',
      diet: 'Specialized Spongivore (feeds almost exclusively on toxic marine sponges, algae, and jellyfish)',
      populationEstimate: '<25,000 nesting females worldwide (declined by >80% over the last century)',
      description:
          'Recognizable by its narrow, hooked beak resembling a bird of prey and overlapping carapace scutes, the hawksbill is an indispensable steward of coral reef health, preventing aggressive glass sponges from suffocating fragile living corals.',
      interestingFact:
          'By consuming toxic sea sponges that are packed with glass-like spicules and chemical toxins that would kill other animals, hawksbills open up space for reef corals to flourish.',
      threats: [
        'Illegal international trade in "tortoiseshell" carved jewelry and decorative trinkets',
        'Devastating loss of coral reef ecosystems driven by ocean acidification and warming',
        'Artificial lighting on coastal nesting beaches disorienting newly hatched turtles',
        'Accidental bycatch in commercial longline, trawl, and gillnet fisheries',
      ],
      conservationAction:
          'CITES Appendix I ban on tortoiseshell commercial trade, coastal community nest patrolling, satellite tagging of foraging pathways, and switching coastal beach lighting to turtle-safe red wavelengths.',
      howYouCanHelp: [
        'Never purchase tortoiseshell hairclips, jewelry, guitar picks, or souvenirs when traveling',
        'Turn off or shield coastal beachfront lights during nighttime sea turtle nesting seasons',
        'Choose reef-safe, oxybenzone-free sunscreens to protect coral reef feeding habitats',
      ],
      imageAssetPath: 'assets/images/hawksbill_turtle.jpg',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b3/Hawksbill_Sea_Turtle_caretta_caretta.jpg/640px-Hawksbill_Sea_Turtle_caretta_caretta.jpg',
      imageAttribution: 'Caroline Rogers / US Geological Survey / Public Domain',
      sourceReference: 'IUCN Red List / State of the World\'s Sea Turtles (SWOT) Reports',
    ),
    Species(
      id: 'vaquita',
      commonName: 'Vaquita',
      scientificName: 'Phocoena sinus',
      category: 'Marine Life',
      conservationStatus: ConservationStatus.criticallyEndangered,
      habitat: 'Shallow coastal turbid waters and lagoons with strong tidal currents.',
      geographicDistribution: 'Confined strictly to a tiny northern corner of the Gulf of California (Sea of Cortez), Mexico',
      diet: 'Carnivore (small bottom-dwelling teleost fish, croakers, squids, crustaceans)',
      populationEstimate: '~10 – 13 individuals remaining (the most endangered marine mammal in the world)',
      description:
          'The world\'s smallest cetacean, the vaquita reaches barely 1.5 meters in length. Easily identified by dark rings around its eyes and dark lips that create a perpetually smiling appearance, it is on the knife-edge of total extinction.',
      interestingFact:
          'The vaquita was discovered scientifically only in 1958 based on three skulls found on a Baja beach; its entire global population lives in an area smaller than metropolitan Los Angeles.',
      threats: [
        'Bycatch in illegal monofilament gillnets set for totoaba, an endangered fish whose swim bladder is trafficked to China',
        'Severe genetic bottleneck risk from an extremely small surviving reproductive population',
        'Illegal night-time fishing operations violating marine exclusion zones',
        'Pesticide runoff and altered freshwater flow from the Colorado River delta',
      ],
      conservationAction:
          'Zero-tolerance exclusion zone enforced by the Mexican Navy and Sea Shepherd (Operation Milagro), retrieving submerged ghost nets, and acoustic hydrophone population tracking.',
      howYouCanHelp: [
        'Support Sea Shepherd\'s Operation Milagro in retrieving illegal gillnets from the vaquita refuge',
        'Advocate for international trade sanctions against totoaba fish bladder trafficking cartels',
        'Support sustainable net-free hook-and-line fishing alternatives for local Mexican fishing cooperatives',
      ],
      imageAssetPath: 'assets/images/vaquita.jpg',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4b/Phocoena_sinus_illustration.jpg/640px-Phocoena_sinus_illustration.jpg',
      imageAttribution: 'NOAA / Wikimedia Commons / Public Domain',
      sourceReference: 'IUCN Red List (Phocoena sinus) / CIRVA (International Committee for the Recovery of the Vaquita)',
    ),
    Species(
      id: 'whale_shark',
      commonName: 'Whale Shark',
      scientificName: 'Rhincodon typus',
      category: 'Marine Life',
      conservationStatus: ConservationStatus.endangered,
      habitat: 'Warm tropical and warm-temperate pelagic oceans, coastal lagoons, and upwelling zones.',
      geographicDistribution: 'Circumtropical in all tropical and warm-temperate seas (Ningaloo Reef, Galápagos, Mexico, Philippines)',
      diet: 'Filter Feeder (plankton, krill, fish eggs, crab larvae, small schooling sardines)',
      populationEstimate: 'Global population has halved over the last 75 years; exact numbers unknown',
      description:
          'The largest living non-mammalian vertebrate on Earth, the whale shark can grow up to 18 meters in length. Despite its colossal size, this gentle giant is a completely harmless filter feeder that glides peacefully through tropical oceans with its cavernous mouth agape.',
      interestingFact:
          'Just like human fingerprints, the constellation of white spots and pale stripes on a whale shark\'s flanks is completely unique to each individual, allowing researchers to track them using Hubble Space Telescope star-mapping algorithms.',
      threats: [
        'Targeted illegal harpoon hunting for fins, meat, and liver oil',
        'Collisions with commercial shipping vessels and high-speed ferries near coastal feeding bays',
        'Bycatch entanglement in commercial purse-seine tuna nets',
        'Ingestion of marine microplastics and marine debris during surface filter feeding',
      ],
      conservationAction:
          'CITES Appendix II international trade protections, ecotourism code-of-conduct enforcement requiring a 3-meter swimmer distance, and global satellite telemetry tracking.',
      howYouCanHelp: [
        'Practice responsible wildlife tourism: never touch, chase, or crowd whale sharks when swimming',
        'Support community citizen-science photo ID databases (Wildbook for Whale Sharks)',
        'Choose sustainably caught pole-and-line tuna to avoid destructive purse-seine net bycatch',
      ],
      imageAssetPath: 'assets/images/whale_shark.jpg',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f6/Whale_shark_Georgia_aquarium.jpg/640px-Whale_shark_Georgia_aquarium.jpg',
      imageAttribution: 'Zac Wolf / Wikimedia Commons / CC BY-SA 2.5',
      sourceReference: 'IUCN Red List (Rhincodon typus) / Wildbook for Whale Sharks',
    ),
    Species(
      id: 'leatherback_turtle',
      commonName: 'Leatherback Sea Turtle',
      scientificName: 'Dermochelys coriacea',
      category: 'Marine Life',
      conservationStatus: ConservationStatus.vulnerable,
      habitat: 'Open pelagic oceans, deep oceanic trenches, and tropical nesting beaches.',
      geographicDistribution: 'Global oceans; ranges as far north as Alaska and Norway, and south to New Zealand',
      diet: 'Specialized Gelatinivore (almost exclusively soft-bodied jellyfish, salps, and siphonophores)',
      populationEstimate: '~20,000 – 30,000 nesting females globally (Pacific populations have collapsed by >90%)',
      description:
          'The largest sea turtle in the world, the leatherback can weigh over 700 kg. Unlike all other sea turtles, it lacks a rigid bony shell, sporting instead a flexible, leathery carapace embedded with thousands of tiny bone plates and seven distinct longitudinal ridges.',
      interestingFact:
          'Leatherbacks are the deepest diving marine reptiles, capable of plunging to depths of over 1,200 meters into near-freezing ocean abysses where pressure exceeds 100 atmospheres.',
      threats: [
        'Tragic mistaking of floating translucent plastic bags for jellyfish prey, causing fatal gut impaction',
        'Accidental bycatch mortality in commercial pelagic longline hooks and oceanic driftnets',
        'Poaching of turtle eggs on remote tropical beaches',
        'Rising sand temperatures from global warming skewing hatchling sex ratios to 100% females',
      ],
      conservationAction:
          'Enforcing Turtle Excluder Devices (TEDs) on commercial trawlers, beach ranger night patrols protecting nesting females, and shade-cloth hatchery management to maintain healthy male/female ratios.',
      howYouCanHelp: [
        'Eliminate single-use plastic bags that floating turtles mistake for jellyfish',
        'Support fisheries transitioning to circle hooks that reduce lethal turtle bycatch',
        'Contribute to beach protection networks that guard coastal nesting corridors',
      ],
      imageAssetPath: 'assets/images/leatherback_turtle.jpg',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e6/Leatherback_turtle_Dermochelys_coriacea.jpg/640px-Leatherback_turtle_Dermochelys_coriacea.jpg',
      imageAttribution: 'USFWS / Wikimedia Commons / Public Domain',
      sourceReference: 'IUCN Red List (Dermochelys coriacea) / SWOT Marine Turtle Specialist Group',
    ),
    Species(
      id: 'dugong',
      commonName: 'Dugong',
      scientificName: 'Dugong dugon',
      category: 'Marine Life',
      conservationStatus: ConservationStatus.vulnerable,
      habitat: 'Shallow protected coastal waters, sheltered bays, mangrove channels, and seagrass meadows.',
      geographicDistribution: 'Indo-West Pacific (northern Australia, Persian Gulf, Red Sea, Southeast Asia, East Africa)',
      diet: 'Strict Herbivore (exclusively feeds on marine seagrasses, consuming up to 40 kg daily)',
      populationEstimate: '~100,000 worldwide (majority along northern Australia; functionally extinct in China since 2022)',
      description:
          'Related more closely to elephants than to whales, the dugong is the only strictly marine herbivorous mammal. Featuring a paddle-like fluked tail and a downturned muzzle adapted for vacuuming up benthic seagrass roots, it is the creature behind centuries of mermaid myths.',
      interestingFact:
          'Dugongs are nicknamed "sea cows" because they graze endlessly on underwater seagrass meadows, aerating ocean floor sediment and stimulating fresh, nutrient-rich seagrass regrowth.',
      threats: [
        'Catastrophic destruction of seagrass beds by coastal dredging, port construction, and agricultural runoff',
        'Entanglement and drowning in commercial coastal gillnets and shark exclusion nets',
        'Propeller strikes from high-speed motorboats and coastal shipping',
        'Declared functionally extinct in Chinese coastal waters in 2022 due to industrial coastal development',
      ],
      conservationAction:
          'Establishment of marine protected seagrass sanctuaries (such as Australia\'s Shark Bay), boat speed limit zones in coastal shallows, and satellite telemetry mapping of grazing herds.',
      howYouCanHelp: [
        'Support seagrass meadow restoration and marine coastal blue-carbon initiatives',
        'Observe slow boat speed limits when navigating shallow coastal bays and estuaries',
        'Prevent fertilizer and pesticide runoff that causes algal blooms choking out marine seagrass',
      ],
      imageAssetPath: 'assets/images/dugong.jpg',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cd/Dugong_Marsa_Alam.jpg/640px-Dugong_Marsa_Alam.jpg',
      imageAttribution: 'Julien Willem / Wikimedia Commons / CC BY-SA 3.0',
      sourceReference: 'IUCN Red List (Dugong dugon) / UNEP Dugong Memorandum of Understanding',
    ),
    Species(
      id: 'north_atlantic_right_whale',
      commonName: 'North Atlantic Right Whale',
      scientificName: 'Eubalaena glacialis',
      category: 'Marine Life',
      conservationStatus: ConservationStatus.criticallyEndangered,
      habitat: 'Temperate and subpolar coastal continental shelf waters.',
      geographicDistribution: 'Western North Atlantic (coastal waters from Florida to the Gulf of St. Lawrence, Canada)',
      diet: 'Filter Feeder (dense patches of calanoid copepods, krill, and cyprid larvae)',
      populationEstimate: '<360 individuals remaining (fewer than 70 breeding females)',
      description:
          'A majestic baleen whale lacking a dorsal fin and recognized by white callosities (roughened skin patches) on its head, it was historically dubbed the "right" whale to hunt by whalers because it swam slowly, stayed near shore, and floated when killed.',
      interestingFact:
          'The white patches on a right whale\'s head are called callosities; colonies of small white whale lice (cyamids) live on these patches, creating patterns unique to every individual whale.',
      threats: [
        'Horrific entanglement in heavy vertical commercial lobster and snow crab trap ropes',
        'Blunt-force vessel collisions with large container ships and high-speed ferries',
        'Shifting copepod prey distributions driven by rapid Gulf of Maine warming',
        'Low reproductive birth rates compounded by chronic stress from acoustic noise and entanglement',
      ],
      conservationAction:
          'Development of "ropeless" on-demand fishing gear, seasonal dynamic vessel speed restrictions (10 knots), and real-time passive acoustic listening hydrophones along eastern shipping routes.',
      howYouCanHelp: [
        'Support transitioning commercial fisheries to ropeless on-demand trap technologies',
        'Support mandatory speed limit regulations for large vessels transiting whale migratory corridors',
        'Choose seafood certified by sustainable fisheries that eliminate vertical marine ropes',
      ],
      imageAssetPath: 'assets/images/north_atlantic_right_whale.jpg',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/87/Eubalaena_glacialis_with_calf.jpg/640px-Eubalaena_glacialis_with_calf.jpg',
      imageAttribution: 'Georgia DNR / NOAA / Public Domain',
      sourceReference: 'IUCN Red List / North Atlantic Right Whale Consortium Annual Report',
    ),

    // -------------------------------------------------------------------------
    // FRESHWATER SPECIES
    // -------------------------------------------------------------------------
    Species(
      id: 'yangtze_finless_porpoise',
      commonName: 'Yangtze Finless Porpoise',
      scientificName: 'Neophocaena asiaeorientalis asiaeorientalis',
      category: 'Freshwater',
      conservationStatus: ConservationStatus.criticallyEndangered,
      habitat: 'Mainstem Yangtze river waters, junction confluences, and large adjoining freshwater lakes (Poyang and Dongting).',
      geographicDistribution: 'Middle and lower reaches of the Yangtze River basin, China',
      diet: 'Piscivore (small freshwater fish, river gobies, carps, shrimps)',
      populationEstimate: '~1,249 individuals (first population increase recorded after historic 10-year fishing ban)',
      description:
          'Known affectionately in China as the "smiling angel" of the Yangtze due to its friendly facial expression, this shy freshwater cetacean is the sole surviving mammal in the river following the tragic extinction of the Baiji river dolphin in 2006.',
      interestingFact:
          'Yangtze finless porpoises possess cognitive intelligence on par with chimpanzees and utilize sophisticated high-frequency biosonar clicks to navigate murky, sediment-laden river waters.',
      threats: [
        'Historically intensive commercial overfishing that stripped the river of fish prey',
        'Fatal strikes from motorized boat propellers in congested river shipping lanes',
        'Industrial chemical pollution and underwater noise disrupting acoustic echolocation',
        'Illegal sand dredging operations destroying natural riverbed fish spawning grounds',
      ],
      conservationAction:
          'China\'s historic 10-year complete commercial fishing moratorium on the Yangtze (enacted 2021), establishing semi-natural oxbow lake sanctuaries (Tian-e-Zhou), and artificial breeding.',
      howYouCanHelp: [
        'Support freshwater river biodiversity initiatives and sustainable water governance',
        'Learn from the tragic extinction of the Baiji dolphin to ensure the Finless Porpoise survives',
        'Support strict enforcement of industrial effluent regulations along major river corridors',
      ],
      imageAssetPath: 'assets/images/yangtze_finless_porpoise.jpg',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/dc/Yangtze_finless_porpoise%2C_10_November_2006.jpg/640px-Yangtze_finless_porpoise%2C_10_November_2006.jpg',
      imageAttribution: 'Institute of Hydrobiology, Chinese Academy of Sciences / CC BY-SA 3.0',
      sourceReference: 'IUCN Red List / Ministry of Agriculture and Rural Affairs of China 2023 Survey',
    ),
    Species(
      id: 'mekong_giant_catfish',
      commonName: 'Mekong Giant Catfish',
      scientificName: 'Pangasianodon gigas',
      category: 'Freshwater',
      conservationStatus: ConservationStatus.criticallyEndangered,
      habitat: 'Deep mainstem river pools, rocky rapids, and seasonal flooded forest tributaries.',
      geographicDistribution: 'Lower Mekong River basin (Cambodia, Laos, Thailand, Vietnam)',
      diet: 'Herbivore (juveniles feed on zooplankton; adults feed exclusively on benthic algae and periphyton)',
      populationEstimate: '<200 mature individuals remaining in the wild (plunged by >90% since 1990)',
      description:
          'One of the largest freshwater fish in the world, the Mekong giant catfish can grow up to 3 meters in length and tip the scales at nearly 300 kilograms. It loses all its teeth and barbels as an adult, browsing peacefully on filamentous river algae.',
      interestingFact:
          'A giant female Mekong catfish caught in northern Thailand in 2005 weighed 293 kilograms—the largest documented freshwater fish ever officially recorded in modern history.',
      threats: [
        'Cascade of massive hydroelectric dams blocking long-distance upstream spawning migrations',
        'Historically heavy overfishing using massive specialized gill nets',
        'Destruction of rocky river rapids and deep refuge pools by commercial river navigation blasting',
        'Altered river flow pulses caused by upstream reservoir operations',
      ],
      conservationAction:
          'Tri-national conservation agreements between Thailand, Laos, and Cambodia, buying wild-caught specimens to tag and release alive, and captive assurance breeding in Thailand.',
      howYouCanHelp: [
        'Advocate for free-flowing river policies that prevent damming of critical Mekong fish migration channels',
        'Support community-managed river conservation zones ("Fish Conservation Zones") in the Mekong basin',
        'Support international freshwater river restoration coalitions',
      ],
      imageAssetPath: 'assets/images/mekong_giant_catfish.jpg',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cf/Pangasianodon_gigas.jpg/640px-Pangasianodon_gigas.jpg',
      imageAttribution: 'Suthep Kritsanavarin / WWF / CC BY-SA 3.0',
      sourceReference: 'IUCN Red List (Pangasianodon gigas) / Mekong River Commission (MRC)',
    ),
    Species(
      id: 'beluga_sturgeon',
      commonName: 'Beluga Sturgeon',
      scientificName: 'Huso huso',
      category: 'Freshwater',
      conservationStatus: ConservationStatus.criticallyEndangered,
      habitat: 'Large deep rivers for spawning, migrating into coastal marine seas and brackish estuaries.',
      geographicDistribution: 'Caspian Sea, Black Sea, and Sea of Azov basins (Danube, Volga, and Ural rivers)',
      diet: 'Carnivore (fishes such as gobies, herrings, and roach; mollusks and crustaceans)',
      populationEstimate: 'Wild populations collapsed by >90% over the last three generations',
      description:
          'An ancient armored leviathan that has swam Earth\'s waters since the era of the dinosaurs (over 200 million years), the beluga sturgeon can live for over 100 years and grow to over 6 meters in length, making it the largest freshwater-associated fish on the planet.',
      interestingFact:
          'Beluga sturgeons can take up to 15 to 20 years just to reach sexual maturity, meaning that harvesting breeding females wipes out decades of reproductive potential in a single net.',
      threats: [
        'Relentless illegal poaching driven by the astronomically lucrative black market for Beluga caviar',
        'Hydroelectric dams (such as Iron Gate on the Danube and Volgograd on the Volga) blocking ancestral spawning runs',
        'Severe river siltation and pollution destroying clean gravel riverbeds required for egg adhesion',
        'Massive historic habitat fragmentation across the Caspian and Black Sea basins',
      ],
      conservationAction:
          'International trade bans under CITES, electronic tracking of released hatchery-reared juveniles, and constructing specialized fish lifts and passages on Danube and Volga dams.',
      howYouCanHelp: [
        'Never purchase wild-harvested sturgeon caviar; ensure any caviar consumed is certified sustainable aquaculture',
        'Support fish passage installation and river reconnection initiatives on major European waterways',
        'Advocate for strict border enforcement against illegal sturgeon roe smuggling syndicates',
      ],
      imageAssetPath: 'assets/images/beluga_sturgeon.jpg',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/Huso_huso.jpg/640px-Huso_huso.jpg',
      imageAttribution: 'Wikimedia Commons / Public Domain',
      sourceReference: 'IUCN Red List (Huso huso) / World Sturgeon Conservation Society (WSCS)',
    ),
    Species(
      id: 'giant_freshwater_stingray',
      commonName: 'Giant Freshwater Stingray',
      scientificName: 'Urogymnus polylepis',
      category: 'Freshwater',
      conservationStatus: ConservationStatus.endangered,
      habitat: 'Large, deep, slow-moving tropical river channels with sandy or muddy riverbeds.',
      geographicDistribution: 'Major river basins of Southeast Asia (Mekong, Chao Phraya, and Borneo)',
      diet: 'Carnivore (riverbed clams, crabs, benthic crustaceans, small bottom-dwelling fish)',
      populationEstimate: 'Severely declining; highly fragmented across major river systems',
      description:
          'Lurking on the bottom of Southeast Asian river channels, this titanic elasmobranch is arguably the world\'s heaviest freshwater fish. With a circular disc measuring up to 2.2 meters across and a serrated venomous tail spine reaching 38 cm, it is a magnificent river wonder.',
      interestingFact:
          'In June 2022, Cambodian fishermen in the Mekong River hooked a female giant freshwater stingray that weighed an astonishing 300 kg (661 lbs), officially verified as the heaviest freshwater fish ever recorded.',
      threats: [
        'Hydroelectric dam construction blocking river migrations and fragmenting populations',
        'Industrial and agricultural chemical pollution settling into benthic river muds',
        'Accidental entanglement in deep heavy commercial fishing hooks and bottom longlines',
        'River sand mining stripping away the muddy benthic substrates where rays bury themselves',
      ],
      conservationAction:
          'The Wonders of the Mekong research project, community acoustic tagging and release programs in Cambodia, and designating deep-pool river refuges as protected aquatic zones.',
      howYouCanHelp: [
        'Support community-led catch-and-release research programs that compensate local fishermen',
        'Advocate against unregulated riverbed sand mining that destroys benthic aquatic habitats',
        'Support international freshwater river basin preservation initiatives in Indochina',
      ],
      imageAssetPath: 'assets/images/giant_freshwater_stingray.jpg',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d4/Giant_freshwater_stingray.jpg/640px-Giant_freshwater_stingray.jpg',
      imageAttribution: 'Zeb Hogan / Wonders of the Mekong / CC BY-SA 3.0',
      sourceReference: 'IUCN Red List (Urogymnus polylepis) / Wonders of the Mekong Project',
    ),
    Species(
      id: 'european_eel',
      commonName: 'European Eel',
      scientificName: 'Anguilla anguilla',
      category: 'Freshwater',
      conservationStatus: ConservationStatus.criticallyEndangered,
      habitat: 'Freshwater rivers, streams, lakes, and estuaries for growth; Sargasso Sea for spawning.',
      geographicDistribution: 'Freshwater rivers and coastal seas of Europe and North Africa; breeds in the Sargasso Sea',
      diet: 'Carnivore/Omnivore (aquatic invertebrates, insect larvae, worms, small fish, mollusks)',
      populationEstimate: 'Recruitment of juvenile glass eels has plummeted by >95% since 1980',
      description:
          'The European eel undertakes one of the most astonishing catadromous migrations in the animal kingdom. Living in European freshwater streams for up to 20 years, adults transform into "silver eels" and swim 6,000 kilometers across the Atlantic to spawn and die in the Sargasso Sea.',
      interestingFact:
          'For centuries, Aristotle believed eels arose spontaneously from river mud because no one had ever found eel eggs or reproductive organs in freshwater—their breeding remained an unsolved mystery until 1922.',
      threats: [
        'Hydropower turbines slicing through adult eels migrating downstream to spawn',
        'Massive illegal wildlife trafficking: billions of juvenile "glass eels" smuggled to Asia',
        'Over 1 million river barriers (weirs, sluices, dams) obstructing upstream migration',
        'Infection by the invasive swim-bladder parasite Anguillicoloides crassus',
      ],
      conservationAction:
          'EU Eel Regulation establishing national eel management plans, trap-and-transport programs moving mature eels safely past turbines, and international police operations busting glass-eel smuggling rings.',
      howYouCanHelp: [
        'Refuse to consume uncertified eel or "unagi" products, which often rely on poached wild glass eels',
        'Support dam removal and the installation of fish ladders and bypass channels across European rivers',
        'Advocate for strict customs enforcement against illegal air shipment of juvenile glass eels',
      ],
      imageAssetPath: 'assets/images/european_eel.jpg',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cd/Anguilla_anguilla.jpg/640px-Anguilla_anguilla.jpg',
      imageAttribution: 'Gérard M / Wikimedia Commons / CC BY-SA 3.0',
      sourceReference: 'IUCN Red List (Anguilla anguilla) / ICES Eel Advice Reports',
    ),
    Species(
      id: 'arapaima',
      commonName: 'Arapaima',
      scientificName: 'Arapaima gigas',
      category: 'Freshwater',
      conservationStatus: ConservationStatus.vulnerable,
      habitat: 'Amazon and Essequibo river floodplains, oxbow lakes, and varzea flooded forests.',
      geographicDistribution: 'Amazon River basin across Brazil, Peru, Colombia, Guyana, and Ecuador',
      diet: 'Carnivore (river fishes, crustaceans, small mammals, frogs, and low-flying birds)',
      populationEstimate: 'Local populations have suffered severe historical declines; recovering under community management',
      description:
          'Known as the "Pirarucu" in Brazil and "Paiche" in Peru, the arapaima is an air-breathing freshwater titan reaching up to 3 meters in length and 200 kg in weight. Equipped with armored, mineralized scales that resist piranha teeth, it is a living fossil of the Amazon.',
      interestingFact:
          'Because the warm, vegetated floodplain lakes it inhabits are notoriously low in dissolved oxygen, the arapaima has evolved a swim bladder that acts like a primitive lung, requiring it to surface for gulps of air every 5 to 15 minutes.',
      threats: [
        'Commercial gillnet overfishing capitalizing on its need to surface for air',
        'Deforestation of flooded forests (várzea) that provide critical fruit and invertebrate food',
        'Construction of Amazon basin hydroelectric dams altering seasonal flood cycles',
        'Illegal harpoon hunting during low-water dry seasons',
      ],
      conservationAction:
          'Pioneering community-based management in the Mamirauá Sustainable Development Reserve, which established participatory annual census quotas that restored wild populations by over 400%.',
      howYouCanHelp: [
        'Support community-managed sustainable fisheries that empower indigenous Amazonian river communities',
        'Support conservation of the Amazonian flooded várzea forest ecosystems',
        'Ensure any commercial fish purchases originate from certified sustainable community reserves',
      ],
      imageAssetPath: 'assets/images/arapaima.jpg',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/Arapaima_gigas_2.jpg/640px-Arapaima_gigas_2.jpg',
      imageAttribution: 'Jeff Kubina / Wikimedia Commons / CC BY-SA 2.0',
      sourceReference: 'IUCN Red List / Instituto Mamirauá Sustainable Management Reports',
    ),
  ];
}





