import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../models/ratingreview_model.dart';


class UserRatingReview extends StatefulWidget {
  const UserRatingReview({Key? key}) : super(key: key);

  @override
  State<UserRatingReview> createState() => _UserRatingReviewState();
}

class _UserRatingReviewState extends State<UserRatingReview> {
  TextEditingController review = new TextEditingController();
  final form = GlobalKey<FormState>();

  double newRating = 0.0;
  hintStyle() {
    TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );
  }

  formsOutline() {
    OutlineInputBorder(
        borderSide: BorderSide(width: 2, color: Colors.white),
        borderRadius: BorderRadius.circular(30));
  }