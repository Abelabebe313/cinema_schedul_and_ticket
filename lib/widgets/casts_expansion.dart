import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class CastsExpansionWidget extends StatelessWidget {
  final BuildContext context;
  final String description;

  CastsExpansionWidget({required this.context, required this.description});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: const Padding(
        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
        child: Text(
          'Casts',
          style: TextStyle(
            fontFamily: 'Poppins-SemiBold',
            fontSize: 18,
          ),
        ),
      ),
      children: [
        const SizedBox(height: 10),
        _buildDetailText(description),
      ],
    );
  }

  Widget _buildDetailText(String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: SizedBox(
            width: 350,
            child: Text(
              content,
              style: TextStyle(
                fontFamily: 'Poppins-Light',
                fontSize: 12,
                color: AdaptiveTheme.of(context).mode.isDark
                    ? Color(0xffBABFC9)
                    : Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
