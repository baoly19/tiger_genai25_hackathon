import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doctor Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Notifications coming soon!')),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome Card
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  // CircleAvatar(
                  //   radius: 30,
                  //   backgroundColor: Theme.of(
                  //     context,
                  //   ).colorScheme.primaryContainer,
                  //   child: Icon(
                  //     Icons.local_hospital,
                  //     size: 32,
                  //     color: Theme.of(context).colorScheme.onPrimaryContainer,
                  //   ),
                  // ),
                  // const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome, Doctor!',
                          style: Theme.of(context).textTheme.headlineSmall
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Here’s your overview for today.',
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSurfaceVariant,
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Quick Actions
            Text(
              'Quick Actions',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _QuickActionCard(
                    icon: Icons.person_search_sharp,
                    title: 'Patients',
                    subtitle: 'Manage your patients',
                    onTap: () => context.go('/courts'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _QuickActionCard(
                    icon: Icons.account_circle_sharp,
                    title: 'Profile',
                    subtitle: 'View & update',
                    onTap: () => context.go('/profile'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _QuickActionCard(
                    icon: Icons.medical_information_sharp,
                    title: 'Drugs',
                    subtitle: 'Explore the Drugs database',
                    onTap: () => context.go('/profile'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _QuickActionCard(
                    icon: Icons.account_circle_sharp,
                    title: 'Profile',
                    subtitle: 'View & update',
                    onTap: () => context.go('/profile'),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 32),

            // Calendar Section
            Text(
              'Next Appointments',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            _CalendarCard(
              time: '09:00 AM',
              patientName: 'John Doe',
              reason: 'Back Pain Consultation',
            ),
            const SizedBox(height: 12),
            _CalendarCard(
              time: '10:30 AM',
              patientName: 'Jane Smith',
              reason: 'Follow-up – Blood Test',
            ),
            const SizedBox(height: 12),
            _CalendarCard(
              time: '01:00 PM',
              patientName: 'David Lee',
              reason: 'Knee Injury Diagnosis',
            ),

            const SizedBox(height: 32),

            // Activity section
            Text(
              'Recent Activity',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _ActivityCard(
              icon: Icons.note_alt,
              title: 'Updated John\'s Prescription',
              subtitle: '2 hours ago',
              time: '',
            ),
            const SizedBox(height: 12),
            _ActivityCard(
              icon: Icons.group_add,
              title: 'Added New Patient – Emily Tan',
              subtitle: 'Yesterday',
              time: '',
            ),
          ],
        ),
      ),
    );
  }
}

class _QuickActionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String?
  changeText; // Optional change indicator like "+55% than last week"
  final VoidCallback onTap;

  const _QuickActionCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.changeText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // Left side content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: Theme.of(context).textTheme.bodyMedium
                          ?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                    ),
                    if (changeText != null) ...[
                      const SizedBox(height: 8),
                      Text(
                        changeText!,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: changeText!.startsWith('+')
                              ? Colors.green
                              : Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              // Right side icon
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF1976D2), // Dark blue
                      Color(0xFF42A5F5), // Light blue
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, size: 32, color: Colors.white),
                
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class _CalendarCard extends StatelessWidget {
  final String time;
  final String patientName;
  final String reason;

  const _CalendarCard({
    required this.time,
    required this.patientName,
    required this.reason,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
          child: Text(
            time.split(':')[0],
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSecondaryContainer,
            ),
          ),
        ),
        title: Text(patientName),
        subtitle: Text(reason),
        trailing: Icon(Icons.chevron_right),
        onTap: () {
          // Navigate to appointment detail
        },
      ),
    );
  }
}

class _ActivityCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String time;

  const _ActivityCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondaryContainer,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: Theme.of(context).colorScheme.onSecondaryContainer,
          ),
        ),
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    );
  }
}
