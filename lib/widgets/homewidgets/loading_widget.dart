import 'package:flutter/material.dart';
import 'package:pokemon/utils/colors.dart';

class Loading{
 static loadingWidget() {return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        SizedBox(
            width: 40,
            height: 40,
            child: CircularProgressIndicator(
              strokeWidth: 3,
              valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "Loading Pokémon...",
            style: TextStyle(
              color: disabledcolor[600],
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }


}