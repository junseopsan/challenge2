import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import '../providers/post_create_provider.dart';

class PostCreateScreen extends ConsumerWidget {
  const PostCreateScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postState = ref.watch(postCreateProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('새 게시물'),
        actions: [
          TextButton(
            onPressed: postState.content.isEmpty
                ? null
                : () {
                    // 포스트 생성 로직
                    ref.read(postCreateProvider.notifier).createPost();
                    Navigator.pop(context);
                  },
            child: const Text('공유'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              maxLines: 5,
              decoration: const InputDecoration(
                hintText: '무슨 일이 일어나고 있나요?',
                border: InputBorder.none,
              ),
              onChanged: (value) {
                ref.read(postCreateProvider.notifier).updateContent(value);
              },
            ),
            if (postState.image != null)
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.file(
                      File(postState.image!.path),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        ref.read(postCreateProvider.notifier).removeImage();
                      },
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.photo_library),
              onPressed: () {
                ref.read(postCreateProvider.notifier).pickImage(ImageSource.gallery);
              },
            ),
            IconButton(
              icon: const Icon(Icons.camera_alt),
              onPressed: () {
                ref.read(postCreateProvider.notifier).pickImage(ImageSource.camera);
              },
            ),
          ],
        ),
      ),
    );
  }
} 