import 'package:flutter/material.dart';
import 'package:mhrms/screens/profile.dart';
import 'screens/Stats_Screen/activePersonnel_screen.dart';
import 'screens/Stats_Screen/deployedPersonnel_screen.dart';
import 'screens/Stats_Screen/onleavepage_screen.dart';
import 'screens/Stats_Screen/newrecuriters_screen.dart';
import 'screens/Stats_Screen/weapon_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MilitaryHRDashboard(),
    );
  }
}

class MilitaryHRDashboard extends StatelessWidget {
  const MilitaryHRDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade500,
        title: const Text('M.HRMS'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AdminProfilePage()),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.green,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Icon(Icons.shield, size: 50, color: Colors.white),
                  SizedBox(height: 10),
                  Text(
                    'Military HR Portal',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text('Dashboard'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.people),
              title: const Text('Personnel'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.assignment),
              title: const Text('Deployments'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.military_tech),
              title: const Text('Training & Skills'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.bolt),
              title: const Text('Weapon Management'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const WeaponManagementPage()),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Dashboard Overview',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            // Stats Cards
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.5,
              children: [
                _buildStatsCard('Active Personnel', Icons.person, context),
                _buildStatsCard('Currently Deployed', Icons.flight_takeoff, context),
                _buildStatsCard('On Leave', Icons.event_busy, context),
                _buildStatsCard('New Recruits', Icons.person_add, context),
                _buildStatsCard('Weapon MGMT', Icons.bolt, context),
              ],
            ),

            const SizedBox(height: 24),

            // Recent Activities Section
            const Text(
              'Recent Activities',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildActivityCard(
              'Deployment Order #A-2345',
              '73 personnel deployed to Forward Base Alpha',
              '2 hours ago',
            ),
            _buildActivityCard(
              'Leave Application #L-8976',
              'Major Sharma approved 24 leave applications',
              '4 hours ago',
            ),
            _buildActivityCard(
              'Training Completed',
              '156 recruits completed Phase II training',
              '1 day ago',
            ),

            const SizedBox(height: 24),

            // Upcoming Events
            const Text(
              'Upcoming Events',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildEventCard(
              'Strategic Command Meeting',
              'March 5, 09:00 - 12:00',
              'HQ Conference Hall',
            ),
            _buildEventCard(
              'Annual Fitness Evaluation',
              'March 10, All Day',
              'Training Ground C',
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.green.shade900,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Personnel',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Deployments',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'More',
          ),
        ],
      ),
    );
  }

  Widget _buildStatsCard(String title, IconData icon, BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigate to the respective page based on the card title
        switch (title) {
          case 'Active Personnel':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ActivePersonnelPage()),
            );
            break;
          case 'Currently Deployed':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DeployedPersonnelPage()),
            );
            break;
          case 'On Leave':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OnLeavePage()),
            );
            break;
          case 'New Recruits':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NewRecruitsPage()),
            );
            break;
          case 'Weapon MGMT':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => WeaponManagementPage()),
            );
            break;
        }
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: Colors.green.shade900,
                ),
                const Spacer(),
                Icon(
                  Icons.more_vert,
                  color: Colors.green.shade900,
                  size: 16,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActivityCard(String title, String description, String time) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(
                color: Colors.grey.shade700,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              time,
              style: TextStyle(
                color: Colors.grey.shade500,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEventCard(String title, String time, String location) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.event,
                color: Colors.green,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    time,
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    location,
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 14,
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
}
