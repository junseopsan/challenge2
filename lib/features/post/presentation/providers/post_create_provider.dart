import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class PostCreateState {
  final String content;
  final XFile? image;
  final bool isLoading;

  PostCreateState({
    this.content = '',
    this.image,
    this.isLoading = false,
  });

  PostCreateState copyWith({
    String? content,
    XFile? image,
    bool? isLoading,
  }) {
    return PostCreateState(
      content: content ?? this.content,
      image: image ?? this.image,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class PostCreateNotifier extends StateNotifier<PostCreateState> {
  PostCreateNotifier() : super(PostCreateState());

  final _imagePicker = ImagePicker();

  void updateContent(String content) {
    state = state.copyWith(content: content);
  }

  Future<void> pickImage(ImageSource source) async {
    final image = await _imagePicker.pickImage(
      source: source,
      maxWidth: 1080,
      maxHeight: 1080,
      imageQuality: 85,
    );
    if (image != null) {
      state = state.copyWith(image: image);
    }
  }

  void removeImage() {
    state = state.copyWith(image: null);
  }

  Future<void> createPost() async {
    state = state.copyWith(isLoading: true);
    // 실제 API 호출 대신 딜레이
    await Future.delayed(const Duration(seconds: 1));
    state = PostCreateState(); // 상태 초기화
  }
}

final postCreateProvider =
    StateNotifierProvider<PostCreateNotifier, PostCreateState>((ref) {
  return PostCreateNotifier();
}); 