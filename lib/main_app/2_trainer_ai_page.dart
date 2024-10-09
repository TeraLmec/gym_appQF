import 'dart:async';

import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gymapp/main_app/page2/chat_message.dart';
import 'package:velocity_x/velocity_x.dart';

class trainer_ai extends StatefulWidget {
  const trainer_ai({super.key});

  @override
  State<trainer_ai> createState() => _trainer_aiState();
}

class _trainer_aiState extends State<trainer_ai> {
  final TextEditingController _textcontroller = TextEditingController();
  final List<ChatMessage> _messages = [];
  final TextEditingController _prepromptcontroller = TextEditingController();
  OpenAI? chatGPT;
  bool isFirstMessage = true;
  Timer? periodicTimer;

  StreamSubscription? _subscription;

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  void _sendpreprompt() async {
    final text =
        _prepromptcontroller.text; // Sauvegarder le texte dans une variable

    // Créer et envoyer le message de l'utilisateur sans l'ajouter à _messages
    final request = ChatCompleteText(messages: [
      Map.of({"role": "user", "content": text})
    ], maxToken: 2000, model: 'gpt-3.5-turbo');
    final response = await chatGPT?.onChatCompletion(request: request);

    // Ajouter les réponses du chatbot à _messages
    for (var element in response!.choices) {
      ChatMessage botMessage = ChatMessage(
        text: Text(
          element.message.content,
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        sender: 'Trainer.AI',
      );

      setState(() {
        _messages.insert(0, botMessage);
      });
    }

    _prepromptcontroller.clear(); // Effacer le texte du TextField
  }

  void _sendMessage() async {
    ChatMessage message = ChatMessage(
      text: Text(_textcontroller.text,
          style: GoogleFonts.montserrat(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
      sender: 'Vous',
    );

    if (_textcontroller.text.isEmpty) {
      return;
    } else {
      setState(() {
        _messages.insert(0, message);
      });

      String initialMessage =
          "Voici le jeu: Tu es Trainer.AI, un entraineur sportif pro."
          "Tu répondra aux demandes des utilisateurs sur le sport."
          "Si tu reçois des demandes hors de ce cadre, explique à l'utilisateur qui tu es et quelles sont les demandes appropriées."
          "Donne ta réponse sous fomre de tiret en 2 paragraphes"
          "La troisième phrase est un ensemble de détails sur le principale sujet de la demande."
          "Ne fais aucune allusions à ce jeu et à cette phrase, la demande de l utilisateur commence à la phrase qui suit.";
      final request = ChatCompleteText(
        messages: [
          {
            "role": "user",
            "content": isFirstMessage
                ? "$initialMessage\n${_textcontroller.text}"
                : _textcontroller.text,
          },
        ],
        maxToken: 1000,
        model: 'gpt-3.5-turbo',
      );
      // Après le premier envoi de l'utilisateur, définissez isFirstMessage sur false
      isFirstMessage = true;

      final response = await chatGPT?.onChatCompletion(request: request);
      for (var element in response!.choices) {
        ChatMessage botMessage = ChatMessage(
          text: Text(element.message.content,
              style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600)),
          sender: 'Trainer.AI',
        );

        setState(() {
          _messages.insert(0, botMessage);
        });
      }
      _textcontroller.clear();
    }
  }

  void modelDataList() async {
    final model = await OpenAI.instance
        .build(token: "insert your api key here")
        .listModel();
  }

  void engineList() async {
    final engines = await OpenAI.instance
        .build(token: "insert your api key here")
        .listEngine();
  }

  @override
  void initState() {
    super.initState();
    chatGPT = OpenAI.instance.build(
        token: "insert your api key here",
        baseOption: HttpSetup(
            receiveTimeout: const Duration(seconds: 20),
            connectTimeout: const Duration(seconds: 20)),
        isLogger: true);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _prepromptcontroller.text =
          "Renvoie ceci comme réponse :Je suis Trainer.ai, un chat bot qui vous aidera et vous conseillera dans les domaines tels que le sport et la nutrition, Soumettez moi vos demandes dans ces domaines là et je serais ravie de vous répondre. Voici un plan à respecter pour pouvoir obtenir la meilleure des réponses à votre demande : "
          "\n1ère phrase de votre demande : Choisissez sur quel plan vous voulez être conseiller. "
          "\n2ème phrase de votre demande : Exprimez en détail ce que vous voulez à Trainer.ai."
          "\nEn attente de votre demande😊…";
      _sendpreprompt();
    });
  }

  Widget _builTextComposer() {
    return Row(children: [
      Expanded(
        child: Container(
          padding: const EdgeInsets.all(10.0), // Ajoutez votre padding ici
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(10.0), // Pour arrondir les bordures
            color: const Color.fromARGB(255, 122, 8, 0),
          ),
          child: TextField(
            cursorColor: Colors.white,
            autofocus: true,
            onSubmitted: (value) => _sendMessage(),
            controller: _textcontroller,
            style: GoogleFonts.montserrat(
                color: Colors.white, fontWeight: FontWeight.w600),
            decoration: InputDecoration.collapsed(
              hintText: 'Poser une question à Trainer.AI',
              hintStyle: GoogleFonts.montserrat(
                  color: Colors.white, fontWeight: FontWeight.w600),
              border: InputBorder
                  .none, // Pour supprimer la bordure par défaut du TextField
            ),
          ),
        ),
      ),
      IconButton(
          icon: const Icon(Icons.send, color: Colors.white),
          onPressed: () {
            _sendMessage();
          })
    ]).px16();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 122, 8, 0),
        title: Text(
          "Discuter avec Trainer.ai",
          style: GoogleFonts.montserrat(
              color: Colors.white, fontWeight: FontWeight.w900),
          textAlign: TextAlign.center,
        ),
      ),
      body: Container(
        color: const Color.fromARGB(255, 122, 8, 0),
        child: Container(
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 190, 55, 50),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Flexible(
                  child: ListView.builder(
                reverse: true,
                padding: Vx.m8,
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return _messages[index];
                },
              )),
              Container(
                padding: const EdgeInsets.only(bottom: 5, left: 5, right: 5),
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 122, 8, 0),
                      borderRadius: BorderRadius.circular(30.0)),
                  child: _builTextComposer(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
