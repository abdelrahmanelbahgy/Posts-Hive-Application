import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/post_model.dart';
import '../services/favorites_service.dart';

/// Card used by BOTH the posts list and the favorites list,
/// so the two screens share the same design.
class PostCard extends StatelessWidget {
  final Post post;
  final FavoritesService favoritesService;

  const PostCard({
    super.key,
    required this.post,
    required this.favoritesService,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        leading: CircleAvatar(child: Text(post.id.toString())),
        title: Text(
          post.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(post.body, maxLines: 2, overflow: TextOverflow.ellipsis),
        // Rebuilds only the star whenever favoritesBox changes
        trailing: ValueListenableBuilder<Box<Post>>(
          valueListenable: Hive.box<Post>('favoritesBox').listenable(),
          builder: (context, box, _) {
            final isFav = favoritesService.isFavorite(post.id);
            return IconButton(
              icon: Icon(
                isFav ? Icons.star : Icons.star_border,
                color: isFav ? Colors.amber : null,
              ),
              onPressed: () => favoritesService.toggleFavorite(post),
            );
          },
        ),
      ),
    );
  }
}
