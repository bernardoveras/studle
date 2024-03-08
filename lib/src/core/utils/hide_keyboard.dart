import 'package:flutter/material.dart';

void hideKeyboard() => FocusManager.instance.primaryFocus?.unfocus();
