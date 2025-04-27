import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:http_parser/http_parser.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import '../../../../core/theme/colors_manager.dart';

class MessageInputField extends StatefulWidget {
  final ValueChanged<String> onSend;
  final void Function(List<MultipartFile> images, List<String> localPaths)
      onSendImage;
  final void Function(MultipartFile audio, String localPath) onSendAudio;
  final AudioRecorder recorder;

  const MessageInputField({
    super.key,
    required this.onSend,
    required this.onSendImage,
    required this.onSendAudio,
    required this.recorder,
  });

  @override
  State<MessageInputField> createState() => _MessageInputFieldState();
}

class _MessageInputFieldState extends State<MessageInputField> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _showEmojiPicker = false;
  late final AudioPlayer _audioPlayer;

  XFile? _pickedImage;
  String? _audioPath;
  bool _isRecording = false;
  Timer? _timer;
  int _recordDuration = 0;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus && _showEmojiPicker) {
        setState(() => _showEmojiPicker = false);
      }
    });
    _audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    _audioPlayer.dispose();
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final images = await ImagePicker().pickMultiImage();
    if (images.isNotEmpty) {
      final image = images.first;
      final extension = image.path.split('.').last.toLowerCase();
      if (!['jpg', 'jpeg', 'png', 'gif'].contains(extension)) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Only JPG, JPEG, PNG, and GIF images are allowed')),
        );
        return;
      }
      setState(() => _pickedImage = image);
    }
  }

  Future<void> _startRecording() async {
    if (await widget.recorder.hasPermission()) {
      final tempDir = await getTemporaryDirectory();
      _audioPath =
          '${tempDir.path}/record_${DateTime.now().millisecondsSinceEpoch}.m4a';
      setState(() {
        _isRecording = true;
        _recordDuration = 0;
      });
      await widget.recorder.start(const RecordConfig(), path: _audioPath!);
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() => _recordDuration++);
      });
    }
  }

  Future<void> _stopRecording() async {
    final path = await widget.recorder.stop();
    _timer?.cancel();
    setState(() {
      _isRecording = false;
      _recordDuration = 0;
    });
    if (path != null) setState(() => _audioPath = path);
  }

  void _cancelRecording() async {
    await widget.recorder.stop();
    _timer?.cancel();
    setState(() {
      _isRecording = false;
      _recordDuration = 0;
    });
  }

  void _handleSend() async {
    if (_pickedImage != null) {
      final extension = _pickedImage!.path.split('.').last.toLowerCase();
      final contentType = MediaType('image', extension);
      final image = await MultipartFile.fromFile(
        _pickedImage!.path,
        filename: _pickedImage!.name,
        contentType: contentType,
      );
      widget.onSendImage([image], [_pickedImage!.path]);
      setState(() => _pickedImage = null);
      return;
    }
    if (_audioPath != null) {
      final audio = await MultipartFile.fromFile(
        _audioPath!,
        filename: 'audio_${DateTime.now().millisecondsSinceEpoch}.m4a',
        contentType: MediaType('audio', 'm4a'),
      );
      widget.onSendAudio(audio, _audioPath!);
      setState(() => _audioPath = null);
      return;
    }
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      widget.onSend(text);
      _playSendSound();
      _controller.clear();
    }
  }

  Future<void> _playSendSound() async {
    try {
      await _audioPlayer.play(
        AssetSource('sounds/send.mp3'),
        volume: 0.5,
      );
    } catch (e) {
      // ignore error if sound not found
    }
  }

  void _toggleEmojiPicker() {
    setState(() {
      _showEmojiPicker = !_showEmojiPicker;
      if (_showEmojiPicker) {
        _focusNode.unfocus();
      } else {
        FocusScope.of(context).requestFocus(_focusNode);
      }
    });
  }

  Widget? _buildPrefixWidget() {
    if (_isRecording) {
      String twoDigits(int n) => n.toString().padLeft(2, '0');
      final minutes = twoDigits(_recordDuration ~/ 60);
      final seconds = twoDigits(_recordDuration % 60);
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.red.withValues(alpha: 0.5),
                  blurRadius: 8,
                  spreadRadius: 1,
                ),
              ],
            ),
          ),
          const SizedBox(width: 6),
          Text(
            "$minutes:$seconds",
            style: const TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close, color: Colors.red, size: 18),
            onPressed: _cancelRecording,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      );
    }
    if (_pickedImage != null) {
      return Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.file(
                File(_pickedImage!.path),
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
            GestureDetector(
              onTap: () => setState(() => _pickedImage = null),
              child: const CircleAvatar(
                radius: 9,
                backgroundColor: Colors.black54,
                child: Icon(Icons.close, color: Colors.white, size: 12),
              ),
            ),
          ],
        ),
      );
    }
    if (_audioPath != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.audiotrack, color: Colors.blue, size: 28),
          IconButton(
            icon: const Icon(Icons.close, color: Colors.red, size: 18),
            onPressed: () => setState(() => _audioPath = null),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_showEmojiPicker) {
          setState(() => _showEmojiPicker = false);
          FocusScope.of(context).requestFocus(_focusNode);
          return false;
        }
        return true;
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 12.w),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.4),
                  blurRadius: 4.r,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: _toggleEmojiPicker,
                  icon: Icon(Icons.emoji_emotions_outlined,
                      color: Colors.grey[600]),
                ),
                Expanded(
                  child: TextField(
                    cursorColor: ColorsManager.primaryPinkColor,
                    controller: _controller,
                    focusNode: _focusNode,
                    decoration: InputDecoration(
                      hintText: 'Type your message...',
                      border: InputBorder.none,
                      prefixIcon: _buildPrefixWidget(),
                      prefixIconConstraints: const BoxConstraints(
                        minWidth: 0,
                        minHeight: 0,
                      ),
                    ),
                    minLines: 1,
                    maxLines: 3,
                  ),
                ),
                IconButton(
                  onPressed: _pickImage,
                  icon: Icon(Icons.image_outlined, color: Colors.grey[600]),
                ),
                GestureDetector(
                  onLongPress: _startRecording,
                  onLongPressUp: _stopRecording,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Icon(Icons.mic_none, color: Colors.grey[600]),
                  ),
                ),
                Container(
                  height: 48.h,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorsManager.primaryPinkColor,
                  ),
                  child: IconButton(
                    onPressed: _handleSend,
                    icon: Icon(Icons.send, color: Colors.white, size: 22.sp),
                  ),
                ),
              ],
            ),
          ),
          if (_showEmojiPicker)
            SizedBox(
              height: 240.h,
              child: EmojiPicker(
                onEmojiSelected: (Category? category, Emoji emoji) {
                  _controller
                    ..text += emoji.emoji
                    ..selection = TextSelection.fromPosition(
                        TextPosition(offset: _controller.text.length));
                },
                onBackspacePressed: null,
                config: const Config(
                  emojiViewConfig: EmojiViewConfig(
                    columns: 7,
                    emojiSizeMax: 28.0,
                    verticalSpacing: 0,
                    horizontalSpacing: 0,
                  ),
                  categoryViewConfig: CategoryViewConfig(),
                  skinToneConfig: SkinToneConfig(),
                  bottomActionBarConfig: BottomActionBarConfig(
                    showSearchViewButton: false,
                    showBackspaceButton: false,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
