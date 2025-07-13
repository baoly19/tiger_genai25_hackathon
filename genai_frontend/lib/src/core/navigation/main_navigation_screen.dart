import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MainNavigationScreen extends StatelessWidget {
  final Widget child;

  const MainNavigationScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final currentRoute = GoRouterState.of(context).uri.path;

    // Set background color except for /home and /login routes
    final bool useDarkBackground =!(currentRoute == '/');

    return Scaffold(
      backgroundColor: useDarkBackground
          ? const Color.fromRGBO(23, 23, 23, 1)
          : null,
      body: Row(
        children: [
          const _SidebarNavigationRail(),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(child: child),
        ],
      ),
    );
  }
}

class _SidebarNavigationRail extends StatelessWidget {
  const _SidebarNavigationRail({super.key});

  @override
  Widget build(BuildContext context) {
    final currentLocation = GoRouterState.of(context).uri.path;

    int getCurrentIndex() {
      switch (currentLocation) {
        case '/home':
          return 0;
        case '/patients':
          return 1;
        case '/profile':
          return 2;
        default:
          return 0;
      }
    }

    void onTap(int index) {
      switch (index) {
        case 0:
          context.go('/home');
          break;
        case 1:
          context.go('/patients');
          break;
        case 2:
          context.go('/profile');
          break;
      }
    }

    final int selectedIndex = getCurrentIndex();
    final items = [
      _SidebarItemData(icon: Icons.home_sharp, label: 'Home', route: '/home'),
      _SidebarItemData(
        icon: Icons.analytics_sharp,
        label: 'Patients',
        route: '/patients',
      ),
      _SidebarItemData(icon: Icons.person_sharp, label: 'Profile', route: '/profile'),
    ];

    return Container(
      width: 240,
      color: const Color.fromRGBO(18, 18, 18, 1),
      child: Column(
        children: [
          // 🔹 App Logo + Name
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Row(
              children: [
                const FlutterLogo(size: 32),
                const SizedBox(width: 12),
                Text(
                  'AutoClinic.AI',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),

          const Divider(color: Colors.white24, thickness: 0.5),

          // 🔹 Navigation
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) => _SidebarButton(
                icon: items[index].icon,
                label: items[index].label,
                selected: index == selectedIndex,
                onTap: () => onTap(index),
              ),
            ),
          ),

          // 🔴 Logout Button Fixed at Bottom
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            child: GestureDetector(
              onTap: () async {
                // TODO: Handle logout logic
                await Supabase.instance.client.auth.signOut();
                context.go('/');
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 16,
                ),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFFD32F2F),
                      Color(0xFFEF5350),
                    ], // Red gradient
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.logout, color: Colors.white),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Logout',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );


  }
}

class _SidebarItemData {
  final IconData icon;
  final String label;
  final String route;

  _SidebarItemData({
    required this.icon,
    required this.label,
    required this.route,
  });
}

class _SidebarButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _SidebarButton({
    super.key,
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Material(
        color: selected ? null : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: selected
                ? BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF1976D2), Color(0xFF42A5F5)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  )
                : null,
            child: Row(
              children: [
                Icon(icon, color: selected ? Colors.white : Colors.grey[400]),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    label,
                    style: TextStyle(
                      color: selected ? Colors.white : Colors.grey[300],
                      fontWeight: selected
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
