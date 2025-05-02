import 'package:flutter/material.dart';

@immutable
sealed class ChatState {}

final class ChatInitial extends ChatState {}

final class ChatSuccess extends ChatState {}
