import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

MarkdownStyleSheet mdStyle = MarkdownStyleSheet(
  h1: const TextStyle(
    fontFamily: 'Readex Pro',
    color: Colors.black,
    fontSize: 30,
    fontWeight: FontWeight.normal,
  ),
  h2: const TextStyle(
    fontFamily: 'Readex Pro',
    color: Colors.black,
    fontSize: 25,
    fontWeight: FontWeight.normal,
  ),
  h3: const TextStyle(
    fontFamily: 'Readex Pro',
    color: Colors.black,
    fontSize: 20,
    fontWeight: FontWeight.normal,
  ),
  h4: const TextStyle(
    fontFamily: 'Readex Pro',
    color: Colors.black,
    fontSize: 15,
    fontWeight: FontWeight.normal,
  ),
  h5: const TextStyle(
    fontFamily: 'Readex Pro',
    color: Colors.black,
    fontSize: 10,
    fontWeight: FontWeight.normal,
  ),
  h6: const TextStyle(
    fontFamily: 'Readex Pro',
    color: Colors.black,
    fontSize: 5,
    fontWeight: FontWeight.normal,
  ),
  p: const TextStyle(
    fontFamily: 'Readex Pro',
    color: Colors.black,
    fontSize: 15,
    fontWeight: FontWeight.normal,
  ),
  blockquote: const TextStyle(
    fontFamily: 'Readex Pro',
    color: Colors.black,
    fontSize: 15,
    fontWeight: FontWeight.normal,
  ),
  strong: const TextStyle(
    fontFamily: 'Readex Pro',
    color: Colors.black,
    fontSize: 15,
    fontWeight: FontWeight.normal,
  ),
  em: const TextStyle(
    fontFamily: 'Readex Pro',
    color: Colors.black,
    fontSize: 15,
    fontWeight: FontWeight.normal,
  ),
  code: const TextStyle(
    fontFamily: 'Readex Pro',
    color: Colors.black,
    backgroundColor: Colors.transparent,
    fontSize: 15,
    fontWeight: FontWeight.bold,
  ),
  codeblockPadding: const EdgeInsets.all(10),
  codeblockDecoration: BoxDecoration(
    color: Colors.grey[200],
    borderRadius: BorderRadius.circular(10),
  ),
);
