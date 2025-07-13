import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/models/booking_model.dart';
import '../../../../shared/repositories/booking_repository.dart';
import '../../../../shared/repositories/activity_repository.dart';
import '../../../../core/services/auth_service.dart';

// Provider for user bookings
final userBookingsProvider = FutureProvider.family<List<BookingModel>, String>(
  (ref, userId) async {
    final repository = ref.read(bookingRepositoryProvider);
    return repository.getUserBookings(userId);
  },
);

class MyBookingsScreen extends ConsumerStatefulWidget {
  const MyBookingsScreen({super.key});

  @override
  ConsumerState<MyBookingsScreen> createState() => _MyBookingsScreenState();
}

class _MyBookingsScreenState extends ConsumerState<MyBookingsScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  List<BookingModel> _getUpcomingBookings(List<BookingModel> bookings) {
    final now = DateTime.now();
    return bookings
        .where((booking) => 
            booking.bookingDate.isAfter(now.subtract(const Duration(days: 1))) && 
            booking.status != 'cancelled' &&
            booking.status != 'completed')
        .toList()
      ..sort((a, b) => a.bookingDate.compareTo(b.bookingDate));
  }

  List<BookingModel> _getPastBookings(List<BookingModel> bookings) {
    final now = DateTime.now();
    return bookings
        .where((booking) => 
            booking.bookingDate.isBefore(now.subtract(const Duration(days: 1))) || 
            booking.status == 'cancelled' ||
            booking.status == 'completed')
        .toList()
      ..sort((a, b) => b.bookingDate.compareTo(a.bookingDate));
  }

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
    // Using mock auth state for development - change back to authStateProvider when Supabase is configured
    final authState = ref.watch(mockAuthStateProvider);
    
    return authState.when(
      data: (user) {
        if (user == null) {
          return Scaffold(
            appBar: AppBar(title: const Text('My Bookings')),
            body: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.login, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text('Please sign in to view your bookings'),
                ],
              ),
            ),
          );
        }

        final bookingsAsync = ref.watch(userBookingsProvider(user.id));
        
        return bookingsAsync.when(
          data: (bookings) {
            final upcomingBookings = _getUpcomingBookings(bookings);
            final pastBookings = _getPastBookings(bookings);
            
            return Scaffold(
              appBar: AppBar(
                title: const Text('My Bookings'),
                bottom: TabBar(
                  controller: _tabController,
                  tabs: [
                    Tab(
                      text: 'Upcoming',
                      icon: Badge(
                        label: Text('${upcomingBookings.length}'),
                        child: const Icon(Icons.schedule),
                      ),
                    ),
                    Tab(
                      text: 'History',
                      icon: Badge(
                        label: Text('${pastBookings.length}'),
                        child: const Icon(Icons.history),
                      ),
                    ),
                  ],
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.refresh),
                    onPressed: () => ref.invalidate(userBookingsProvider(user.id)),
                  ),
                ],
              ),
              body: TabBarView(
                controller: _tabController,
                children: [
                  _buildUpcomingBookings(upcomingBookings),
                  _buildBookingHistory(pastBookings),
                ],
              ),
            );
          },
          loading: () => Scaffold(
            appBar: AppBar(title: const Text('My Bookings')),
            body: const Center(child: CircularProgressIndicator()),
          ),
          error: (error, stack) => Scaffold(
            appBar: AppBar(title: const Text('My Bookings')),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error, size: 64, color: Colors.red),
                  const SizedBox(height: 16),
                  Text('Error: $error'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => ref.invalidate(userBookingsProvider(user.id)),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      loading: () => Scaffold(
        appBar: AppBar(title: const Text('My Bookings')),
        body: const Center(child: CircularProgressIndicator()),
      ),
      error: (error, stack) => Scaffold(
        appBar: AppBar(title: const Text('My Bookings')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error, size: 64, color: Colors.red),
              const SizedBox(height: 16),
              Text('Error: $error'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => ref.invalidate(mockAuthStateProvider),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUpcomingBookings(List<BookingModel> upcomingBookings) {
    if (upcomingBookings.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.event_available,
              size: 80,
              color: Colors.grey,
            ),
            SizedBox(height: 16),
            Text(
              'No Upcoming Bookings',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Book a court to see it here',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        final user = ref.read(authServiceProvider).currentUser;
        if (user != null) {
          ref.invalidate(userBookingsProvider(user.id));
        }
      },
      child: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: upcomingBookings.length,
        itemBuilder: (context, index) {
          final booking = upcomingBookings[index];
          return _BookingCard(
            booking: booking,
            onTap: () => _showBookingDetails(booking),
            onCancel: () => _showCancelDialog(booking),
          );
        },
      ),
    );
  }

  Widget _buildBookingHistory(List<BookingModel> pastBookings) {
    if (pastBookings.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.history,
              size: 80,
              color: Colors.grey,
            ),
            SizedBox(height: 16),
            Text(
              'No Booking History',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Your completed bookings will appear here',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        final user = ref.read(authServiceProvider).currentUser;
        if (user != null) {
          ref.invalidate(userBookingsProvider(user.id));
        }
      },
      child: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: pastBookings.length,
        itemBuilder: (context, index) {
          final booking = pastBookings[index];
          return _BookingCard(
            booking: booking,
            onTap: () => _showBookingDetails(booking),
            isPast: true,
          );
        },
      ),
    );
  }

  void _showBookingDetails(BookingModel booking) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => _BookingDetailsSheet(booking: booking),
    );
  }

  void _showCancelDialog(BookingModel booking) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Cancel Booking'),
        content: const Text(
          'Are you sure you want to cancel this booking? This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Keep Booking'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              _cancelBooking(booking);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: const Text('Cancel Booking'),
          ),
        ],
      ),
    );
  }

  Future<void> _cancelBooking(BookingModel booking) async {
    try {
      final bookingRepository = ref.read(bookingRepositoryProvider);
      final activityRepository = ref.read(activityRepositoryProvider);
      final user = ref.read(authServiceProvider).currentUser;
      
      if (user == null) return;

      // Cancel booking in database
      await bookingRepository.cancelBooking(booking.id, 'Cancelled by user');

      // Create cancellation activity
      await activityRepository.createBookingCancellationActivity(
        user.id,
        booking.courtId,
        booking.courtName,
        booking.bookingDate,
        '${booking.startTime} - ${booking.endTime}',
      );

      // Refresh bookings list
      ref.invalidate(userBookingsProvider(user.id));
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Booking for ${booking.courtName} has been cancelled'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to cancel booking: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}

class _BookingCard extends StatelessWidget {
  final BookingModel booking;
  final VoidCallback onTap;
  final VoidCallback? onCancel;
  final bool isPast;

  const _BookingCard({
    required this.booking,
    required this.onTap,
    this.onCancel,
    this.isPast = false,
  });

  @override
  Widget build(BuildContext context) {
    final date = booking.bookingDate;
    final status = booking.status;
    
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.sports_tennis, // Default sport icon since we don't have sport in BookingModel
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          booking.courtName,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(
                              Icons.event,
                              size: 14,
                              color: Theme.of(context).colorScheme.onSurfaceVariant,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Court #${booking.courtId.substring(0, 8)}',
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: Theme.of(context).colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  _buildStatusBadge(status, context),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    size: 16,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    _formatDate(date),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(width: 16),
                  Icon(
                    Icons.schedule,
                    size: 16,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '${booking.startTime} - ${booking.endTime}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const Spacer(),
                  Text(
                    '\$${booking.totalPrice.toStringAsFixed(0)}',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
              if (!isPast && status == 'confirmed' && onCancel != null) ...[
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: onCancel,
                        icon: const Icon(Icons.cancel_outlined),
                        label: const Text('Cancel'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.red,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // Navigate to court detail for rebooking
                        },
                        icon: const Icon(Icons.directions),
                        label: const Text('Directions'),
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusBadge(String status, BuildContext context) {
    Color color;
    IconData icon;
    
    switch (status) {
      case 'confirmed':
        color = Colors.green;
        icon = Icons.check_circle;
        break;
      case 'pending':
        color = Colors.orange;
        icon = Icons.schedule;
        break;
      case 'cancelled':
        color = Colors.red;
        icon = Icons.cancel;
        break;
      case 'completed':
        color = Colors.blue;
        icon = Icons.done_all;
        break;
      default:
        color = Colors.grey;
        icon = Icons.info;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 12,
            color: Colors.white,
          ),
          const SizedBox(width: 4),
          Text(
            status.toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final tomorrow = today.add(const Duration(days: 1));
    final selectedDay = DateTime(date.year, date.month, date.day);

    if (selectedDay == today) {
      return 'Today';
    } else if (selectedDay == tomorrow) {
      return 'Tomorrow';
    } else {
      const months = [
        'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
        'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
      ];
      return '${date.day} ${months[date.month - 1]}';
    }
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
}

class _BookingDetailsSheet extends StatelessWidget {
  final BookingModel booking;

  const _BookingDetailsSheet({required this.booking});

  @override
  Widget build(BuildContext context) {
    final date = booking.bookingDate;
    
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      maxChildSize: 0.9,
      minChildSize: 0.5,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Booking Details',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 24),
                      
                      _DetailRow(
                        icon: Icons.sports_tennis,
                        label: 'Court',
                        value: booking.courtName,
                      ),
                      _DetailRow(
                        icon: Icons.event,
                        label: 'Booking ID',
                        value: booking.id.substring(0, 8).toUpperCase(),
                      ),
                      _DetailRow(
                        icon: Icons.calendar_today,
                        label: 'Date',
                        value: _formatDate(date),
                      ),
                      _DetailRow(
                        icon: Icons.schedule,
                        label: 'Time',
                        value: '${booking.startTime} - ${booking.endTime}',
                      ),
                      _DetailRow(
                        icon: Icons.attach_money,
                        label: 'Total Price',
                        value: '\$${booking.totalPrice.toStringAsFixed(2)}',
                      ),
                      _DetailRow(
                        icon: Icons.info,
                        label: 'Status',
                        value: booking.status.toUpperCase(),
                      ),
                      if (booking.paymentStatus != null)
                        _DetailRow(
                          icon: Icons.payment,
                          label: 'Payment',
                          value: booking.paymentStatus!.toUpperCase(),
                        ),
                      if (booking.notes?.isNotEmpty == true)
                        _DetailRow(
                          icon: Icons.note,
                          label: 'Notes',
                          value: booking.notes!,
                        ),
                      
                      const SizedBox(height: 24),
                      
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.of(context).pop();
                            context.push('/court/${booking.courtId}');
                          },
                          icon: const Icon(Icons.visibility),
                          label: const Text('View Court Details'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  String _formatDate(DateTime date) {
    const months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    const days = [
      'Monday', 'Tuesday', 'Wednesday', 'Thursday',
      'Friday', 'Saturday', 'Sunday'
    ];
    return '${days[date.weekday - 1]}, ${date.day} ${months[date.month - 1]} ${date.year}';
  }
}

class _DetailRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _DetailRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(
            icon,
            size: 20,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          const SizedBox(width: 16),
          SizedBox(
            width: 80,
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              value,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
} 