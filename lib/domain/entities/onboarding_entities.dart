import 'package:flutter/material.dart';

import '../../utils/asset_helper.dart';

class OnboardingEntity  {
  final String image;
  final String title;
  final String description;

  OnboardingEntity({
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  List<Object?> get props => [image, title, description];
}

List<OnboardingEntity> mainOnboardings = [
  OnboardingEntity(
    image: AssetsHelper.onboardingImage1,
    title: 'Safe Bump',
    description:
    'Welcome to SafeBump, your trusted partner for a safe and healthy pregnancy journey.',
  ),
  OnboardingEntity(
    image: AssetsHelper.onboardingImage2,
    title: 'Tracking Tools',
    description:
    'The app will provide tracking tools to help users monitor their pregnancy and postpartum progress, including weight tracking, contraction timing, and breastfeeding tracker.',
  ),
  OnboardingEntity(
    image: AssetsHelper.onboardingImage3,
    title: 'Educational Resources',
    description:
    'The app will provide educational resources to help users learn about maternal health, including articles, videos, and podcasts.',
  ),
  OnboardingEntity(
    image: AssetsHelper.onboardingImage4,
    title: 'Community Support',
    description:
    'The app will provide a community support feature to help users connect with other users, share experiences, and receive support.',
  ),
];
