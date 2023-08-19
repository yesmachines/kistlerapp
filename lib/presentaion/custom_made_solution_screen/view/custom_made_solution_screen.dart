import 'package:flutter/material.dart';
import 'package:kistler/core/constants.dart/color.dart';
import 'package:kistler/presentaion/home_screen/view/home_screen.dart';

import '../../../global_widgets/search_bar.dart';
import 'custom_screen_widgets/custom_widget.dart';

class CustomMadeSolutionScreen extends StatefulWidget {
  const CustomMadeSolutionScreen({super.key});

  @override
  State<CustomMadeSolutionScreen> createState() =>
      _CustomMadeSolutionScreenState();
}

class _CustomMadeSolutionScreenState extends State<CustomMadeSolutionScreen> {
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  TextEditingController _controller3 = TextEditingController();
  TextEditingController _controller4 = TextEditingController();
  TextEditingController _controller5 = TextEditingController();
  TextEditingController _controller6 = TextEditingController();
  TextEditingController _controller7 = TextEditingController();

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();
    _controller5.dispose();
    _controller6.dispose();
    _controller7.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration:
              BoxDecoration(color: ColorConstant.kistlerWhite, boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 10,
              offset: Offset(1, 3),
            ),
          ]),
          height: 70,
          child: Center(
            child: Container(
              height: 45,
              width: MediaQuery.of(context).size.width * .80,
              child: SearchBarRefactor(),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    "Custom Made Solutions",
                    style: TextStyle(
                        color: ColorConstant.kistlerTextBlack, fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "Find the solutions with us",
                  style: TextStyle(
                      color: ColorConstant.kistlerTextBlack, fontSize: 16),
                ),
                SizedBox(height: 10),
                TextfieldRefactor(name: "Company Name", length: 1),
                SizedBox(height: 10),
                TextfieldRefactor(name: "Contact Name", length: 1),
                SizedBox(height: 10),
                TextfieldRefactor(name: "Email Address", length: 1),
                SizedBox(height: 10),
                TextfieldRefactor(name: "Contact Number", length: 1),
                SizedBox(height: 10),
                TextfieldRefactor(name: "Country Name", length: 1),
                SizedBox(height: 10),
                TextfieldRefactor(name: "Product Name", length: 1),
                SizedBox(height: 10),
                TextfieldRefactor(name: "Description", length: 5),
                SizedBox(height: 25),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    onPressed: () {},
                    child: Text("Submit"),
                  ),
                ),
                SizedBox(height: 25),
                Text(
                  "To ensure optimum customer satisfaction, KISTLER goes above and beyond by providing not only an extensive range of standard equipment but also by offering customized automation solutions tailored to meet specific customer needs. Our commitment to delivering exceptional service extends beyond our wide portfolio of over 2000 standard machines for automated welding processes, including pipe rotators, welding positioners, and manipulators. We understand that every industry has unique requirements, and we strive to fulfill them comprehensively. This commitment drives us to provide the flexibility of designing and manufacturing machines that are specifically customized to match the precise needs of our customers. This approach ensures that our equipment perfectly aligns with the industry's demands and standards, enabling our customers to attain optimal results and success in their operations. With our expertise in automation and a dedicated team of professionals, we are capable of developing and manufacturing machines that address the intricate demands of various industries. We work closely with our customers, understanding their specific challenges, and engineering innovative solutions that enhance their productivity and efficiency. We continuously invest in research and development to stay at the forefront of technological advancements. This enables us to offer cutting-edge automation solutions that are reliable, efficient, and meet the highest industry standards. Our commitment to customer satisfaction drives us to continually improve our product range, ensuring that we can always fulfill the evolving needs of the industry. With KISTLER, you can rely on a trusted partner who understands your needs and delivers the right equipment to optimize your welding processes and achieve exceptional results.",
                  style: TextStyle(fontSize: 14, height: 2),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 25),
              ],
            ),
          ),
        )),
      ],
    );
  }
}
