import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Customers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Customers"),
        leading:
            IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search_outlined)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.location_history)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Tags Section
              Text(
                "Tags",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: [
                  CustomTag("#TechTalk"),
                  CustomTag("#Gratitude"),
                  CustomTag("#Mindful"),
                  CustomTag("#InspireDaily"),
                  CustomTag("#ConnectionGoals"),
                ],
              ),
              SizedBox(height: 24),

              // Actions Section
              Text(
                "Actions",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _ActionButton(
                    icon: Icons.assignment_outlined,
                    label: "Assign to",
                  ),
                  _ActionButton(
                    icon: Icons.notifications_outlined,
                    label: "Reminders",
                  ),
                  _ActionButton(
                    icon: Icons.send_outlined,
                    label: "Send a message",
                  ),
                ],
              ),
              SizedBox(height: 24),

              // Customers List
              _CustomerCard(
                name: "Baby Jovanca",
                tags: ["#InspireDaily", "#Mindful"],
                additionalTags: 3,
                imagePath: 'assets/images/female_icon.jpg',
              ),
              SizedBox(height: 16),
              _CustomerCard(
                name: "Nancy Green",
                tags: ["#InspireDaily", "#Mindful"],
                additionalTags: 3,
                imagePath: 'assets/images/man_Icon_Flu.jpg',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom Tag Widget
class CustomTag extends StatelessWidget {
  final String tag;
  const CustomTag(this.tag, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        tag,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.black87,
          fontWeight: FontWeight.w500
        ),
      ),
    );
  }
}

// Action Button Widget (Outlined Button with Leading Icon)
class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const _ActionButton({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 11),
        side: BorderSide(color: Colors.grey.shade300),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 14, // Increase size slightly to enhance visibility
            color: Colors.black87, // Darker color for a bolder appearance
          ),
          const SizedBox(width: 5),
          Text(
            label,
            style: const TextStyle(
                fontSize: 10,
                color: Colors.black87,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

// Customer Card Widget
class _CustomerCard extends StatelessWidget {
  final String name;
  final List<String> tags;
  final int additionalTags;
  final String imagePath;

  const _CustomerCard({
    required this.name,
    required this.tags,
    required this.additionalTags,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start, // Align items to the top
      children: [
        // Checkbox
        Transform.scale(
          scale:
              0.8, // Adjust the scale to reduce the size (e.g., 0.8 is 80% of the original size)
          child: const Checkbox(
            value: true,
            onChanged: null,
            checkColor: Colors.white,
            fillColor:
                WidgetStatePropertyAll(Color.fromARGB(255, 51, 101, 141)),
          ),
        ),

        // Main Card Container
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Avatar
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(imagePath),
                ),
                const SizedBox(width: 16),

                // Customer Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            name,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.call,
                                  size: 13, color: Colors.grey[600]),
                              const SizedBox(width: 12),
                              Icon(Icons.message,
                                  size: 13, color: Colors.grey[600]),
                              const SizedBox(width: 12),
                              FaIcon(
                                FontAwesomeIcons.whatsapp,
                                size: 13,
                                color: Colors.grey[600],
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          ...tags.map((tag) => CustomTag(tag)),
                          CustomTag("+$additionalTags more Tags"),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
