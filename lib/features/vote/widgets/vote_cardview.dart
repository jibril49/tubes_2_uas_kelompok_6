
import 'package:flutter/material.dart';  
import 'package:tubes_2_uas_kelompok_6/features/vote/controller/vote_controller.dart';

class VoteCardview extends StatelessWidget {
  final VoteResponsesModel vote;  // Gunakan VoteResponsesModel
  final VoidCallback onDelete; 

  const VoteCardview({super.key, required this.vote, required this.onDelete});
   
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.brown, 
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(    
              "Id Vote : ${vote.id}",
              style: TextStyle(
                color: Colors.red,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Id User : ${vote.name}",  // Pastikan ada atribut yang benar
              style: TextStyle(
                color: Colors.red,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: onDelete,  
            ),
          ],
        ),
      ),
    );
  }
}
