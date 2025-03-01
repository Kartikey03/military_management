import 'package:flutter/material.dart';

class AdminProfilePage extends StatelessWidget {
  const AdminProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade900,
        title: const Text('Admin Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // Navigate to edit profile
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to settings
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header
            Container(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              color: Colors.green.withOpacity(0.05),
              child: Center(
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.green,
                      child: Icon(
                        Icons.person,
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Colonel Rajesh Kumar',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'System Administrator',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'Active',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Profile Information
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Personal Information',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildInfoRow(Icons.badge, 'ID', 'ADM-10093'),
                      const Divider(),
                      _buildInfoRow(Icons.email, 'Email', 'r.kumar@mil.gov.in'),
                      const Divider(),
                      _buildInfoRow(Icons.phone, 'Phone', '+91 9876543210'),
                      const Divider(),
                      _buildInfoRow(Icons.location_on, 'Department', 'Army HQ - IT Division'),
                      const Divider(),
                      _buildInfoRow(Icons.calendar_today, 'Joined', '12 June 2018'),
                    ],
                  ),
                ),
              ),
            ),

            // System Access
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'System Access',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildAccessRow('Personnel Management', true),
                      const Divider(),
                      _buildAccessRow('Deployment Operations', true),
                      const Divider(),
                      _buildAccessRow('Training Records', true),
                      const Divider(),
                      _buildAccessRow('Budget & Finance', false),
                      const Divider(),
                      _buildAccessRow('System Configuration', true),
                    ],
                  ),
                ),
              ),
            ),

            // Activity Log
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Recent Activity',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text('View All'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      _buildActivityLogItem(
                        'Personnel Data Modified',
                        'Updated information for 15 officers',
                        '2 hours ago',
                      ),
                      _buildActivityLogItem(
                        'System Settings Changed',
                        'Modified notification preferences',
                        'Yesterday, 14:30',
                      ),
                      _buildActivityLogItem(
                        'New User Added',
                        'Created account for Capt. S. Rathore',
                        'Yesterday, 10:15',
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Account Actions
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Change Password action
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: const Text('Change Password'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  OutlinedButton(
                    onPressed: () {
                      // Logout action
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text('Logout'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.grey.shade600,
            size: 20,
          ),
          const SizedBox(width: 16),
          SizedBox(
            width: 80,
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade700,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAccessRow(String permission, bool hasAccess) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(
            hasAccess ? Icons.check_circle : Icons.cancel,
            color: hasAccess ? Colors.green : Colors.red,
            size: 20,
          ),
          const SizedBox(width: 16),
          Text(
            permission,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          Switch(
            value: hasAccess,
            onChanged: (value) {
              // Handle permission toggle
            },
            activeColor: Colors.green,
          ),
        ],
      ),
    );
  }

  Widget _buildActivityLogItem(String title, String description, String time) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 10,
            height: 10,
            margin: const EdgeInsets.only(top: 6, right: 10),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF1E3A8A),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}