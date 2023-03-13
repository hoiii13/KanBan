import 'package:flutter/material.dart';

buildTextField(controller, focus, isFocus, text) {
  return Container(
    margin: const EdgeInsets.only(top: 20),
    child: TextField(
      controller: controller,
      focusNode: focus,
      cursorColor: Colors.black,
      decoration: InputDecoration(
          hintStyle: const TextStyle(fontSize: 15),
          hintText: text,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: Colors.black, width: 3)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: Colors.black, width: 3)),
          suffixIcon: isFocus
              ? IconButton(
                  onPressed: () {
                    controller.clear();
                  },
                  icon: const Icon(
                    Icons.cancel,
                    size: 18,
                    color: Colors.black,
                  ))
              : const SizedBox()),
    ),
  );
}
