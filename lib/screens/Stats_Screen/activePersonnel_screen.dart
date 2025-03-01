import 'package:flutter/material.dart';
class ActivePersonnelPage extends StatelessWidget {
  const ActivePersonnelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade500,
        title: const Text('Active Personnel'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Active Personnel Details',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            // Add your content specific to Active Personnel here
            // This is just a placeholder
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5, // Example count
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    leading: const CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                    title: Text('Personnel #${index + 1}'),
                    subtitle: Text('Rank: Captain • Status: Active'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      // Navigate to individual personnel details
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// You would need to create similar pages for the other cards:
// DeployedPersonnelPage, OnLeavePage, NewRecruitsPage, WeaponManagementPage