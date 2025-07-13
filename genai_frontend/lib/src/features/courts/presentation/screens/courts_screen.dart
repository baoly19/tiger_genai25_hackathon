import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CourtsScreen extends StatefulWidget {
  const CourtsScreen({super.key});

  @override
  State<CourtsScreen> createState() => _CourtsScreenState();
}

class _CourtsScreenState extends State<CourtsScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedSport = 'All';
  String _selectedPriceRange = 'All';
  double _maxDistance = 10.0;
  bool _showFilters = false;

  final List<String> _sports = ['All', 'Tennis', 'Basketball', 'Badminton', 'Football', 'Volleyball'];
  final List<String> _priceRanges = ['All', 'Under \$20', '\$20-\$40', '\$40-\$60', 'Over \$60'];

  // Mock data - replace with real data from Supabase later
  final List<Map<String, dynamic>> _courts = [
    {
      'id': '1',
      'name': 'Central Sports Complex',
      'location': 'Downtown',
      'distance': 2.3,
      'price': 25,
      'rating': 4.8,
      'reviews': 156,
      'sport': 'Tennis',
      'amenities': ['Parking', 'Lighting', 'Changing Rooms'],
      'availability': 'Available',
      'image': null,
    },
    {
      'id': '2',
      'name': 'Riverside Basketball Courts',
      'location': 'Riverside Park',
      'distance': 1.8,
      'price': 15,
      'rating': 4.5,
      'reviews': 89,
      'sport': 'Basketball',
      'amenities': ['Parking', 'Water Fountain'],
      'availability': 'Busy',
      'image': null,
    },
    {
      'id': '3',
      'name': 'Elite Tennis Academy',
      'location': 'North District',
      'distance': 4.2,
      'price': 45,
      'rating': 4.9,
      'reviews': 203,
      'sport': 'Tennis',
      'amenities': ['Parking', 'Lighting', 'Changing Rooms', 'Pro Shop', 'Coaching'],
      'availability': 'Available',
      'image': null,
    },
    {
      'id': '4',
      'name': 'Community Football Field',
      'location': 'West Side',
      'distance': 3.1,
      'price': 30,
      'rating': 4.2,
      'reviews': 67,
      'sport': 'Football',
      'amenities': ['Parking', 'Lighting'],
      'availability': 'Available',
      'image': null,
    },
    {
      'id': '5',
      'name': 'Badminton Center',
      'location': 'City Center',
      'distance': 2.7,
      'price': 20,
      'rating': 4.6,
      'reviews': 124,
      'sport': 'Badminton',
      'amenities': ['Parking', 'Air Conditioning', 'Equipment Rental'],
      'availability': 'Available',
      'image': null,
    },
  ];

  List<Map<String, dynamic>> get _filteredCourts {
    return _courts.where((court) {
      // Search filter - safe access with null checks
      final searchText = _searchController.text;
      if (searchText.isNotEmpty) {
        final query = searchText.toLowerCase();
        final courtName = court['name']?.toString().toLowerCase() ?? '';
        final courtLocation = court['location']?.toString().toLowerCase() ?? '';
        if (!courtName.contains(query) && !courtLocation.contains(query)) {
          return false;
        }
      }

      // Sport filter - safe access
      final courtSport = court['sport']?.toString() ?? '';
      if (_selectedSport != 'All' && courtSport != _selectedSport) {
        return false;
      }

      // Price filter - safe access with fallback
      if (_selectedPriceRange != 'All') {
        final price = (court['price'] as num?)?.toInt() ?? 0;
        switch (_selectedPriceRange) {
          case 'Under \$20':
            if (price >= 20) return false;
            break;
          case '\$20-\$40':
            if (price < 20 || price > 40) return false;
            break;
          case '\$40-\$60':
            if (price < 40 || price > 60) return false;
            break;
          case 'Over \$60':
            if (price <= 60) return false;
            break;
        }
      }

      // Distance filter - safe access with fallback
      final distance = (court['distance'] as num?)?.toDouble() ?? 0.0;
      if (distance > _maxDistance) {
        return false;
      }

      return true;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Courts'),
        actions: [
          IconButton(
            icon: Icon(_showFilters ? Icons.filter_list : Icons.filter_list_outlined),
            onPressed: () {
              setState(() {
                _showFilters = !_showFilters;
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search courts or locations...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: (_searchController.text.isNotEmpty) == true
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          setState(() {
                            _searchController.clear();
                          });
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (value) {
                setState(() {});
              },
            ),
          ),

          // Filters Panel
          if (_showFilters)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sport',
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                const SizedBox(height: 8),
                                DropdownButtonFormField<String>(
                                  value: _selectedSport,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                  ),
                                  items: _sports.map((sport) {
                                    return DropdownMenuItem(
                                      value: sport,
                                      child: Text(sport),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedSport = value!;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Price Range',
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                const SizedBox(height: 8),
                                DropdownButtonFormField<String>(
                                  value: _selectedPriceRange,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                  ),
                                  items: _priceRanges.map((range) {
                                    return DropdownMenuItem(
                                      value: range,
                                      child: Text(range),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedPriceRange = value!;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Max Distance: ${_maxDistance.toStringAsFixed(1)} km',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Slider(
                        value: _maxDistance,
                        min: 1.0,
                        max: 50.0,
                        divisions: 49,
                        onChanged: (value) {
                          setState(() {
                            _maxDistance = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),

          const SizedBox(height: 8),

          // Results Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${_filteredCourts.length} courts found',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.map_outlined),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Map view coming soon!')),
                    );
                  },
                ),
              ],
            ),
          ),

          // Courts List
          Expanded(
            child: _filteredCourts.isEmpty
                ? const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search_off,
                          size: 80,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 16),
                        Text(
                          'No courts found',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Try adjusting your filters',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    itemCount: _filteredCourts.length,
                    itemBuilder: (context, index) {
                      final court = _filteredCourts[index];
                      return _CourtCard(
                        court: court,
                        onTap: () {
                          context.push('/court/${court['id']}');
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}

class _CourtCard extends StatelessWidget {
  final Map<String, dynamic> court;
  final VoidCallback onTap;

  const _CourtCard({
    required this.court,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Court Image Placeholder
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      _getIconForSport(court['sport']),
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      size: 32,
                    ),
                  ),
                  const SizedBox(width: 16),
                  
                  // Court Info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                court['name'],
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: _getAvailabilityColor(court['availability']),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                court['availability'],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              size: 16,
                              color: Theme.of(context).colorScheme.onSurfaceVariant,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${court['location']} • ${court['distance']} km',
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: Theme.of(context).colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 16,
                              color: Colors.amber,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${court['rating']} (${court['reviews']} reviews)',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            const Spacer(),
                            Text(
                              '\$${court['price']}/hour',
                              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              
              // Amenities
              Wrap(
                spacing: 8,
                runSpacing: 4,
                children: (court['amenities'] as List<String>).map((amenity) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      amenity,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getIconForSport(String sport) {
    switch (sport.toLowerCase()) {
      case 'tennis':
        return Icons.sports_tennis;
      case 'basketball':
        return Icons.sports_basketball;
      case 'football':
        return Icons.sports_football;
      case 'badminton':
        return Icons.sports_cricket;
      case 'volleyball':
        return Icons.sports_volleyball;
      default:
        return Icons.sports;
    }
  }

  Color _getAvailabilityColor(String availability) {
    switch (availability.toLowerCase()) {
      case 'available':
        return Colors.green;
      case 'busy':
        return Colors.orange;
      case 'full':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
} 