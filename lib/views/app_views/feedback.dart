import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fypscreensdemo/constants/routes.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({Key? key}) : super(key: key);

  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final TextEditingController commentController = TextEditingController();
  double rating = 0;
  String satisfied = '';
  String useAgain = '';

  @override
  Widget build(BuildContext context) {
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
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Feedback of Report',
              style: TextStyle(
                fontSize: 28,
                color: Color(0xff1473b9),
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Please submit your feedback for the clean up after your report completion',
              style: TextStyle(
                fontSize: 18,
                color: Color(0xff1473b9),
              ),
            ),
            const SizedBox(height: 20),

            // Encapsulating sections in styled containers using _buildQuestionContainer
            _buildQuestionContainer(
              'Rate the clean up effort:',
              [
                Center(
                  child: RatingBar.builder(
                    initialRating: rating,
                    minRating: 0,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 40,
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
              ],
            ),

            _buildQuestionContainer(
              'Satisfied with cleaning?',
              [
                RadioListTile(
                  title: const Text(
                    'Yes',
                    style: TextStyle(
                      fontSize: 18,
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
                  activeColor: const Color(0xff4daddf),
                ),
                RadioListTile(
                  title: const Text(
                    'No',
                    style: TextStyle(
                      fontSize: 18,
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
                  activeColor: const Color(0xff4daddf),
                ),
                RadioListTile(
                  title: const Text(
                    'Maybe',
                    style: TextStyle(
                      fontSize: 18,
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
                  activeColor: const Color(0xff4daddf),
                ),
              ],
            ),

            _buildQuestionContainer(
              'Report again?',
              [
                RadioListTile(
                  title: const Text(
                    'Yes',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      height: 1,
                      color: Color(0xff4daddf),
                    ),
                  ),
                  value: 'Yes',
                  groupValue: useAgain,
                  onChanged: (value) {
                    setState(() {
                      useAgain = value as String;
                    });
                  },
                  secondary: const Icon(Icons.sentiment_satisfied_alt),
                  activeColor: const Color(0xff4daddf),
                ),
                RadioListTile(
                  title: const Text(
                    'No',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      height: 1,
                      color: Color(0xff4daddf),
                    ),
                  ),
                  value: 'No',
                  groupValue: useAgain,
                  onChanged: (value) {
                    setState(() {
                      useAgain = value as String;
                    });
                  },
                  secondary: const Icon(Icons.sentiment_very_dissatisfied),
                  activeColor: const Color(0xff4daddf),
                ),
                RadioListTile(
                  title: const Text(
                    'Maybe',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      height: 1,
                      color: Color(0xff4daddf),
                    ),
                  ),
                  value: 'Maybe',
                  groupValue: useAgain,
                  onChanged: (value) {
                    setState(() {
                      useAgain = value as String;
                    });
                  },
                  secondary: const Icon(Icons.sentiment_neutral),
                  activeColor: const Color(0xff4daddf),
                ),
              ],
            ),
            _buildQuestionContainer(
              'Your Comments',
              [
                TextField(
                  controller: commentController,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter comments here...',
                  ),
                ),
              ],
            ),

            GestureDetector(
              onTap: () {
                _submitFeedback(context);
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: const Color(0xff1473b9),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x3f000000),
                      offset: Offset(0, 4.0),
                      blurRadius: 2,
                    ),
                  ],
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Submit',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        height: 1.2,
                        color: Color(0xffffffff),
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.arrow_forward,
                      size: 24,
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

  Widget _buildQuestionContainer(String title, List<Widget> options) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Color(0xff1473b9),
            ),
          ),
          const SizedBox(height: 10),
          Column(children: options),
        ],
      ),
    );
  }

  // Function to handle feedback submission and show the pop-up
  void _submitFeedback(BuildContext context) {
    // Perform actions to submit the feedback (save to database, etc.)

    // Show a pop-up
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Thank You for Your Feedback'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the pop-up
                Navigator.of(context).pushNamed(AppRoutes
                    .maindashboard); // Navigate to the given screen path
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
