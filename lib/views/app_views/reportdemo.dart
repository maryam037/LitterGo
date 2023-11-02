import 'package:flutter/material.dart';
import 'package:fypscreensdemo/constants/routes.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  final TextEditingController additionalinfoController =
      TextEditingController();

  String? selectedSize;
  String? selectedType;
  bool caraccess = false;
  bool cave = false;
  bool underwater = false;
  bool notforgeneralcleanup = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe8eff1),
      appBar: AppBar(
        title: const Text('Submit a Report'),
        backgroundColor: const Color(0xff1473b9),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).popAndPushNamed(AppRoutes.maindashboard);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Text(
                'REPORT NOW',
                style: TextStyle(
                  fontSize: 28,
                  color: Color(0xff1473b9),
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Enter Information of Litter Dump spotted',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xff1473b9),
                ),
              ),
              const SizedBox(height: 10),
              _buildQuestionContainer(
                'Litter Dump Size:',
                [
                  _buildRadioListTile('Fits in a Bag', Icons.shopping_bag,
                      'Fits in a Bag', 'Size'),
                  _buildRadioListTile(
                      'Fits in a Wheelbarrow',
                      Icons.production_quantity_limits,
                      'Fits in a Wheelbarrow',
                      'Size'),
                  _buildRadioListTile('Truck Needed', Icons.local_shipping,
                      'Truck Needed', 'Size'),
                ],
              ),
              _buildQuestionContainer(
                'Litter Dump Type:',
                [
                  _buildRadioListTile(
                      'Household', Icons.other_houses, 'Household', 'Type'),
                  _buildRadioListTile('Construction', Icons.construction,
                      'Construction', 'Type'),
                  _buildRadioListTile(
                      'Plastic', Icons.workspaces_outline, 'Plastic', 'Type'),
                  _buildRadioListTile(
                      'Organic', Icons.compost, 'Organic', 'Type'),
                  _buildRadioListTile('Dangerous', Icons.report_gmailerrorred,
                      'Dangerous', 'Type'),
                  _buildRadioListTile(
                      'Animal waste', Icons.pets, 'Animal waste', 'Type'),
                  _buildRadioListTile(
                      'Glass', Icons.workspaces_outline, 'Glass', 'Type'),
                  _buildRadioListTile(
                      'Other/Mix', Icons.priority_high, 'Other/Mix', 'Type'),
                ],
              ),
              _buildQuestionContainer(
                'Litter Dump Accessibility:',
                [
                  _buildCheckboxListTile(
                      'Accessible by car', Icons.directions_car, caraccess,
                      (value) {
                    setState(() {
                      caraccess = value!;
                    });
                  }),
                  _buildCheckboxListTile(
                      'Located on height', Icons.terrain, cave, (value) {
                    setState(() {
                      cave = value!;
                    });
                  }),
                  _buildCheckboxListTile(
                      'Underwater/on the water side', Icons.water, underwater,
                      (value) {
                    setState(() {
                      underwater = value!;
                    });
                  }),
                  _buildCheckboxListTile('Illegal landfilling', Icons.warning,
                      notforgeneralcleanup, (value) {
                    setState(() {
                      notforgeneralcleanup = value!;
                    });
                  }),
                ],
              ),
              _buildQuestionContainer(
                'Additional Information',
                [
                  TextField(
                    controller: additionalinfoController,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter text here',
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(AppRoutes.reportmap);
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
                            color: Color(0xffffffff)),
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
      ),
    );
  }

  Widget _buildRadioListTile(
      String title, IconData icon, String value, String type) {
    return RadioListTile(
      title: Text(
        title,
        style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            height: 1,
            color: Color(0xff1473b9)),
      ),
      value: value,
      groupValue: (type == 'Size') ? selectedSize : selectedType,
      onChanged: (newValue) {
        setState(() {
          if (type == 'Size') {
            selectedSize = newValue as String;
          } else {
            selectedType = newValue as String;
          }
        });
      },
      secondary: Icon(icon),
      activeColor: const Color(0xff1473b9),
    );
  }

  Widget _buildCheckboxListTile(
      String title, IconData icon, bool value, ValueChanged<bool?>? onChanged) {
    return CheckboxListTile(
      title: Text(
        title,
        style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            height: 1,
            color: Color(0xff1473b9)),
      ),
      value: value,
      onChanged: onChanged,
      secondary: Icon(icon),
    );
  }

  Widget _buildQuestionContainer(
    String title,
    List<Widget> options,
  ) {
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
                color: Color(0xff1473b9)),
          ),
          const SizedBox(height: 10),
          Column(children: options),
        ],
      ),
    );
  }
}
