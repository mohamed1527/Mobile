import 'package:flutter/material.dart';

class aboutUs extends StatelessWidget {
  Column BuildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          padding: EdgeInsets.only(bottom: 5),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'images/Capture3.PNG',
          width: 411.4,
          height: 240,
          fit: BoxFit.cover,
        ),
        Padding(padding: EdgeInsets.only(bottom: 8)),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          BuildButtonColumn(Colors.black, Icons.call, 'CALL'),
          BuildButtonColumn(Colors.black, Icons.near_me, 'ROUTE'),
          BuildButtonColumn(Colors.black, Icons.share, 'SHARE'),
        ]),
        Container(
          margin: EdgeInsets.all(10.0),
          width: 400,
          height: 300,
          child: Text(
            'Misr International University is an undergraduate private university located in ElObour city in Qalyubiyya Governorate.'
            'Established in 1996, in Maadi, The University changed its location to km 28 Cairo-Ismailia Road.'
            'Prof. Mohamed Shebl El komy is the university president.',
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
            maxLines: null,
            softWrap: true,
          ),
        ),
      ],
    );
  }
}
