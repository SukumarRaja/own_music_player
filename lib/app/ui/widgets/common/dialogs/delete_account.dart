import 'package:flutter/material.dart';

deleteAccountDialog(context, {onTap}) async {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      title: const Center(
          child: Text(
        'Do you sure want to delete the account?',
        textAlign: TextAlign.center,
        style: TextStyle(fontFamily: 'medium'),
      )),
      content: const Text(
        "Your all personal data and orders can be deleted. Cannot be restore",
        textAlign: TextAlign.center,
      ),
      contentTextStyle:
          TextStyle(fontFamily: 'regular', color: Theme.of(context).hintColor),
      titleTextStyle: TextStyle(
          fontFamily: 'medium',
          color: Theme.of(context).primaryColor,
          fontSize: 16),
      actions: [
        MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          color: Theme.of(context).hintColor,
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(
            'No',
            style: TextStyle(
                color: Theme.of(context).cardColor, fontFamily: 'medium'),
          ),
        ),
        MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          color: Theme.of(context).primaryColor,
          onPressed: onTap,
          child: Text(
            'Yes',
            style: TextStyle(
                color: Theme.of(context).cardColor,
                fontFamily: 'medium',
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ),
  );
}
