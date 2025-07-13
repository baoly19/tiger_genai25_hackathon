import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../shared/models/activity_model.dart';
import '../../../../shared/repositories/activity_repository.dart';
import '../../../../core/services/auth_service.dart';

// Provider for user activities
final userActivitiesProvider = FutureProvider.family<List<ActivityModel>, String>(
  (ref, userId) async {
    final repository = ref.read(activityRepositoryProvider);
    return repository.getUserActivities(userId);
  },
);

// Provider for activity summary
final activitySummaryProvider = FutureProvider.family<ActivitySummary, String>(
  (ref, userId) async {
    final repository = ref.read(activityRepositoryProvider);
    return repository.getSummary(userId);
  },
);

class ActivityHistoryScreen extends ConsumerStatefulWidget {
  const ActivityHistoryScreen({super.key});

  @override
  ConsumerState<ActivityHistoryScreen> createState() => _ActivityHistoryScreenState();
}

class _ActivityHistoryScreenState extends ConsumerState<ActivityHistoryScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  String _selectedFilter = 'all';
  DateTimeRange? _dateRange;
  
  final List<String> _activityTypes = [
    'all',
    'booking',
    'group_join',
    'event_registration',
    'court_review',
    'achievement',
  ];

  final Map<String, String> _activityTypeLabels = {
    'all': 'All Activities',
    'booking': 'Bookings',
    'group_join': 'Groups',
    'event_registration': 'Events',
    'court_review': 'Reviews',
    'achievement': 'Achievements',
  };

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity History'),
        backgroundColor: Theme.of(context).colorScheme.surface,
        foregroundColor: Theme.of(context).colorScheme.onSurface,
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Timeline'),
            Tab(text: 'Summary'),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: _showFilterDialog,
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildTimelineTab(),
          _buildSummaryTab(),
        ],
      ),
    );
  }

  Widget _buildTimelineTab() {
    return Column(
      children: [
        // Filter chips
        Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _activityTypes.length,
            itemBuilder: (context, index) {
              final type = _activityTypes[index];
              final isSelected = _selectedFilter == type;
              
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: FilterChip(
                  label: Text(_activityTypeLabels[type]!),
                  selected: isSelected,
                  onSelected: (selected) {
                    setState(() {
                      _selectedFilter = type;
                    });
                  },
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  selectedColor: Theme.of(context).colorScheme.primaryContainer,
                ),
              );
            },
          ),
        ),
        
        // Date range filter
        if (_dateRange != null)
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.date_range,
                  size: 20,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 8),
                Text(
                  '${DateFormat('MMM d').format(_dateRange!.start)} - ${DateFormat('MMM d').format(_dateRange!.end)}',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.close, size: 20),
                  onPressed: () {
                    setState(() {
                      _dateRange = null;
                    });
                  },
                ),
              ],
            ),
          ),
        
        // Activities list
        Expanded(
          child: _buildActivitiesList(),
        ),
      ],
    );
  }

  Widget _buildActivitiesList() {
    // Using mock auth state for development - change back to authStateProvider when Supabase is configured
    final authState = ref.watch(mockAuthStateProvider);
    
    return authState.when(
      data: (user) {
        if (user == null) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.account_circle, size: 64, color: Colors.grey),
                SizedBox(height: 16),
                Text('Please sign in to view your activity history'),
              ],
            ),
          );
        }
        
        return ref.watch(userActivitiesProvider(user.id)).when(
          data: (activities) => _buildActivityList(activities),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(
            child: Text('Error loading activities: $error'),
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(
        child: Text('Authentication error: $error'),
      ),
    );
  }

  Widget _buildActivityList(List<ActivityModel> activities) {
    // Filter activities
    final filteredActivities = activities.where((activity) {
      if (_selectedFilter != 'all' && activity.type != _selectedFilter) {
        return false;
      }
      
      if (_dateRange != null) {
        final actionDate = activity.actionDate;
        if (actionDate == null) return false;
        
        return actionDate.isAfter(_dateRange!.start.subtract(const Duration(days: 1))) &&
               actionDate.isBefore(_dateRange!.end.add(const Duration(days: 1)));
      }
      
      return true;
    }).toList();

    if (filteredActivities.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.history,
              size: 64,
              color: Theme.of(context).colorScheme.outline,
            ),
            const SizedBox(height: 16),
            Text(
              'No activities found',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Theme.of(context).colorScheme.outline,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              _selectedFilter == 'all'
                  ? 'Start using the app to see your activity history'
                  : 'No ${_activityTypeLabels[_selectedFilter]?.toLowerCase()} activities found',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.outline,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        ref.invalidate(userActivitiesProvider);
      },
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: filteredActivities.length,
        itemBuilder: (context, index) {
          final activity = filteredActivities[index];
          return _buildActivityCard(activity);
        },
      ),
    );
  }

  Widget _buildActivityCard(ActivityModel activity) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _getActivityIcon(activity.type),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        activity.title,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        activity.description,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                if (activity.priority == 'high')
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.error,
                      shape: BoxShape.circle,
                    ),
                  ),
              ],
            ),
            
            if (activity.location != null || activity.actionDate != null) ...[
              const SizedBox(height: 12),
              Row(
                children: [
                  if (activity.location != null) ...[
                    Icon(
                      Icons.location_on,
                      size: 16,
                      color: Theme.of(context).colorScheme.outline,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      activity.location!,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                    ),
                    if (activity.actionDate != null) const SizedBox(width: 16),
                  ],
                  if (activity.actionDate != null) ...[
                    Icon(
                      Icons.schedule,
                      size: 16,
                      color: Theme.of(context).colorScheme.outline,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      _formatActivityDate(activity.actionDate!),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                    ),
                  ],
                ],
              ),
            ],
            
            // Metadata display
            if (activity.metadata != null && activity.metadata!.isNotEmpty) ...[
              const SizedBox(height: 12),
              _buildMetadataChips(activity),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildMetadataChips(ActivityModel activity) {
    final metadata = activity.metadata!;
    final chips = <Widget>[];
    
    switch (activity.type) {
      case 'booking':
        if (metadata['time_slot'] != null) {
          chips.add(_buildChip('Time: ${metadata['time_slot']}', Icons.access_time));
        }
        if (metadata['price'] != null) {
          chips.add(_buildChip('\$${metadata['price']}', Icons.attach_money));
        }
        break;
      case 'court_review':
        if (metadata['rating'] != null) {
          chips.add(_buildChip('${metadata['rating']} ⭐', Icons.star));
        }
        break;
      case 'group_join':
        if (metadata['sport'] != null) {
          chips.add(_buildChip(metadata['sport'], Icons.sports));
        }
        break;
    }
    
    if (chips.isEmpty) return const SizedBox.shrink();
    
    return Wrap(
      spacing: 8,
      runSpacing: 4,
      children: chips,
    );
  }

  Widget _buildChip(String label, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 14,
            color: Theme.of(context).colorScheme.onSecondaryContainer,
          ),
          const SizedBox(width: 4),
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.onSecondaryContainer,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryTab() {
    // Using mock auth state for development - change back to authStateProvider when Supabase is configured
    final authState = ref.watch(mockAuthStateProvider);
    
    return authState.when(
      data: (user) {
        if (user == null) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.login,
                  size: 64,
                  color: Theme.of(context).colorScheme.outline,
                ),
                const SizedBox(height: 16),
                Text(
                  'Please sign in',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Sign in to view your activity summary',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        }

        final summaryAsync = ref.watch(activitySummaryProvider(user.id));
        
        return summaryAsync.when(
          data: (summary) => RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(activitySummaryProvider(user.id));
            },
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Overview cards
                  Row(
                    children: [
                      Expanded(
                        child: _buildSummaryCard(
                          'Total Activities',
                          summary.totalActivities.toString(),
                          Icons.analytics,
                          Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildSummaryCard(
                          'This Week',
                          summary.thisWeekActivities.toString(),
                          Icons.today,
                          Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 16),
                  
                  Row(
                    children: [
                      Expanded(
                        child: _buildSummaryCard(
                          'This Month',
                          summary.thisMonthActivities.toString(),
                          Icons.calendar_month,
                          Theme.of(context).colorScheme.tertiary,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildSummaryCard(
                          'Bookings',
                          summary.bookingsCount.toString(),
                          Icons.event_note,
                          Colors.green,
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Activity breakdown
                  Text(
                    'Activity Breakdown',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  
                  const SizedBox(height: 16),
                  
                  _buildActivityBreakdown(summary),
                  
                  const SizedBox(height: 24),
                  
                  // Recent locations
                  if (summary.recentLocations.isNotEmpty) ...[
                    Text(
                      'Recent Locations',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildRecentLocations(summary.recentLocations),
                  ],
                  
                  // If no activity yet, show helpful message
                  if (summary.totalActivities == 0) ...[
                    const SizedBox(height: 24),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          children: [
                            Icon(
                              Icons.emoji_events,
                              size: 48,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Start Your Sports Journey!',
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Book courts, join groups, attend events, and track your sports activities to see your progress here.',
                              style: Theme.of(context).textTheme.bodyMedium,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error_outline,
                  size: 64,
                  color: Theme.of(context).colorScheme.error,
                ),
                const SizedBox(height: 16),
                Text(
                  'Error loading summary',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  error.toString(),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    ref.invalidate(activitySummaryProvider(user.id));
                  },
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(
        child: Text('Authentication error: $error'),
      ),
    );
  }

  Widget _buildSummaryCard(String title, String value, IconData icon, Color color) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(
              icon,
              size: 32,
              color: color,
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActivityBreakdown(ActivitySummary summary) {
    final activities = [
      ('Bookings', summary.bookingsCount, Icons.event_note, Colors.blue),
      ('Groups Joined', summary.groupsJoined, Icons.group, Colors.green),
      ('Events Attended', summary.eventsAttended, Icons.event, Colors.orange),
      ('Courts Reviewed', summary.courtsReviewed, Icons.star, Colors.purple),
    ];
    
    return Column(
      children: activities.map((activity) {
        final (title, count, icon, color) = activity;
        return Card(
          margin: const EdgeInsets.only(bottom: 8),
          child: ListTile(
            leading: Icon(icon, color: color),
            title: Text(title),
            trailing: Text(
              count.toString(),
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildRecentLocations(List<String> locations) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...locations.take(5).map((location) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  Icon(
                    Icons.location_on,
                    size: 18,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: 8),
                  Text(location),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }

  Widget _getActivityIcon(String type) {
    IconData icon;
    Color color;
    
    switch (type) {
      case 'booking':
        icon = Icons.event_note;
        color = Colors.blue;
        break;
      case 'group_join':
        icon = Icons.group_add;
        color = Colors.green;
        break;
      case 'event_registration':
        icon = Icons.event;
        color = Colors.orange;
        break;
      case 'court_review':
        icon = Icons.star;
        color = Colors.purple;
        break;
      case 'achievement':
        icon = Icons.military_tech;
        color = Colors.amber;
        break;
      default:
        icon = Icons.circle;
        color = Theme.of(context).colorScheme.outline;
    }
    
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        size: 24,
        color: color,
      ),
    );
  }

  String _formatActivityDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);
    
    if (difference.inDays == 0) {
      return 'Today ${DateFormat('HH:mm').format(date)}';
    } else if (difference.inDays == 1) {
      return 'Yesterday ${DateFormat('HH:mm').format(date)}';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else {
      return DateFormat('MMM d, y').format(date);
    }
  }

  void _showFilterDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Filter Activities'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.date_range),
              title: const Text('Date Range'),
              subtitle: _dateRange != null
                  ? Text('${DateFormat('MMM d').format(_dateRange!.start)} - ${DateFormat('MMM d').format(_dateRange!.end)}')
                  : const Text('All dates'),
              onTap: () async {
                final picked = await showDateRangePicker(
                  context: context,
                  firstDate: DateTime.now().subtract(const Duration(days: 365)),
                  lastDate: DateTime.now(),
                  initialDateRange: _dateRange,
                );
                
                if (picked != null) {
                  setState(() {
                    _dateRange = picked;
                  });
                }
              },
            ),
            
            if (_dateRange != null)
              ListTile(
                leading: const Icon(Icons.clear),
                title: const Text('Clear Date Filter'),
                onTap: () {
                  setState(() {
                    _dateRange = null;
                  });
                  Navigator.pop(context);
                },
              ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  Future<void> _createSampleActivities(String userId) async {
    try {
      final repository = ref.read(activityRepositoryProvider);
      final now = DateTime.now();

      // Show loading indicator
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const AlertDialog(
          content: Row(
            children: [
              CircularProgressIndicator(),
              SizedBox(width: 16),
              Text('Creating sample activities...'),
            ],
          ),
        ),
      );

      // Create sample activities
      await Future.wait([
        repository.createBookingActivity(
          userId,
          'court1',
          'Downtown Tennis Court',
          'Downtown Sports Complex',
          now.subtract(const Duration(hours: 2)),
          '10:00-11:00 AM',
          25.0,
        ),
        repository.createGroupJoinActivity(
          userId,
          'group1',
          'Weekend Warriors',
          'Tennis',
        ),
        repository.createEventRegistrationActivity(
          userId,
          'event1',
          'Spring Tennis Tournament',
          'City Sports Center',
          now.add(const Duration(days: 7)),
        ),
        repository.createCourtReviewActivity(
          userId,
          'court2',
          'Westside Basketball Court',
          'Westside Recreation Center',
          4.5,
        ),
        repository.createAchievementActivity(
          userId,
          'first_booking',
          'First Booking',
          'Congratulations on your first court booking!',
        ),
      ]);

      if (mounted) {
        Navigator.pop(context); // Close loading dialog

        // Refresh the data
        ref.invalidate(userActivitiesProvider(userId));
        ref.invalidate(activitySummaryProvider(userId));

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Sample activities created successfully!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        Navigator.pop(context); // Close loading dialog
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to create sample activities: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

} 