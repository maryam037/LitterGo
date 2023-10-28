import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fypscreensdemo/constants/routes.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final TextEditingController commentController = TextEditingController();
  double rating = 0;
  String comment = '';
  bool q1 = true;

  String satisfied = '';
  String useagain = '';

  @override
  Widget build(BuildContext context) {
    const double fem = 1.0;
    const double ffem = 1.0;
    return Scaffold(
      backgroundColor: const Color(0xffe8eff1),
      appBar: AppBar(
        title: const Text('Submit Feedback'),
        backgroundColor: const Color(0xff1473b9),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).popAndPushNamed(AppRoutes.tracking);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20 * fem),
        child: Column(
          children: [
            const SizedBox(height: 20 * fem),
            const Text(
              'Feedback of Report',
              style: TextStyle(
                fontSize: 28 * fem,
                color: Color(0xff1473b9),
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10 * fem),
            const Text(
              ' Thank You for reporting Litter dump using our Application.',
              style: TextStyle(
                fontSize: 18 * fem,
                color: Color(0xff1473b9),
              ),
            ),
            const SizedBox(height: 20 * fem),
            const Text(
              'How was your experience?',
              style: TextStyle(
                fontSize: 18 * ffem,
                fontWeight: FontWeight.w500,
                height: 1.2,
                color: Color(0xff1473b9),
              ),
            ),
            const SizedBox(height: 20 * fem),
            Center(
              child: RatingBar.builder(
                initialRating: rating,
                minRating: 0,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 40 * fem,
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (newRating) {
                  setState(() {
                    rating = newRating;
                  });
                },
              ),
            ),
            const SizedBox(height: 20 * fem),
            Center(
              child: Text(
                'Your Rating: ${rating.toStringAsFixed(1)}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20 * fem),
            const Text(
              'Are you satisfied with cleaning?',
              style: TextStyle(
                fontSize: 18 * ffem,
                fontWeight: FontWeight.w500,
                height: 1.2,
                color: Color(0xff1473b9),
              ),
            ),
            RadioListTile(
              title: const Text(
                'Yes',
                style: TextStyle(
                  fontSize: 18 * ffem,
                  fontWeight: FontWeight.w400,
                  height: 1,
                  color: Color(0xff4daddf),
                ),
              ),
              value: 'Yes',
              groupValue: satisfied,
              onChanged: (value) {
                setState(() {
                  satisfied = value as String;
                });
              },
              secondary: const Icon(Icons.sentiment_satisfied_alt),
              activeColor: Color(0xff4daddf),
            ),
            RadioListTile(
              title: const Text(
                'No',
                style: TextStyle(
                  fontSize: 18 * ffem,
                  fontWeight: FontWeight.w400,
                  height: 1,
                  color: Color(0xff4daddf),
                ),
              ),
              value: 'No',
              groupValue: satisfied,
              onChanged: (value) {
                setState(() {
                  satisfied = value as String;
                });
              },
              secondary: const Icon(Icons.sentiment_very_dissatisfied),
              activeColor: Color(0xff4daddf),
            ),
            RadioListTile(
              title: const Text(
                'Maybe',
                style: TextStyle(
                  fontSize: 18 * ffem,
                  fontWeight: FontWeight.w400,
                  height: 1,
                  color: Color(0xff4daddf),
                ),
              ),
              value: 'Maybe',
              groupValue: satisfied,
              onChanged: (value) {
                setState(() {
                  satisfied = value as String;
                });
              },
              secondary: const Icon(Icons.sentiment_neutral),
              activeColor: Color(0xff4daddf),
            ),
            const SizedBox(height: 20 * fem),
            Text(
              'Selected Option: $satisfied',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20 * fem),
            const Text(
              'Will you report again?',
              style: TextStyle(
                fontSize: 18 * ffem,
                fontWeight: FontWeight.w500,
                height: 1.2,
                color: Color(0xff1473b9),
              ),
            ),
            RadioListTile(
              title: const Text(
                'Yes',
                style: TextStyle(
                  fontSize: 18 * ffem,
                  fontWeight: FontWeight.w400,
                  height: 1,
                  color: Color(0xff4daddf),
                ),
              ),
              value: 'Yes',
              groupValue: useagain,
              onChanged: (value) {
                setState(() {
                  useagain = value as String;
                });
              },
              secondary: const Icon(Icons.sentiment_satisfied_alt),
              activeColor: Color(0xff4daddf),
            ),
            RadioListTile(
              title: const Text(
                'No',
                style: TextStyle(
                  fontSize: 18 * ffem,
                  fontWeight: FontWeight.w400,
                  height: 1,
                  color: Color(0xff4daddf),
                ),
              ),
              value: 'No',
              groupValue: useagain,
              onChanged: (value) {
                setState(() {
                  useagain = value as String;
                });
              },
              secondary: const Icon(Icons.sentiment_very_dissatisfied),
              activeColor: Color(0xff4daddf),
            ),
            RadioListTile(
              title: const Text(
                'Maybe',
                style: TextStyle(
                  fontSize: 18 * ffem,
                  fontWeight: FontWeight.w400,
                  height: 1,
                  color: Color(0xff4daddf),
                ),
              ),
              value: 'Maybe',
              groupValue: useagain,
              onChanged: (value) {
                setState(() {
                  useagain = value as String;
                });
              },
              secondary: const Icon(Icons.sentiment_neutral),
              activeColor: Color(0xff4daddf),
            ),
            const SizedBox(height: 20 * fem),
            Text(
              'Selected Option: $useagain',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40 * fem),
            const Text(
              'Comments',
              textAlign: TextAlign.left, // Align left
              style: TextStyle(
                fontSize: 18 * ffem,
                fontWeight: FontWeight.w500,
                height: 1.2,
                color: Color(0xff1473b9),
              ),
            ),
            const SizedBox(height: 20 * fem),
            TextField(
              controller: commentController,
              maxLines: null, // Set to null for a multi-line text area
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter comments here...',
              ),
            ),
            const SizedBox(height: 40 * fem),
            GestureDetector(
              onTap: () {
                // Navigator.of(context).pushNamed(AppRoutes.reportmap);
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 10 * fem),
                decoration: BoxDecoration(
                  color: const Color(0xff1473b9),
                  borderRadius: BorderRadius.circular(20 * fem),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x3f000000),
                      offset: Offset(0 * fem, 4.0 * ffem),
                      blurRadius: 2 * fem,
                    ),
                  ],
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Submit',
                      style: TextStyle(
                        fontSize: 20 * ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.2 * fem,
                        color: Color(0xffffffff),
                      ),
                    ),
                    SizedBox(width: 10 * fem),
                    Icon(
                      Icons.arrow_forward,
                      size: 24 * fem,
                      color: Color(0xffffffff),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
