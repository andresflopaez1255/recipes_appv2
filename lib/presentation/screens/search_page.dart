import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color(0xFF4E4E4E),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: const Text(
            'Categorias',
            style: TextStyle(
              color: Color(0xFF4E4E4E),
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: false,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              // ignore: void_checks
              child: SearchBar( onChanged: (){},),
            ),
            // Add your search results here
          ],
        ));
  }
}

class SearchBar extends StatelessWidget {
  final String hint;
  final Function() onChanged;
  const SearchBar({
    super.key,
    this.hint = 'Search...',
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        hoverColor: Colors.black,
        hintStyle: const TextStyle(
          color: Color(0xFF4E4E4E),
          fontSize: 16,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
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
          onPressed: onChanged,
        ),
      ),
    );
  }
}
