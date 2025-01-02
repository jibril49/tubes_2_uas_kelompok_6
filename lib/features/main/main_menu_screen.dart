import 'package:flutter/material.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          "Meow! Ready to explore, cat lover?",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.pets),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.account_circle),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Pawsome Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: const Text(
                "Pawsome",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildCategoryCard("Relax with", "Feline tunes for you"),
                _buildCategoryCard("Cat jazz", "Cozy cat naps"),
                _buildCategoryCard("Caturday", "Cat rock"),
              ],
            ),
            // Feline Favorites Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: const Text(
                "Feline favorites",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildCategoryCard("Your furry friends", "Purrfect companions"),
                _buildCategoryCard("Ultimate meow mix", "Cat office vibes"),
              ],
            ),
            // Popular Paw-Songs Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: const Text(
                "Popular paw-songs",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            _buildSongItem("Cat life in Cali", "Furry friend Tom"),
            _buildSongItem("Cat-tastic tunes", "Adorable Alma"),
            _buildSongItem("Together fur-ever", "Purr buddies Jonas & Jonas"),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.pets), label: "Cats"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(String title, String subtitle) {
    return Container(
      width: 100,
      height: 120,
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          Text(
            subtitle,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildSongItem(String title, String subtitle) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey[800],
        child: const Icon(Icons.music_note, color: Colors.white),
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(color: Colors.grey),
      ),
      trailing: const Icon(Icons.play_arrow, color: Colors.white),
    );
  }
}
