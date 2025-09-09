import 'package:flutter/material.dart';

import 'image_carousel.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Skills & Interests',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 16),
              Text(
                "I enjoy leveraging my technical expertise and creative problem-solving skills to develop innovative solutions that address complex challenges. I thrive in collaborative, forward-thinking environments that encourage continuous learning and value impactful, user-centered development.",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      height: 1.5,
                    ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 16),
              Text(
                "My technical journey spans various disciplines, including mobile and web development, data analytics, CRM systems, and e-commerce solutions. I am proficient in tools and technologies such as C#, Flutter, React, SQL Server, Tableau, Firebase, and WordPress. Beyond coding, I have a flair for creative design with Adobe Photoshop and a keen eye for streamlining processes through automation and collaboration.",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      height: 1.5,
                    ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 16),
              Text(
                "Outside of work, I’m passionate about motorsports like Formula 1 and Football. I enjoy gaming with favorites like Fortnite and FC25. My adventurous side thrives in outdoor activities such as go-karting, archery, kayaking, Paintball, lazer tag, swimming, golf, and biking through scenic trails. Fitness is an integral part of my life, and I find fulfillment in gym sessions that keep me energized and focused.",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      height: 1.5,
                    ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 16),
              const ImageCarousel(),
            ],
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Experience',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 16),
              const _ExperienceItem(
                company: 'Smart Energy',
                role: 'Manager',
                duration: 'Abuja, Nigeria (Feb 2024 – Aug 2024)',
                descriptions: [
                  'Managed CNG installation projects from planning to post-installation support.',
                  'Streamlined routines, improving operational efficiency and customer satisfaction.'
                ],
              ),
              const SizedBox(height: 16),
              const _ExperienceItem(
                company: 'Soft Smart Business Solutions',
                role: 'Developer',
                duration: 'Abuja, Nigeria (Aug 2022 – Jan 2024)',
                descriptions: [
                  'Part of a team responsible for developing a Smart CRM application.',
                  'Lead Engineer in development of a real-time election analytics app for vote aggregation for Private Sector organizations.'
                ],
              ),
              const SizedBox(height: 16),
              const _ExperienceItem(
                company: 'Freelancer',
                role: 'Software Engineer',
                duration: 'Nigeria (Dec 2021 – Jun 2022)',
                descriptions: [
                  'Delivered e-commerce websites and mobile task management apps, achieving client satisfaction.',
                  'Developed an article management system for Nutrition Society of Nigeria, during their annual conference.'
                ],
              ),
              const SizedBox(height: 16),
              const _ExperienceItem(
                company: 'Da Kultuer Empire',
                role: 'Software Engineer',
                duration: 'Nigeria (Mar 2016 – Dec 2016)',
                descriptions: [
                  'Built a Customer Management System that improved customer satisfaction by 30%.',
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Education',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 16),
              const _EducationItem(
                institution: 'Ambrose Alli University, Ekpoma, Nigeria',
                degree: 'B.Des in Computer Science',
                awards: [
                  'Second Class Upper Division.',
                  "Dean's Recognition Award for representing the university at the FSI/NACOS hackathon in 2021.",
                  "Vice Chancellor's Commendation for achieving 1st runner-up in a national computer science hackathon."
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const _EducationItem(
                institution: 'Complete Computers & Technology',
                degree: 'Diploma in Software Engineering',
                awards: ['Second Class Upper Division.'],
              ),
              const SizedBox(
                height: 16,
              ),
              const _EducationItem(
                institution: 'Canterbury Christ Church University, UK',
                degree: 'Maaster of Science in Data Intelligence',
                awards: ['....Ongoing'],
              ),
              const SizedBox(
                height: 16,
              ),
              InkWell(
                onTap: () {},
                child: const Card(
                  color: Colors.black,
                  elevation: 1,
                  child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 22, vertical: 12),
                      child: Text(
                        'Resume',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ExperienceItem extends StatelessWidget {
  final String company;
  final String role;
  final String duration;
  final List<String> descriptions;

  const _ExperienceItem({
    required this.company,
    required this.role,
    required this.duration,
    required this.descriptions,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          company,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                //     fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
        ),
        Text(
          '$role • $duration',
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(
          height: 12,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: descriptions
              .map((description) => Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      description,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            height: 1.5,
                          ),
                    ),
                  ))
              .toList(),
        ),
      ],
    );
  }
}

class _EducationItem extends StatelessWidget {
  final String institution;
  final String degree;

  final List<String> awards;

  const _EducationItem({
    required this.institution,
    required this.degree,
    required this.awards,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          institution,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                //  fontSize: 14,
              ),
        ),
        Text(
          degree,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(
          height: 12,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: awards
              .map((award) => Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      award,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            //fontSize: 13,
                            // fontWeight: FontWeight.bold,
                            height: 1.5,
                          ),
                    ),
                  ))
              .toList(),
        ),
      ],
    );
  }
}
