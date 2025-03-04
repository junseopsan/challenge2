import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/dummy_posts.dart';
import '../../domain/post.dart';

class FeedState {
  final List<Post> posts;
  final bool isLoading;
  final bool hasMore;

  FeedState({
    required this.posts,
    this.isLoading = false,
    this.hasMore = true,
  });

  FeedState copyWith({
    List<Post>? posts,
    bool? isLoading,
    bool? hasMore,
  }) {
    return FeedState(
      posts: posts ?? this.posts,
      isLoading: isLoading ?? this.isLoading,
      hasMore: hasMore ?? this.hasMore,
    );
  }
}

class FeedNotifier extends StateNotifier<FeedState> {
  FeedNotifier() : super(FeedState(posts: [])) {
    loadInitialPosts();
  }

  Future<void> loadInitialPosts() async {
    state = state.copyWith(isLoading: true);
    // 실제 API 호출 대신 더미 데이터 사용
    await Future.delayed(const Duration(seconds: 1));
    state = FeedState(
      posts: dummyPosts,
      isLoading: false,
    );
  }

  Future<void> loadMorePosts() async {
    if (state.isLoading || !state.hasMore) return;

    state = state.copyWith(isLoading: true);
    
    // 실제 API 호출 대신 더미 데이터에 새로운 포스트 추가
    await Future.delayed(const Duration(seconds: 1));
    final newPosts = List.of(state.posts)
      ..addAll(
        dummyPosts.map((post) => Post(
              id: 'new_${post.id}',
              userId: post.userId,
              userName: post.userName,
              userImage: post.userImage,
              content: '${post.content} (추가 데이터)',
              image: post.image,
              createdAt: DateTime.now(),
              likes: post.likes,
              replies: post.replies,
            )),
      );

    state = state.copyWith(
      posts: newPosts,
      isLoading: false,
      hasMore: newPosts.length < 50, // 최대 50개 포스트로 제한
    );
  }
}

final feedProvider = StateNotifierProvider<FeedNotifier, FeedState>((ref) {
  return FeedNotifier();
}); 