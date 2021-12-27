import 'package:flutter/material.dart';

class TabReview extends StatelessWidget {
  const TabReview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      child: Column(
        children: [
          Center(
            child: Text(
              'Ratings & Reviews',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            height: 1,
            width: 400,
            color: Colors.grey,
            alignment: Alignment.center,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  '5.0',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(width: 15),
              Icon(Icons.star, color: Colors.orange),
              Icon(Icons.star, color: Colors.orange),
              Icon(Icons.star, color: Colors.orange),
              Icon(Icons.star, color: Colors.orange),
              Icon(Icons.star, color: Colors.orange),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            height: 1,
            width: 400,
            color: Colors.grey,
            alignment: Alignment.center,
          ),
          const SizedBox(height: 10),
          Row(
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Reviews',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.star, color: Colors.orange),
              Icon(Icons.star, color: Colors.orange),
              Icon(Icons.star, color: Colors.orange),
              Icon(Icons.star, color: Colors.orange),
              Icon(Icons.star, color: Colors.orange),
              const Spacer(),
              Text(
                '25 Dec 2021',
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
            ]
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Text(
                'By ABC',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Text(
            'Great quality. True to size. Great value for money. Match the description. Nice and comfy. Love the design. Material also very nice. So easy to iron and cool material.',
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          SizedBox(height: 5),
          Text(
            'Size: International M | Purchased on: 05 Dec 2021',
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 1,
            width: 400,
            color: Colors.grey,
            alignment: Alignment.center,
          ),

          SizedBox(height: 10),
          Row(
            //mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.star, color: Colors.orange),
                Icon(Icons.star, color: Colors.orange),
                Icon(Icons.star, color: Colors.orange),
                Icon(Icons.star, color: Colors.orange),
                Icon(Icons.star, color: Colors.orange),
                const Spacer(),
                Text(
                  '25 Dec 2021',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
              ]
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Text(
                'By ABC',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Text(
            'Great quality. True to size. Great value for money. Match the description. Nice and comfy. Love the design. Material also very nice. So easy to iron and cool material.',
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          SizedBox(height: 5),
          Text(
            'Size: International M | Purchased on: 05 Dec 2021',
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 1,
            width: 400,
            color: Colors.grey,
            alignment: Alignment.center,
          ),
          TextButton(
              onPressed: () {},
              child: Text(
                'See all reviews',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.green,
                ),
              ),
          )
        ],
      ),
    );
  }
}
