import 'package:flowershop/data/messages.dart';
import 'package:flowershop/models/message.dart';
import 'package:flowershop/theme/app_text_styles.dart';
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
            Padding(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Text(
                  "Voeg een boodschap toe...",
                  style: AppTextStyles.subtitle(context),
                  maxLines: 1,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[index];

                  return SizedBox(
                    height: 250,
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
