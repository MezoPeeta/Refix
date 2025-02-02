import 'package:dashboard/src/core/navigation/auth.dart';
import 'package:dashboard/src/core/theme/colors.dart';
import 'package:dashboard/src/core/theme/radii.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'widgets/header_text.dart';

final currentIndexProvider = StateProvider<int>((ref) => 0);

class Navbar extends ConsumerWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(currentIndexProvider);
    final currentUser = ref.watch(getCurrentUserProvider).value;
    return Expanded(
        child: CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: AppColors.secondaryRefix,
                alignment: Alignment.center,
                height: 160,
                child: SvgPicture.asset("assets/img/logo.svg"),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: HeaderText(
                      text: "Home",
                    ),
                  ),
                  NavMenu(
                    onTap: () {
                      ref.read(currentIndexProvider.notifier).state = 0;
                    },
                    text: "Dashboard",
                    svgPath: "assets/img/navbar/dashboard.svg",
                    isSelected: currentIndex == 0,
                  ),
                  ExpansionMenu(
                    title: "Users",
                    svgPath: "assets/img/navbar/users.svg",
                    children: [
                      InkWell(
                        onTap: () {
                          ref.read(currentIndexProvider.notifier).state = 1;
                        },
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(AppRadii.md)),
                          leading: CircleAvatar(
                            radius: 5,
                            backgroundColor: currentIndex == 1
                                ? AppColors.primaryRefix
                                : AppColors.neutralRefix,
                          ),
                          title: Text(
                            "Clients",
                            style: TextStyle(
                                color: currentIndex == 1
                                    ? AppColors.primaryRefix
                                    : null),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          ref.read(currentIndexProvider.notifier).state = 2;
                        },
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 5,
                            backgroundColor: currentIndex == 2
                                ? AppColors.primaryRefix
                                : AppColors.neutralRefix,
                          ),
                          title: const Text("Workers"),
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: HeaderText(
                      text: "Pages",
                    ),
                  ),
                  ExpansionMenu(
                    title: "Content",
                    svgPath: "assets/img/navbar/content.svg",
                    children: [
                      InkWell(
                        onTap: () {
                          ref.read(currentIndexProvider.notifier).state = 4;
                        },
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 5,
                            backgroundColor: currentIndex == 4
                                ? AppColors.primaryRefix
                                : AppColors.neutralRefix,
                          ),
                          title: const Text("onetime screen"),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          ref.read(currentIndexProvider.notifier).state = 6;
                        },
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 5,
                            backgroundColor: currentIndex == 6
                                ? AppColors.primaryRefix
                                : AppColors.neutralRefix,
                          ),
                          title: const Text("discount"),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          ref.read(currentIndexProvider.notifier).state = 7;
                        },
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 5,
                            backgroundColor: currentIndex == 7
                                ? AppColors.primaryRefix
                                : AppColors.neutralRefix,
                          ),
                          title: const Text("Ads photo"),
                        ),
                      ),
                    ],
                  ),
                  NavMenu(
                    text: "Points",
                    svgPath: "assets/img/navbar/points.svg",
                    isSelected: currentIndex == 9 || currentIndex == 10,
                    onTap: () {
                      ref.read(currentIndexProvider.notifier).state = 9;
                    },
                  ),
                  ExpansionMenu(
                    title: "Booking",
                    svgPath: "assets/img/navbar/booking.svg",
                    children: [
                      InkWell(
                        onTap: () {
                          ref.read(currentIndexProvider.notifier).state = 11;
                        },
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 5,
                            backgroundColor: currentIndex == 11
                                ? AppColors.primaryRefix
                                : AppColors.neutralRefix,
                          ),
                          title: const Text("all Booking"),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          ref.read(currentIndexProvider.notifier).state = 13;
                        },
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 5,
                            backgroundColor: currentIndex == 13
                                ? AppColors.primaryRefix
                                : AppColors.neutralRefix,
                          ),
                          title: const Text("Booking Confirmation"),
                        ),
                      ),
                    ],
                  ),
                  ExpansionMenu(
                    title: "Rate & Support",
                    svgPath: "assets/img/navbar/support.svg",
                    children: [
                      InkWell(
                        onTap: () {
                          ref.read(currentIndexProvider.notifier).state = 15;
                        },
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 5,
                            backgroundColor: currentIndex == 15
                                ? AppColors.primaryRefix
                                : AppColors.neutralRefix,
                          ),
                          title: const Text("Rates"),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          ref.read(currentIndexProvider.notifier).state = 16;
                        },
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 5,
                            backgroundColor: currentIndex == 16
                                ? AppColors.primaryRefix
                                : AppColors.neutralRefix,
                          ),
                          title: const Text("Reports"),
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: HeaderText(
                      text: "Adminstration",
                    ),
                  ),
                  NavMenu(
                    text: "Services",
                    svgPath: "assets/img/navbar/services.svg",
                    isSelected: currentIndex == 18,
                    onTap: () {
                      ref.read(currentIndexProvider.notifier).state = 18;
                    },
                  ),
                  NavMenu(
                    isSelected: currentIndex == 21,
                    text: "Notifications",
                    onTap: () {
                      ref.read(currentIndexProvider.notifier).state = 21;
                    },
                    svgPath: "assets/img/navbar/notification.svg",
                  ),
                  NavMenu(
                    isSelected: currentIndex == 19,
                    text: "Permissions",
                    onTap: () {
                      ref.read(currentIndexProvider.notifier).state = 19;
                    },
                    svgPath: "assets/img/navbar/permissions.svg",
                  ),
                  NavMenu(
                    isSelected: currentIndex == 20,
                    text: "Roles",
                    onTap: () {
                      ref.read(currentIndexProvider.notifier).state = 20;
                    },
                    svgPath: "assets/img/navbar/permissions.svg",
                  ),
                ],
              ),
              const Spacer(),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HeaderText(text: currentUser?.username ?? ""),
                        Text(
                          currentUser?.role.name ?? "",
                          style: const TextStyle(
                              fontSize: AppTextSize.one,
                              color: AppColors.neutralRefix),
                        )
                      ],
                    ),
                    TextButton(
                        onPressed: () {
                          ref.read(authProvider).logout();
                        },
                        child: const Text(
                          "Log Out",
                          style: TextStyle(
                              color: AppColors.errorRefix,
                              fontSize: AppTextSize.two,
                              fontWeight: FontWeight.w500),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    ));
  }
}

class ExpansionMenu extends StatelessWidget {
  const ExpansionMenu(
      {super.key,
      required this.title,
      required this.svgPath,
      required this.children});

  final String title, svgPath;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ExpansionTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          leading: SvgPicture.asset(svgPath),
          title: HeaderText(text: title),
          children: children),
    );
  }
}

class NavMenu extends StatelessWidget {
  const NavMenu({
    super.key,
    required this.text,
    required this.svgPath,
    this.isSelected = false,
    required this.onTap,
  });
  final String text, svgPath;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        onTap: onTap,
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: ListTile(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppRadii.md)),
            tileColor: isSelected ? AppColors.primaryRefix : null,
            leading: SvgPicture.asset(svgPath,
                colorFilter: isSelected
                    ? const ColorFilter.mode(Colors.white, BlendMode.srcIn)
                    : null),
            title: Text(
              text,
              style: TextStyle(
                  color: isSelected ? Colors.white : null,
                  fontSize: AppTextSize.three,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}
