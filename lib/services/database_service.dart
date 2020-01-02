import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:insta_clone/models/post_model.dart';
import 'package:insta_clone/models/user_model.dart';
import 'package:insta_clone/utilities/constants.dart';

class DatabaseService {
 
    static void updateUser(User user){
    userRef.document(user.id).updateData({
      'name': user.name,
      'profileImageUrl': user.profileImageUrl,
      'bio': user.bio,
    });
  }
  static Future<QuerySnapshot> searchUsers(String name) {
    Future<QuerySnapshot> users =
        userRef.where('name', isGreaterThanOrEqualTo: name).getDocuments();
    return users;
  }
  static void createPost(Post post){
    postsRef.document(post.authorId).collection('usersPosts').add({
    'imageUrl': post.imageUrl,
    'caption': post.caption,
    'likes': post.likes,
    'authorId': post.authorId,
    'timestamps': post.timestamp,
    });
  }
    static void followUser({String currentUserId, String userId}) {
      followingRef
        .document(currentUserId)
        .collection('userFollowing')
        .document(userId)
        .setData({});

        followersRef
        .document(userId)
        .collection('userFollowers')
        .document(currentUserId)
        .setData({});

    }
    static void unfollowUser({String currentUserId, String userId}) {
      followingRef
        .document(currentUserId)
        .collection('userFollowing')
        .document(userId)
        .get().then((doc){
          if (doc.exists) {
            doc.reference.delete();
          }
        });

        followersRef
        .document(userId)
        .collection('userFollowers')
        .document(currentUserId)
        .get().then((doc){
          if (doc.exists) {
            doc.reference.delete();
          }
        });

    }

    static Future<bool> isFollowingUser(
      {String currentUserId, String userId}) async {
    DocumentSnapshot followingDoc = await followersRef
        .document(userId)
        .collection('userFollowers')
        .document(currentUserId)
        .get();
    return followingDoc.exists;
  }

  static Future<int> numFollowing(String userId) async {
    QuerySnapshot followingSnapshot = await followingRef
        .document(userId)
        .collection('userFollowing')
        .getDocuments();
    return followingSnapshot.documents.length;
  }

  static Future<int> numFollowers(String userId) async {
    QuerySnapshot followersSnapshot = await followersRef
        .document(userId)
        .collection('userFollowers')
        .getDocuments();
    return followersSnapshot.documents.length;
  }

  static Future<List<Post>> getFeedPosts(String userId) async {
    QuerySnapshot feedSnapshot = 
    await feedsRef
    .document(userId)
    .collection('userFeed')
    .orderBy('timestamp', descending: true)
    .getDocuments();
    List<Post> posts = feedSnapshot.documents.map((doc) => Post.fromDoc(doc)).toList();
    return posts;
        
}
static Future<User> getUserWithId(String userId) async {
  DocumentSnapshot userDocSnapshot = await userRef.document(userId).get();
  if (userDocSnapshot.exists) {
    return User.fromDoc(userDocSnapshot);
  }
  return User();
}
}
