import 'dart:async';

import 'package:flutter/material.dart';

class SearchBarCustom extends StatefulWidget {
  final String hint;
  final Function(String) onSearch;
  const SearchBarCustom({
    super.key,
    this.hint = 'Search...',
    required this.onSearch,
  });

  @override
  // ignore: library_private_types_in_public_api
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBarCustom> {
  final TextEditingController _controller = TextEditingController();
  Timer? _debounce;
  @override
  void dispose() {
    _controller.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      widget.onSearch(value); 
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      onChanged: _onChanged,
      decoration: InputDecoration(
        hintText: widget.hint,
        hoverColor: Colors.black,
        hintStyle: const TextStyle(
          color: Color(0xFF4E4E4E),
          fontSize: 16,
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: const BorderSide(color: Color(0xFF4E4E4E)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: const BorderSide(color: Color(0xFF4E4E4E)),
        ),
        suffixIcon: IconButton(
          icon: const Icon(Icons.search, color: Color(0xFF4E4E4E)),
          onPressed: () {
            widget.onSearch(_controller.text); // Trigger search immediately
          },
        ),
      ),
    );
  }
}
