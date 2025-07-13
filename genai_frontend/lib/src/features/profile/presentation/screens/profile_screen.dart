import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/services/auth_service.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  // Mock stats and preferences that don't come from auth
  final Map<String, dynamic> _staticData = {
    'memberSince': 'January 2024',
    'location': 'Downtown',
    'skillLevel': 'Intermediate',
    'favoriteSports': ['Tennis', 'Basketball'],
    'stats': {
      'bookings': 15,
      'groups': 3,
      'events': 8,
      'hoursPlayed': 42,
    },
    'recentActivity': [
      'Joined Basketball Legends group',
      'Booked Central Sports Complex',
      'Registered for Tennis Championship',
      'Completed Volleyball Beach Tournament',
    ],
    'preferences': {
      'notifications': true,
      'locationSharing': true,
      'emailUpdates': false,
      'darkMode': false,
    },
  };

  @override
  Widget build(BuildContext context) {
    // Get the current user from authentication
    final authState = ref.watch(mockAuthStateProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              _showSettingsModal();
            },
          ),
        ],
      ),
      body: authState.when(
        data: (user) {
          if (user == null) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.account_circle, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text('Please sign in to view your profile'),
                ],
              ),
            );
          }
          
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Profile Header with real user data
                _buildProfileHeader(user),
                
                const SizedBox(height: 24),
                
                // Stats Cards
                _buildStatsSection(),
                
                const SizedBox(height: 24),
                
                // Quick Actions
                _buildQuickActions(),
                
                const SizedBox(height: 24),
                
                // Recent Activity
                _buildRecentActivity(),
                
                const SizedBox(height: 24),
                
                // Account Settings
                _buildAccountSettings(),
                
                const SizedBox(height: 32),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Text('Authentication error: $error'),
        ),
      ),
    );
  }

  Widget _buildProfileHeader(user) {
    // Get user name and email from authentication
    final userName = user.userMetadata?['name'] ?? user.email?.split('@')[0] ?? 'User';
    final userEmail = user.email ?? 'No email';
    
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                  child: Icon(
                    Icons.person,
                    size: 50,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.camera_alt,
                        color: Theme.of(context).colorScheme.onPrimary,
                        size: 20,
                      ),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Photo upload coming soon!')),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              userName,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              userEmail,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: 16,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 4),
                Text(
                  _staticData['location'],
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(width: 16),
                Icon(
                  Icons.sports,
                  size: 16,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 4),
                Text(
                  _staticData['skillLevel'],
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Member since ${_staticData['memberSince']}',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: () {
                _showEditProfileModal(userName, userEmail, _staticData['location']);
              },
              icon: const Icon(Icons.edit),
              label: const Text('Edit Profile'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsSection() {
    final stats = _staticData['stats'] as Map<String, dynamic>;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Your Stats',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _StatCard(
                icon: Icons.calendar_today,
                title: 'Bookings',
                value: stats['bookings'].toString(),
                color: Colors.blue,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _StatCard(
                icon: Icons.group,
                title: 'Groups',
                value: stats['groups'].toString(),
                color: Colors.green,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _StatCard(
                icon: Icons.event,
                title: 'Events',
                value: stats['events'].toString(),
                color: Colors.orange,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _StatCard(
                icon: Icons.timer,
                title: 'Hours Played',
                value: stats['hoursPlayed'].toString(),
                color: Colors.purple,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildQuickActions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Actions',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Card(
          child: Column(
            children: [
              _ActionTile(
                icon: Icons.calendar_today,
                title: 'My Bookings',
                subtitle: 'View upcoming court reservations',
                onTap: () => context.go('/my-bookings'),
              ),
              const Divider(height: 1),
              _ActionTile(
                icon: Icons.favorite,
                title: 'Favorites',
                subtitle: 'Saved courts and groups',
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Favorites screen coming soon!')),
                  );
                },
              ),
              const Divider(height: 1),
              _ActionTile(
                icon: Icons.history,
                title: 'Activity History',
                subtitle: 'View your sports activity',
                onTap: () => context.go('/activity-history'),
              ),
              const Divider(height: 1),
              _ActionTile(
                icon: Icons.payment,
                title: 'Payment Methods',
                subtitle: 'Manage payment options',
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Payment methods coming soon!')),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRecentActivity() {
    final activities = _staticData['recentActivity'] as List<String>;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recent Activity',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: activities.asMap().entries.map((entry) {
                final index = entry.key;
                final activity = entry.value;
                return Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            activity,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                        Text(
                          '${index + 1}d ago',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                    if (index < activities.length - 1) ...[
                      const SizedBox(height: 12),
                      const Divider(height: 1),
                      const SizedBox(height: 12),
                    ],
                  ],
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAccountSettings() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Account',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Card(
          child: Column(
            children: [
              _ActionTile(
                icon: Icons.help_outline,
                title: 'Help & Support',
                subtitle: 'Get help and contact support',
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Help & Support coming soon!')),
                  );
                },
              ),
              const Divider(height: 1),
              _ActionTile(
                icon: Icons.privacy_tip_outlined,
                title: 'Privacy Policy',
                subtitle: 'Review our privacy policy',
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Privacy Policy coming soon!')),
                  );
                },
              ),
              const Divider(height: 1),
              _ActionTile(
                icon: Icons.article_outlined,
                title: 'Terms of Service',
                subtitle: 'Read our terms and conditions',
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Terms of Service coming soon!')),
                  );
                },
              ),
              const Divider(height: 1),
              _ActionTile(
                icon: Icons.logout,
                title: 'Sign Out',
                subtitle: 'Sign out of your account',
                onTap: () {
                  _showSignOutDialog();
                },
                textColor: Colors.red,
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showEditProfileModal(String name, String email, String location) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => _EditProfileSheet(name: name, email: email, location: location),
    );
  }

  void _showSettingsModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => _SettingsSheet(preferences: _staticData['preferences']),
    );
  }

  void _showSignOutDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Sign Out'),
        content: const Text('Are you sure you want to sign out of your account?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.of(context).pop();
              // Clear the authentication state
              SimpleAuthState.signOut();
              ref.invalidate(mockAuthStateProvider);
              context.go('/welcome');
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Signed out successfully')),
              );
            },
            child: const Text('Sign Out'),
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final Color color;

  const _StatCard({
    required this.icon,
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: color,
                size: 24,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              value,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ActionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final Color? textColor;

  const _ActionTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: textColor ?? Theme.of(context).colorScheme.primary,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          color: textColor,
        ),
      ),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}

class _EditProfileSheet extends StatelessWidget {
  final String name;
  final String email;
  final String location;

  const _EditProfileSheet({required this.name, required this.email, required this.location});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.8,
      maxChildSize: 0.95,
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
                        'Edit Profile',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 24),
                      
                      // Form fields would go here
                      TextFormField(
                        initialValue: name,
                        decoration: const InputDecoration(
                          labelText: 'Name',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        initialValue: email,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        initialValue: location,
                        decoration: const InputDecoration(
                          labelText: 'Location',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 24),
                      
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Profile update functionality coming soon!')),
                            );
                          },
                          child: const Text('Save Changes'),
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
}

class _SettingsSheet extends StatefulWidget {
  final Map<String, dynamic> preferences;

  const _SettingsSheet({required this.preferences});

  @override
  State<_SettingsSheet> createState() => __SettingsSheetState();
}

class __SettingsSheetState extends State<_SettingsSheet> {
  late Map<String, dynamic> _preferences;

  @override
  void initState() {
    super.initState();
    _preferences = Map<String, dynamic>.from(widget.preferences);
  }

  @override
  Widget build(BuildContext context) {
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
                        'Settings',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 24),
                      
                      Card(
                        child: Column(
                          children: [
                            SwitchListTile(
                              title: const Text('Notifications'),
                              subtitle: const Text('Receive push notifications'),
                              value: _preferences['notifications'],
                              onChanged: (value) {
                                setState(() {
                                  _preferences['notifications'] = value;
                                });
                              },
                            ),
                            const Divider(height: 1),
                            SwitchListTile(
                              title: const Text('Location Sharing'),
                              subtitle: const Text('Share location for nearby recommendations'),
                              value: _preferences['locationSharing'],
                              onChanged: (value) {
                                setState(() {
                                  _preferences['locationSharing'] = value;
                                });
                              },
                            ),
                            const Divider(height: 1),
                            SwitchListTile(
                              title: const Text('Email Updates'),
                              subtitle: const Text('Receive email newsletters'),
                              value: _preferences['emailUpdates'],
                              onChanged: (value) {
                                setState(() {
                                  _preferences['emailUpdates'] = value;
                                });
                              },
                            ),
                            const Divider(height: 1),
                            SwitchListTile(
                              title: const Text('Dark Mode'),
                              subtitle: const Text('Use dark theme'),
                              value: _preferences['darkMode'],
                              onChanged: (value) {
                                setState(() {
                                  _preferences['darkMode'] = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: 24),
                      
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Settings saved!')),
                            );
                          },
                          child: const Text('Save Settings'),
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
} 