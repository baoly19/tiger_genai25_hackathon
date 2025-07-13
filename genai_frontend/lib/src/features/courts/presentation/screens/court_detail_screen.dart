import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CourtDetailScreen extends StatefulWidget {
  final String courtId;

  const CourtDetailScreen({
    super.key,
    required this.courtId,
  });

  @override
  State<CourtDetailScreen> createState() => _CourtDetailScreenState();
}

class _CourtDetailScreenState extends State<CourtDetailScreen> {
  bool _isFavorite = false;
  int _selectedImageIndex = 0;

  // Mock court data - replace with Supabase data later
  late Map<String, dynamic> _courtData;

  @override
  void initState() {
    super.initState();
    _loadCourtData();
  }

  void _loadCourtData() {
    // Mock data based on courtId
    _courtData = {
      'id': widget.courtId,
      'name': 'Central Sports Complex',
      'description': 'Premier tennis facility with professional courts and modern amenities. Located in the heart of downtown, our facility offers both indoor and outdoor courts with professional lighting and climate control.',
      'location': 'Downtown',
      'fullAddress': '123 Sports Avenue, Downtown, City 12345',
      'distance': 2.3,
      'price': 25,
      'rating': 4.8,
      'reviews': 156,
      'sport': 'Tennis',
      'amenities': [
        'Free Parking',
        'Professional Lighting',
        'Changing Rooms',
        'Pro Shop',
        'Equipment Rental',
        'Coaching Available',
        'Refreshments',
        'WiFi'
      ],
      'availability': 'Available',
      'images': [
        'https://via.placeholder.com/400x300?text=Court+1',
        'https://via.placeholder.com/400x300?text=Court+2',
        'https://via.placeholder.com/400x300?text=Amenities',
      ],
      'operatingHours': {
        'Monday': '6:00 AM - 10:00 PM',
        'Tuesday': '6:00 AM - 10:00 PM',
        'Wednesday': '6:00 AM - 10:00 PM',
        'Thursday': '6:00 AM - 10:00 PM',
        'Friday': '6:00 AM - 11:00 PM',
        'Saturday': '7:00 AM - 11:00 PM',
        'Sunday': '7:00 AM - 9:00 PM',
      },
      'contact': {
        'phone': '+1 (555) 123-4567',
        'email': 'info@centralsports.com',
        'website': 'www.centralsports.com',
      },
      'rules': [
        'No outside food or drinks allowed',
        'Proper sports attire required',
        'Maximum 4 players per court',
        'Reservations must be made 24 hours in advance',
        'Cancellations accepted up to 2 hours before booking time',
      ],
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // App Bar with Images
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            actions: [
              IconButton(
                icon: Icon(_isFavorite ? Icons.favorite : Icons.favorite_border),
                onPressed: () {
                  setState(() {
                    _isFavorite = !_isFavorite;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(_isFavorite ? 'Added to favorites' : 'Removed from favorites'),
                    ),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.share),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Share functionality coming soon!')),
                  );
                },
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  // Image Gallery
                  PageView.builder(
                    itemCount: _courtData['images'].length,
                    onPageChanged: (index) {
                      setState(() {
                        _selectedImageIndex = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                        ),
                        child: Center(
                          child: Icon(
                            _getIconForSport(_courtData['sport']),
                            size: 80,
                            color: Theme.of(context).colorScheme.onPrimaryContainer,
                          ),
                        ),
                      );
                    },
                  ),
                  
                  // Image indicator
                  if (_courtData['images'].length > 1)
                    Positioned(
                      bottom: 16,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: _courtData['images'].asMap().entries.map<Widget>((entry) {
                          return Container(
                            width: 8,
                            height: 8,
                            margin: const EdgeInsets.symmetric(horizontal: 2),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _selectedImageIndex == entry.key
                                  ? Colors.white
                                  : Colors.white.withOpacity(0.5),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  
                  // Availability Badge
                  Positioned(
                    top: 60,
                    right: 16,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: _getAvailabilityColor(_courtData['availability']),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        _courtData['availability'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and Rating
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _courtData['name'],
                              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
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
                                  '${_courtData['location']} • ${_courtData['distance']} km away',
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.star, color: Colors.amber, size: 20),
                              const SizedBox(width: 4),
                              Text(
                                _courtData['rating'].toString(),
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            '${_courtData['reviews']} reviews',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context).colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Price
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.attach_money,
                          color: Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '\$${_courtData['price']}/hour',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onPrimaryContainer,
                          ),
                        ),
                        const Spacer(),
                        ElevatedButton(
                          onPressed: () {
                            context.push('/booking?courtId=${widget.courtId}');
                          },
                          child: const Text('Book Now'),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Description
                  Text(
                    'About',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _courtData['description'],
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),

                  const SizedBox(height: 24),

                  // Amenities
                  Text(
                    'Amenities',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: (_courtData['amenities'] as List<String>).map((amenity) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surfaceContainerHighest,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              _getAmenityIcon(amenity),
                              size: 16,
                              color: Theme.of(context).colorScheme.onSurfaceVariant,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              amenity,
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: Theme.of(context).colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 24),

                  // Operating Hours
                  Text(
                    'Operating Hours',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: (_courtData['operatingHours'] as Map<String, String>)
                            .entries
                            .map((entry) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  entry.key,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                Text(
                                  entry.value,
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Contact Information
                  Text(
                    'Contact Information',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          _ContactItem(
                            icon: Icons.phone,
                            label: 'Phone',
                            value: _courtData['contact']['phone'],
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Calling functionality coming soon!')),
                              );
                            },
                          ),
                          const Divider(),
                          _ContactItem(
                            icon: Icons.email,
                            label: 'Email',
                            value: _courtData['contact']['email'],
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Email functionality coming soon!')),
                              );
                            },
                          ),
                          const Divider(),
                          _ContactItem(
                            icon: Icons.language,
                            label: 'Website',
                            value: _courtData['contact']['website'],
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Website functionality coming soon!')),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Rules
                  Text(
                    'Court Rules',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: (_courtData['rules'] as List<String>).map((rule) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '• ',
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Theme.of(context).colorScheme.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    rule,
                                    style: Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Action Buttons
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Directions functionality coming soon!')),
                            );
                          },
                          icon: const Icon(Icons.directions),
                          label: const Text('Directions'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            context.push('/booking?courtId=${widget.courtId}');
                          },
                          icon: const Icon(Icons.calendar_today),
                          label: const Text('Book Court'),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
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

  IconData _getAmenityIcon(String amenity) {
    final amenityLower = amenity.toLowerCase();
    if (amenityLower.contains('parking')) return Icons.local_parking;
    if (amenityLower.contains('lighting')) return Icons.lightbulb_outline;
    if (amenityLower.contains('changing') || amenityLower.contains('room')) return Icons.meeting_room;
    if (amenityLower.contains('shop')) return Icons.store;
    if (amenityLower.contains('equipment') || amenityLower.contains('rental')) return Icons.sports_tennis;
    if (amenityLower.contains('coaching')) return Icons.school;
    if (amenityLower.contains('refreshments') || amenityLower.contains('food')) return Icons.local_cafe;
    if (amenityLower.contains('wifi')) return Icons.wifi;
    if (amenityLower.contains('air') || amenityLower.contains('conditioning')) return Icons.ac_unit;
    return Icons.check_circle_outline;
  }
}

class _ContactItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final VoidCallback onTap;

  const _ContactItem({
    required this.icon,
    required this.label,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Icon(
              icon,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                  Text(
                    value,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ],
        ),
      ),
    );
  }
} 