import 'package:flutter_icons/flutter_icons.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/ui/screens/Club%20Pages/select_clubs/select_clubs_view.dart';
import 'package:svuce_app/ui/screens/calender_events/events_view.dart';
import 'package:svuce_app/ui/screens/feed/feed_view.dart';
import 'package:svuce_app/ui/screens/library%20screens/library_screen_view.dart';
import 'package:svuce_app/ui/screens/staff/staff_view.dart';
import 'package:svuce_app/ui/widgets/gridmenu_item.dart';

final NavigationService _navigationService = locator<NavigationService>();
final List<SpotlightItem> spotLightItems = [
  SpotlightItem(
    onTap: () => _navigationService.navigateWithTransition(
        SelectClubsView(
          isSelectClubs: false,
        ),
        transition: "rightToLeftWithFade"),
    icon: clubsIcon,
    name: "Explore Clubs",
  ),
  SpotlightItem(
    onTap: () => _navigationService.navigateWithTransition(LibraryScreen(),
        duration: Duration(seconds: 01), transition: "rightToLeftWithFade"),
    icon: FlutterIcons.library_mco,
    name: "Library",
  ),
  SpotlightItem(
    onTap: () => _navigationService.navigateWithTransition(StaffView(),
        duration: Duration(seconds: 01), transition: "rightToLeftWithFade"),
    icon: facultyIcon,
    name: "Faculty",
  ),
  SpotlightItem(
    onTap: () => _navigationService.navigateWithTransition(FeedView(),
        duration: Duration(seconds: 01), transition: "rightToLeftWithFade"),
    icon: feedIcon,
    name: "Feed",
  ),
  SpotlightItem(
    icon: hallOfFameIcon,
    name: "Hall of Fame",
  ),
  SpotlightItem(
    onTap: () => _navigationService.navigateWithTransition(CalenderEventsView(),
        duration: Duration(seconds: 01), transition: "rightToLeftWithFade"),
    icon: eventsIcon,
    name: "Event Calendar",
  ),
];
