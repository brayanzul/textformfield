import 'package:flutter/material.dart';

import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class FormCard extends StatefulWidget {
  const FormCard({super.key});

  @override
  State<FormCard> createState() => _FormCardState();
}

class _FormCardState extends State<FormCard> {
  var cardMask = MaskTextInputFormatter(mask: '#### #### #### ####', filter: { "#": RegExp(r'[0-9]') });
  var dateMask = MaskTextInputFormatter(mask: '##/##', filter: { "#": RegExp(r'[0-9]') });
  var codeMask = MaskTextInputFormatter(mask: '###', filter: { "#": RegExp(r'[0-9]') });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Image.network("https://www.mastercard.es/content/dam/public/mastercardcom/eu/es/images/Consumidores/escoge-tu-tarjeta/credito/credito-estandar/card-image-standard-credit-card.png"),
          const SizedBox(
            height: 20,
          ),
          _inputName(),
          const SizedBox(
            height: 20,
          ),
          _inputCard(),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width*0.5,
                child: _inputDate(),
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.5,
                child: _inputCode(),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.all(15),
            width: MediaQuery.of(context).size.width - 30,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("Pagar"),
            ),
          ),
        ],
      ),
    );
  }

  Container _inputName() {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          border: Border.all(color: Colors.black)
        ),
        padding: const EdgeInsets.symmetric(horizontal: 25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        child: TextFormField(
          keyboardType: TextInputType.text,
          style: const TextStyle(fontSize: 20),
          decoration: const InputDecoration(
            hintText: "Lee M. Cardholder",
            border: InputBorder.none),
        ),
      );
  }

  Container _inputCard() {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          border: Border.all(color: Colors.black)
        ),
        padding: const EdgeInsets.symmetric(horizontal: 25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        child: TextFormField(
          inputFormatters: [cardMask],
          keyboardType: TextInputType.number,
          style: const TextStyle(fontSize: 20),
          decoration: const InputDecoration(
            hintText: "5412 7512 3412 3456",
            border: InputBorder.none),
        ),
      );
  }

  Container _inputDate() {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          border: Border.all(color: Colors.black)
        ),
        padding: const EdgeInsets.symmetric(horizontal: 25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        child: TextFormField(
          inputFormatters: [dateMask],
          keyboardType: TextInputType.number,
          style: const TextStyle(fontSize: 20),
          decoration: const InputDecoration(
            hintText: "12/23",
            border: InputBorder.none),
        ),
      );
  }

  Container _inputCode() {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          border: Border.all(color: Colors.black)
        ),
        padding: const EdgeInsets.symmetric(horizontal: 25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        child: TextFormField(
          inputFormatters: [codeMask],
          keyboardType: TextInputType.number,
          style: const TextStyle(fontSize: 20),
          decoration: const InputDecoration(
            hintText: "346",
            border: InputBorder.none),
        ),
      );
  }

}
