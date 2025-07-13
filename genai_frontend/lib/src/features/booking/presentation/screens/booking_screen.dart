import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../shared/models/court_model.dart';
import '../../../../shared/repositories/activity_repository.dart';
import '../../../../shared/repositories/booking_repository.dart';
import '../../../../shared/models/booking_model.dart';
import '../../../../core/services/auth_service.dart';

// Simple event class for the calendar
class Event {
  final String title;
  Event(this.title);
}

class BookingScreen extends ConsumerStatefulWidget {
  final String? courtId;
  
  const BookingScreen({
    super.key,
    this.courtId,
  });

  @override
  ConsumerState<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends ConsumerState<BookingScreen> {
  DateTime selectedDate = DateTime.now();
  DateTime focusedDate = DateTime.now();
  String? selectedTimeSlot;
  int duration = 1; // hours
  final TextEditingController _notesController = TextEditingController();
  bool _isLoading = false;
  bool _showCalendar = false;
  
  // Mock court data - replace with actual data
  late Map<String, dynamic> courtData;
  
  // Available time slots
  final List<String> timeSlots = [
    '08:00', '09:00', '10:00', '11:00', '12:00', '13:00', '14:00', 
    '15:00', '16:00', '17:00', '18:00', '19:00', '20:00', '21:00', '22:00'
  ];
  
  // Mock booked slots for demonstration
  final Set<String> bookedSlots = {'10:00', '14:00', '18:00'};

  @override
  void initState() {
    super.initState();
    _loadCourtData();
  }

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  void _loadCourtData() {
    // Mock court data based on courtId
    courtData = {
      'id': widget.courtId ?? '1',
      'name': 'Central Sports Complex',
      'location': 'Downtown',
      'price': 25.0,
      'sport': 'Tennis',
      'amenities': ['Parking', 'Lighting', 'Changing Rooms'],
      'image': null,
    };
  }

  double get totalPrice => (courtData['price'] as double) * duration;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Court'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildCourtInfo(),
                  const SizedBox(height: 24),
                  _buildDateSelection(),
                  const SizedBox(height: 24),
                  _buildTimeSlotSelection(),
                  const SizedBox(height: 24),
                  _buildDurationSelection(),
                  const SizedBox(height: 24),
                  _buildNotesSection(),
                  const SizedBox(height: 24),
                  _buildPriceSummary(),
                  const SizedBox(height: 32),
                ],
              ),
            ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildCourtInfo() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                _getIconForSport(courtData['sport']),
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    courtData['name'],
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
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
                        courtData['location'],
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '\$${courtData['price']}/hour',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select Date',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Card(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    _showCalendar = !_showCalendar;
                  });
                },
                borderRadius: BorderRadius.circular(12),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _formatDate(selectedDate),
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              _formatDayOfWeek(selectedDate),
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Theme.of(context).colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ),
                      AnimatedRotation(
                        turns: _showCalendar ? 0.25 : 0.0,
                        duration: const Duration(milliseconds: 200),
                        child: const Icon(Icons.chevron_right),
                      ),
                    ],
                  ),
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: _showCalendar ? null : 0,
                child: _showCalendar ? _buildCalendar() : null,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCalendar() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: TableCalendar<Event>(
        firstDay: DateTime.now(),
        lastDay: DateTime.now().add(const Duration(days: 90)),
        focusedDay: focusedDate,
        calendarFormat: CalendarFormat.month,
        availableCalendarFormats: const {
          CalendarFormat.month: 'Month',
        },
        selectedDayPredicate: (day) {
          return isSameDay(selectedDate, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          if (!isSameDay(selectedDate, selectedDay)) {
            setState(() {
              selectedDate = selectedDay;
              focusedDate = focusedDay;
              selectedTimeSlot = null; // Reset time slot when date changes
              _showCalendar = false; // Hide calendar after selection
            });
          }
        },
        onPageChanged: (focusedDay) {
          focusedDate = focusedDay;
        },
        enabledDayPredicate: (day) {
          // Disable past dates
          return !day.isBefore(DateTime.now().subtract(const Duration(days: 1)));
        },
        calendarStyle: CalendarStyle(
          outsideDaysVisible: false,
          weekendTextStyle: TextStyle(
            color: Theme.of(context).colorScheme.primary,
          ),
          holidayTextStyle: TextStyle(
            color: Theme.of(context).colorScheme.primary,
          ),
          selectedDecoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            shape: BoxShape.circle,
          ),
          selectedTextStyle: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontWeight: FontWeight.bold,
          ),
          todayDecoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.6),
            shape: BoxShape.circle,
          ),
          todayTextStyle: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontWeight: FontWeight.bold,
          ),
          disabledTextStyle: TextStyle(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.3),
          ),
          defaultTextStyle: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        headerStyle: HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          leftChevronIcon: Icon(
            Icons.chevron_left,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          rightChevronIcon: Icon(
            Icons.chevron_right,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ) ?? const TextStyle(),
        ),
        daysOfWeekStyle: DaysOfWeekStyle(
          weekdayStyle: TextStyle(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w600,
          ),
          weekendStyle: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildTimeSlotSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select Time',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 2.5,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: timeSlots.length,
                  itemBuilder: (context, index) {
                    final timeSlot = timeSlots[index];
                    final isBooked = bookedSlots.contains(timeSlot);
                    final isSelected = selectedTimeSlot == timeSlot;
                    
                    return InkWell(
                      onTap: isBooked ? null : () {
                        setState(() {
                          selectedTimeSlot = timeSlot;
                        });
                      },
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        decoration: BoxDecoration(
                          color: isSelected
                              ? Theme.of(context).colorScheme.primary
                              : isBooked
                                  ? Colors.grey.shade300
                                  : Theme.of(context).colorScheme.surfaceContainerHighest,
                          borderRadius: BorderRadius.circular(8),
                          border: isSelected
                              ? Border.all(
                                  color: Theme.of(context).colorScheme.primary,
                                  width: 2,
                                )
                              : null,
                        ),
                        child: Center(
                          child: Text(
                            timeSlot,
                            style: TextStyle(
                              color: isSelected
                                  ? Theme.of(context).colorScheme.onPrimary
                                  : isBooked
                                      ? Colors.grey.shade600
                                      : Theme.of(context).colorScheme.onSurfaceVariant,
                              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    _buildLegendItem(
                      color: Theme.of(context).colorScheme.primary,
                      label: 'Selected',
                    ),
                    const SizedBox(width: 16),
                    _buildLegendItem(
                      color: Colors.grey.shade300,
                      label: 'Booked',
                    ),
                    const SizedBox(width: 16),
                    _buildLegendItem(
                      color: Theme.of(context).colorScheme.surfaceContainerHighest,
                      label: 'Available',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLegendItem({required Color color, required String label}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }

  Widget _buildDurationSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Duration',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Icon(
                  Icons.schedule,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$duration ${duration == 1 ? 'hour' : 'hours'}',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      if (selectedTimeSlot != null)
                        Text(
                          '$selectedTimeSlot - ${_getEndTime(selectedTimeSlot!, duration)}',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                        ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: duration > 1 ? () {
                        setState(() {
                          duration--;
                        });
                      } : null,
                      icon: const Icon(Icons.remove_circle_outline),
                    ),
                    IconButton(
                      onPressed: duration < 4 ? () {
                        setState(() {
                          duration++;
                        });
                      } : null,
                      icon: const Icon(Icons.add_circle_outline),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNotesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Additional Notes (Optional)',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _notesController,
              maxLines: 3,
              decoration: const InputDecoration(
                hintText: 'Any special requests or requirements...',
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPriceSummary() {
    return Card(
      color: Theme.of(context).colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Court Fee',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  '\$${courtData['price']} × $duration hr',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Divider(),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
                Text(
                  '\$${totalPrice.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomBar() {
    final bool canBook = selectedTimeSlot != null;
    
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
            onPressed: canBook ? _handleBooking : null,
            child: Text(
              canBook 
                  ? 'Book for \$${totalPrice.toStringAsFixed(2)}'
                  : 'Select time slot to continue',
            ),
          ),
        ),
      ),
    );
  }



  Future<void> _handleBooking() async {
    if (selectedTimeSlot == null) return;

    setState(() {
      _isLoading = true;
    });

    try {
      // Using mock auth state for development - change back to authServiceProvider when Supabase is configured
      final mockAuthAsync = ref.read(mockAuthStateProvider);
      User? user;
      
      mockAuthAsync.when(
        data: (userData) => user = userData,
        loading: () => throw Exception('Loading authentication state...'),
        error: (error, stack) => throw Exception('Authentication error: $error'),
      );
      
      if (user == null) {
        throw Exception('Please sign in to make a booking');
      }

      // Create real booking in database
      final bookingRepository = ref.read(bookingRepositoryProvider);
      final endTime = _getEndTime(selectedTimeSlot!, duration);
      
      final booking = BookingModel(
        id: '', // Will be generated by Supabase
        userId: user!.id,
        courtId: courtData['id'],
        courtName: courtData['name'],
        bookingDate: selectedDate,
        startTime: selectedTimeSlot!,
        endTime: endTime,
        totalPrice: totalPrice,
        status: 'confirmed',
        paymentStatus: 'paid', // Simulate payment for demo
        notes: _notesController.text.trim().isEmpty ? null : _notesController.text.trim(),
        createdAt: DateTime.now(),
      );

      final createdBooking = await bookingRepository.createBooking(booking);

      // Create activity record for this booking
      try {
        final activityRepository = ref.read(activityRepositoryProvider);
        await activityRepository.createBookingActivity(
          user!.id,
          courtData['id'],
          courtData['name'],
          courtData['location'],
          selectedDate,
          '$selectedTimeSlot - $endTime',
          totalPrice,
        );
      } catch (e) {
        // Activity creation failed, but don't block booking success
        debugPrint('Failed to create activity: $e');
      }

      if (mounted) {
        _showBookingConfirmation(createdBooking);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Booking failed: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _showBookingConfirmation(BookingModel booking) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        icon: Icon(
          Icons.check_circle,
          color: Colors.green,
          size: 48,
        ),
        title: const Text('Booking Confirmed!'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Your court has been successfully booked.'),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  _BookingDetailRow(
                    label: 'Booking ID',
                    value: booking.id.substring(0, 8).toUpperCase(),
                  ),
                  _BookingDetailRow(
                    label: 'Court',
                    value: booking.courtName,
                  ),
                  _BookingDetailRow(
                    label: 'Date',
                    value: _formatDate(booking.bookingDate),
                  ),
                  _BookingDetailRow(
                    label: 'Time',
                    value: '${booking.startTime} - ${booking.endTime}',
                  ),
                  _BookingDetailRow(
                    label: 'Status',
                    value: booking.status.toUpperCase(),
                  ),
                  _BookingDetailRow(
                    label: 'Total',
                    value: '\$${booking.totalPrice.toStringAsFixed(2)}',
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              context.go('/profile/my-bookings');
            },
            child: const Text('View My Bookings'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              context.pop();
            },
            child: const Text('Done'),
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
      return '${date.day} ${months[date.month - 1]} ${date.year}';
    }
  }

  String _formatDayOfWeek(DateTime date) {
    const days = [
      'Monday', 'Tuesday', 'Wednesday', 'Thursday',
      'Friday', 'Saturday', 'Sunday'
    ];
    return days[date.weekday - 1];
  }

  String _getEndTime(String startTime, int duration) {
    final startHour = int.parse(startTime.split(':')[0]);
    final endHour = startHour + duration;
    return '${endHour.toString().padLeft(2, '0')}:00';
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

class _BookingDetailRow extends StatelessWidget {
  final String label;
  final String value;

  const _BookingDetailRow({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
} 