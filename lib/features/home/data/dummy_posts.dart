import '../domain/post.dart';

final dummyPosts = [
  Post(
    id: '1',
    userId: 'user1',
    userName: '김철수',
    userImage: 'https://i.pravatar.cc/150?img=1',
    content: '오늘은 날씨가 정말 좋네요! 다들 좋은 하루 보내세요 ☀️',
    createdAt: DateTime.now().subtract(const Duration(hours: 2)),
    likes: 42,
    replies: 5,
  ),
  Post(
    id: '2',
    userId: 'user2',
    userName: '이영희',
    userImage: 'https://i.pravatar.cc/150?img=2',
    content: '새로운 프로젝트를 시작했어요! 열심히 해보겠습니다 💪',
    image: 'https://picsum.photos/400/300',
    createdAt: DateTime.now().subtract(const Duration(hours: 5)),
    likes: 128,
    replies: 12,
  ),
  // 더 많은 더미 데이터...
]; 