import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/colors_manager.dart';

class MessageInputField extends StatefulWidget {
  final ValueChanged<String> onSend;
  final VoidCallback onPickImage;
  final VoidCallback onRecordAudio;

  const MessageInputField({
    super.key,
    required this.onSend,
    required this.onPickImage,
    required this.onRecordAudio,
  });

  @override
  State<MessageInputField> createState() => _MessageInputFieldState();
}

class _MessageInputFieldState extends State<MessageInputField> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _showEmojiPicker = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus && _showEmojiPicker) {
        setState(() => _showEmojiPicker = false);
      }
    });
  }

  void _handleSend() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      widget.onSend(text);
      _controller.clear();
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

  @override
  Widget build(BuildContext context) {
    return Column(
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
                  decoration: const InputDecoration(
                    hintText: 'Type your message...',
                    border: InputBorder.none,
                  ),
                  minLines: 1,
                  maxLines: 3,
                ),
              ),
              IconButton(
                onPressed: widget.onPickImage,
                icon: Icon(Icons.image_outlined, color: Colors.grey[600]),
              ),
              IconButton(
                onPressed: widget.onRecordAudio,
                icon: Icon(Icons.mic_none, color: Colors.grey[600]),
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
                    TextPosition(offset: _controller.text.length),
                  );
              },
              onBackspacePressed: null,
              config: Config(
                emojiViewConfig: EmojiViewConfig(
                  emojiSizeMax: 28 * ScreenUtil().scaleText,
                  verticalSpacing: 0,
                  horizontalSpacing: 0,
                ),
                bottomActionBarConfig: const BottomActionBarConfig(
                  showBackspaceButton: false,
                  showSearchViewButton: false,
                ),
                skinToneConfig: const SkinToneConfig(),
                categoryViewConfig: const CategoryViewConfig(),
              ),
            ),
          ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }
}
