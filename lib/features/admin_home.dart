import 'package:flutter/material.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Row(
          children: [
            CircleAvatar(
              radius: 16,
              backgroundColor: Colors.teal,
              child: Text('A', style: TextStyle(color: Colors.white)),
            ),
            SizedBox(width: 8),
            Text('Admin'),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none_rounded),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),

      // 🌿 Main Content
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SECTION 1: DASHBOARD GRID CARDS
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                DashboardCard(
                  icon: Icons.people_outline,
                  label: 'Users',
                  value: '6',
                  color: Color(0xFF146356),
                ),
                DashboardCard(
                  icon: Icons.pending_actions_outlined,
                  label: 'Pending Actions',
                  value: '2',
                  color: Color(0xFFF7C35F),
                ),
                DashboardCard(
                  icon: Icons.inventory_2_outlined,
                  label: 'Products',
                  value: '3',
                  color: Color(0xFF6DBF73),
                ),
                DashboardCard(
                  icon: Icons.receipt_long_outlined,
                  label: 'Total Bills',
                  value: '13',
                  color: Color(0xFFB7E4C7),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // SECTION 2: PENDING APPROVALS
            SectionHeader(
              title: 'Pending Approvals',
              actionText: 'View All',
              onActionTap: () {},
            ),
            const SizedBox(height: 8),
            const PendingUserTile(name: 'Arjun P.', phone: '99282438'),
            const PendingUserTile(name: 'Mishal K.', phone: '70523949'),

            const SizedBox(height: 24),

            // SECTION 3: RECENT ITEMS
            SectionHeader(
              title: 'Recent Items',
              actionText: 'Add Product',
              onActionTap: () {},
            ),
            const SizedBox(height: 8),
            const ItemTile(
              name: 'Herbal Black',
              price: '₹120',
              status: 'In Stock',
            ),
            const ItemTile(
              name: 'Classic Tea Powder',
              price: '₹150',
              status: 'Out of Stock',
            ),
          ],
        ),
      ),

      // 🌿 Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF146356),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_outline),
            label: 'Users',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory_2_outlined),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const DashboardCard({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 28),
          const Spacer(),
          Text(
            value,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(label, style: TextStyle(color: Colors.black87.withOpacity(0.7))),
        ],
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  final String actionText;
  final VoidCallback onActionTap;

  const SectionHeader({
    super.key,
    required this.title,
    required this.actionText,
    required this.onActionTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        GestureDetector(
          onTap: onActionTap,
          child: Text(
            actionText,
            style: const TextStyle(
              color: Color(0xFF146356),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

class PendingUserTile extends StatelessWidget {
  final String name;
  final String phone;

  const PendingUserTile({super.key, required this.name, required this.phone});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: const Color(0xFFE6F4EA),
          child: Text(
            name[0],
            style: const TextStyle(color: Color(0xFF146356)),
          ),
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.w500)),
        subtitle: Text(phone),
        trailing: Wrap(
          spacing: 8,
          children: [
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.redAccent),
                foregroundColor: Colors.redAccent,
              ),
              child: const Text('Reject'),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF146356),
                foregroundColor: Colors.white,
              ),
              child: const Text('Approve'),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemTile extends StatelessWidget {
  final String name;
  final String price;
  final String status;

  const ItemTile({
    super.key,
    required this.name,
    required this.price,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final bool inStock = status.toLowerCase().contains('in');

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(
          Icons.local_cafe_rounded,
          color: inStock ? const Color(0xFF146356) : Colors.grey,
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.w500)),
        subtitle: Text(price),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: inStock ? Colors.green.shade100 : Colors.red.shade100,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            status,
            style: TextStyle(
              color: inStock ? Colors.green.shade800 : Colors.red.shade800,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
