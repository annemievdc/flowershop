import 'package:flowershop/data/messages.dart';
import 'package:flowershop/models/message.dart';
import 'package:flowershop/theme/app_text_styles.dart';
import 'package:flowershop/theme/app_theme.dart';
import 'package:flowershop/viewmodels/cart_view_model.dart';
import 'package:flowershop/widgets/message_card.dart';
import 'package:flutter/material.dart';

class MessagePage extends StatefulWidget {
  final CartViewModel cartViewModel;
  const MessagePage({super.key, required this.cartViewModel});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  Message? selectedMessage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppTheme.darkSlate,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: AppTheme.mutedPurple, width: 2),
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.darkSlate,
                    blurRadius: 18,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    height: 120,
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppTheme.mutedPurple,
                        width: 1.5,
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 38,
                      backgroundColor: AppTheme.darkSlate,
                      backgroundImage: AssetImage('assets/images/thing.jpg'),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Kies je boodschap... ',
                          style: AppTextStyles.subtitle(context),
                        ),
                        SizedBox(height: 6),
                        Text(
                          'Thing voegt je kaartje discreet toe aan de bloemen.',
                          style: AppTextStyles.cardbody(context),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),

            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[index];

                  return SizedBox(
                    height: 180,
                    child: MessageCard(
                      message: message,
                      isSelected:
                          selectedMessage?.messagecontent ==
                          message.messagecontent,
                      onAddMessage: () {
                        setState(() {
                          selectedMessage = message;
                          widget.cartViewModel.addMessage(message);
                        });
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
