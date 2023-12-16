import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Social media links
    String leetCodeLink = 'https://leetcode.com/vashudev';
    String linkedInLink =
        'https://www.linkedin.com/in/shivanshu-parashar-50498a221/';
    String hackerrankLink = 'https://www.hackerrank.com/profile/vashudev8777';
    String githubLink = 'https://github.com/TheTagEnd';
    // Project data
    List<ProjectData> projects = [
      ProjectData(
        title: 'Amazon Clone',
        subtitle: 'Amazon clone with admin panel',
        link: 'https://project1link.com',
      ),
      ProjectData(
        title: 'Keyword Classification',
        subtitle: 'Keyword-Classification-using-nlp-based-on-pos-tags',
        link: 'https://project2link.com',
      ),
      ProjectData(
        title: 'R Airbnb',
        subtitle: 'Airbnb-data-Analysis-with--Regression-Model',
        link: 'https://project3link.com',
      ),
      ProjectData(
        title: 'Online Compiler',
        subtitle: 'Compiler For Python , c , c++',
        link: 'https://project4link.com',
      ),
      ProjectData(
        title: 'Online Compiler',
        subtitle: 'Compiler For Python , c , c++',
        link: 'https://project4link.com',
      ),
    ];
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.05),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(180.0),
                        child: Image.network(
                          'https://media.licdn.com/dms/image/D4D03AQF67ImWPq-wbw/profile-displayphoto-shrink_800_800/0/1696079445165?e=1707955200&v=beta&t=CptBBqk6_30S3n1DaozAA_C6Gss14nLVnsamWEGsDZQ',
                          width: screenWidth * 0.2,
                          height: screenWidth * 0.2,
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.05),
                      SizedBox(
                        width: screenWidth * 0.6,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  fontSize: screenHeight * 0.025,
                                  color: Colors.black,
                                  height: 1.5,
                                ),
                                children: [
                                  TextSpan(
                                    text:
                                        'Hello! 👋 I\'m Shivanshu Parashar, a tech enthusiast in my third year of B.Tech in Computer Science at Lovely Professional University. Currently, I\'m diving into the world of data with IBM\'s Data Science Professional Certificate, and I express my creativity through mobile and web development as a Flutter and React developer.\n\n',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                    text:
                                        'But \'s not all—I\'ve got a love affair with mobile and web development. As a Flutter developer, I dance with widgets, and as a React developer, I orchestrate user interfaces that leave a lasting impression.',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  TextSpan(
                                    text:
                                        'Whether it\'s deciphering data mysteries or crafting user interfaces, I thrive on challenges. Join me in this journey of turning ideas into reality, one line of code at a time. 🚀✨\n\n',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  TextSpan(
                                    text:
                                        '#CodeArtisan #DataExplorer #TechAdventurer',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildSvgIcon('assets/linkedin.svg', linkedInLink),
                    const SizedBox(width: 55),
                    _buildSvgIcon('assets/leetcode.svg', leetCodeLink),
                    const SizedBox(width: 55),
                    _buildSvgIcon('assets/github.svg', githubLink),
                    const SizedBox(width: 55),
                    _buildSvgIcon('assets/hackerrank.svg', hackerrankLink),
                  ],
                ),
                const Divider(
                  height: 30,
                  thickness: 2,
                  color: Color.fromARGB(255, 11, 10, 10),
                ),

                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Personal Projects',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                // Remove SizedBox around GridView.builder
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        screenWidth > 600 ? 3 : 2, // Adjust this value
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                  ),
                  itemCount: projects.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () async {
                        if (await canLaunchUrl(
                            Uri.parse(projects[index].link))) {
                          await launchUrl(Uri.parse(projects[index].link));
                        } else {
                          throw 'Could not launch ${projects[index].link}';
                        }
                      },
                      child: Card(
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                projects[index].title,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                projects[index].subtitle,
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSvgIcon(String svgAsset, String link) {
    return Column(
      children: [
        GestureDetector(
          onTap: () async {
            if (await canLaunch(link)) {
              await launch(link);
            } else {
              throw 'Could not launch $link';
            }
          },
          child: SvgPicture.asset(
            svgAsset,
            width: 50,
            height: 50,
          ),
        ),
        SizedBox(height: 8),
      ],
    );
  }
}

class ProjectData {
  final String title;
  final String subtitle;
  final String link;

  ProjectData({
    required this.title,
    required this.subtitle,
    required this.link,
  });
}
