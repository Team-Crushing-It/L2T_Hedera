import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:l2t_hedera/progress/bloc/progress_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAF9F9),
      body: BlocBuilder<ProgressBloc, ProgressState>(
        builder: (context, state) {
          if (state is ProgressLoading) {
            return Center(
                child: CircularPercentIndicator(
              radius: 200.0,
              lineWidth: 5.0,
              percent: state.percentage / 10,
              center: Center(
                child: Text(
                  ((state.percentage / 10) * 100).toString(),
                  style: TextStyle(fontSize: 30.0),
                ),
              ),
              progressColor: Colors.green,
            ));
          } else if (state is ProgressLoaded) {
            return Center(
              child: Text(
                'Loaded',
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
            );
          }
          return Body();
        },
      ),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: ListView(
        children: [
          // Image.asset('assets/home_top.png'),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 12.0),
                child: Text(
                  'My Courses',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 40, right: 12.0),
                child: CustomAppButton(buttonText: 'Edit courses'),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 19.0),
                child: Text(
                  'Declarative UI',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 35.0),
                child: Text(
                  'See all(1)',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff34C2FF),
                  ),
                ),
              ),
            ],
          ),
          CustomDivider(),
          Column(
            children: <Widget>[
              CourseListTile(title: 'Functional Programming basics'),
              CourseListTile(
                  title: 'Functional Programming: Reducer Functions'),
              CourseListTile(
                  title: 'Functional Programming: Builder Functions'),
            ],
          ),
          SizedBox(height: 90),
          Container(
            height: 44,
            margin: EdgeInsets.only(left: 26, right: 31),
            color: Color(0xffECECEC),
            child: Row(
              children: <Widget>[
                SizedBox(width: 11),
                Icon(Icons.add_circle_outline),
                SizedBox(width: 10),
                Text(
                  'Add Another Course',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
          CustomDivider(),
          SizedBox(height: 38),
          Padding(
            padding: const EdgeInsets.only(left: 38.0),
            child: Text(
              'Resume Learning',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(height: 18),
          Row(
            children: [
              Container(
                height: 62,
                width: 104,
                child: FlutterLogo(),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Flutter: Getting started',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Google’s Cross-Platform UI Kit',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 38),
          CustomDivider(),
          SizedBox(height: 20),
          Text(
            'Ready for a real-life example? ',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 28),
          Padding(
            padding: const EdgeInsets.only(left: 58.0, right: 94),
            child: CustomAppButton(
              buttonText: 'Validate Now',
              buttonColor: const Color(0xffFFD700),
              textColor: const Color(0xff263156),
            ),
          ),
          SizedBox(height: 35),
          Container(
            height: 122,
            color: const Color(0xffFFD700),
            child: Center(
              child: Text(
                ''' Our mission is to make lifelong\n learners out of teachers and\n teachers out of students
                
Learn or Teach today !''',
                style: TextStyle(
                  color: const Color(0xff263156),
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 21.0, right: 31),
      child: Divider(thickness: 2.0),
    );
  }
}

class CourseListTile extends StatelessWidget {
  const CourseListTile({
    @required this.title,
    Key key,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(child: FlutterLogo()),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: CustomAppButton(buttonText: 'Start'),
      ),
    );
  }
}

class CustomAppButton extends StatelessWidget {
  const CustomAppButton({
    @required this.buttonText,
    this.buttonColor = const Color(0xff263156),
    this.textColor = Colors.white,
    Key key,
  }) : super(key: key);

  final String buttonText;
  final Color buttonColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
      onPressed: () => context.read<ProgressBloc>().add(ProgressStarted()),
      child: Text(
        buttonText,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      color: buttonColor,
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:l2t_hedera/progress/bloc/progress_bloc.dart';
// import 'package:percent_indicator/circular_percent_indicator.dart';

// class HomePage extends StatelessWidget {
//   AppBar buildHomeAppBar() {
//     return AppBar(
//       backgroundColor: Color(0xffFFD700),
//       leading: const Icon(Icons.menu, color: Colors.black),
//       titleSpacing: -5,
//       title: Row(
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8.0),
//             child: const Text(
//               'L2T',
//               style: TextStyle(
//                 color: Colors.black,
//                 fontWeight: FontWeight.w900,
//                 fontSize: 18,
//               ),
//             ),
//           ),
//           SizedBox(
//             width: 145,
//             height: 30,
//             child: TextField(
//               textAlignVertical: TextAlignVertical.center,
//               decoration: InputDecoration(
//                 fillColor: Colors.white,
//                 filled: true,
//                 suffixIcon: Icon(Icons.search),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.white),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.white),
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(width: 10),
//           SizedBox(width: 10),
//           CircleAvatar(child: Icon(Icons.person), radius: 15),
//           SizedBox(width: 10),
//           Icon(Icons.inbox, color: Colors.black),
//           SizedBox(width: 10),
//           Icon(Icons.emoji_events, color: Colors.black),
//           SizedBox(width: 10),
//           Icon(Icons.live_help, color: Colors.black),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Color(0xffFAF9F9),
//         appBar: buildHomeAppBar(),
//         body: BlocBuilder<ProgressBloc, ProgressState>(
//           builder: (context, state) {
//             if (state is ProgressLoading) {
//               return Center(
//                   child: CircularPercentIndicator(
//                 radius: 200.0,
//                 lineWidth: 5.0,
//                 percent: state.percentage / 10,
//                 center: Center(
//                   child: Text(
//                     ((state.percentage / 10) * 100).toString(),
//                     style: TextStyle(fontSize: 30.0),
//                   ),
//                 ),
//                 progressColor: Colors.green,
//               ));
//             } else if (state is ProgressLoaded) {
//               return Center(
//                 child: Text(
//                   'Loaded',
//                   style: TextStyle(
//                     fontSize: 30.0,
//                   ),
//                 ),
//               );
//             }
//             return Body();
//           },
//         ),
//       ),
//     );
//   }
// }

// class Body extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: [
//         Image.asset('assets/home_top.png'),
//         Row(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 40, left: 12.0),
//               child: Text(
//                 'My Courses',
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 textAlign: TextAlign.left,
//               ),
//             ),
//             Spacer(),
//             Padding(
//               padding: const EdgeInsets.only(top: 40, right: 12.0),
//               child: CustomAppButton(buttonText: 'Edit courses'),
//             ),
//           ],
//         ),
//         SizedBox(height: 20),
//         Row(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(left: 19.0),
//               child: Text(
//                 'Declarative UI',
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             Spacer(),
//             Padding(
//               padding: const EdgeInsets.only(right: 35.0),
//               child: Text(
//                 'See all(1)',
//                 style: TextStyle(
//                   fontSize: 12,
//                   fontWeight: FontWeight.bold,
//                   color: Color(0xff34C2FF),
//                 ),
//               ),
//             ),
//           ],
//         ),
//         CustomDivider(),
//         Column(
//           children: <Widget>[
//             CourseListTile(title: 'Functional Programming basics'),
//             CourseListTile(title: 'Functional Programming: Reducer Functions'),
//             CourseListTile(title: 'Functional Programming: Builder Functions'),
//           ],
//         ),
//         SizedBox(height: 90),
//         Container(
//           height: 44,
//           margin: EdgeInsets.only(left: 26, right: 31),
//           color: Color(0xffECECEC),
//           child: Row(
//             children: <Widget>[
//               SizedBox(width: 11),
//               Icon(Icons.add_circle_outline),
//               SizedBox(width: 10),
//               Text(
//                 'Add Another Course',
//                 style: TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         SizedBox(height: 24),
//         CustomDivider(),
//         SizedBox(height: 38),
//         Padding(
//           padding: const EdgeInsets.only(left: 38.0),
//           child: Text(
//             'Resume Learning',
//             style: TextStyle(
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//             ),
//             textAlign: TextAlign.left,
//           ),
//         ),
//         SizedBox(height: 18),
//         Row(
//           children: [
//             Container(
//               height: 62,
//               width: 104,
//               child: FlutterLogo(),
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Flutter: Getting started',
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Text(
//                   'Google’s Cross-Platform UI Kit',
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.grey,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//         SizedBox(height: 38),
//         CustomDivider(),
//         SizedBox(height: 20),
//         Text(
//           'Ready for a real-life example? ',
//           style: TextStyle(
//             fontSize: 24,
//             fontWeight: FontWeight.bold,
//           ),
//           textAlign: TextAlign.center,
//         ),
//         SizedBox(height: 28),
//         Padding(
//           padding: const EdgeInsets.only(left: 58.0, right: 94),
//           child: CustomAppButton(
//             buttonText: 'Validate Now',
//             buttonColor: const Color(0xffFFD700),
//             textColor: const Color(0xff263156),
//           ),
//         ),
//         SizedBox(height: 35),
//         Container(
//           height: 122,
//           color: const Color(0xffFFD700),
//           child: Center(
//             child: Text(
//               ''' Our mission is to make lifelong\n learners out of teachers and\n teachers out of students

// Learn or Teach today !''',
//               style: TextStyle(
//                 color: const Color(0xff263156),
//                 fontSize: 16,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class CustomDivider extends StatelessWidget {
//   const CustomDivider({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 21.0, right: 31),
//       child: Divider(thickness: 2.0),
//     );
//   }
// }

// class CourseListTile extends StatelessWidget {
//   const CourseListTile({
//     @required this.title,
//     Key key,
//   }) : super(key: key);

//   final String title;

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       leading: CircleAvatar(child: FlutterLogo()),
//       title: Text(
//         title,
//         style: TextStyle(
//           fontSize: 14,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       trailing: Padding(
//         padding: const EdgeInsets.only(right: 10.0),
//         child: CustomAppButton(buttonText: 'Start'),
//       ),
//     );
//   }
// }

// class CustomAppButton extends StatelessWidget {
//   const CustomAppButton({
//     @required this.buttonText,
//     this.buttonColor = const Color(0xff263156),
//     this.textColor = Colors.white,
//     Key key,
//   }) : super(key: key);

//   final String buttonText;
//   final Color buttonColor;
//   final Color textColor;

//   @override
//   Widget build(BuildContext context) {
//     return FlatButton(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(6.0),
//       ),
//       onPressed: () => context.read<ProgressBloc>().add(ProgressStarted()),
//       child: Text(
//         buttonText,
//         style: TextStyle(
//           color: textColor,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       color: buttonColor,
//     );
//   }
// }
