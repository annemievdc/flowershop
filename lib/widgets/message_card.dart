import 'package:flowershop/models/message.dart';
import 'package:flowershop/theme/app_text_styles.dart';
import 'package:flowershop/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MessageCard extends StatelessWidget {
  final Message message;
  final VoidCallback onAddMessage;
  final bool isSelected;

  const MessageCard({
    super.key,
    required this.message,
    required this.onAddMessage,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onAddMessage,

        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              color: isSelected ? AppTheme.mutedPurple : AppTheme.darkSlate,
              width: isSelected ? 1.4 : 0.7,
            ),
          ),

          elevation: isSelected ? 6 : 1,
          shadowColor: AppTheme.mutedPurple,

          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  FontAwesomeIcons.featherPointed,
                  color: AppTheme.mutedPurple,
                  size: 18,
                ),
                SizedBox(height: 16),
                Text(
                  message.messagecontent,
                  textAlign: TextAlign.center,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.cardsubtitle(context),
                ),

                if (message.author != null && message.author!.isNotEmpty)
                  Text(
                    " - ${message.author}",
                    style: AppTextStyles.cardbody(context),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
