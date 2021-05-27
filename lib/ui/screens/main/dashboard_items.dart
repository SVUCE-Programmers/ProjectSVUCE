import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/ui/screens/Club%20Pages/select_clubs/select_clubs_view.dart';
import 'package:svuce_app/ui/screens/calender_events/events_view.dart';
import 'package:svuce_app/ui/screens/feed/feed_view.dart';
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
    onTap: () => _navigationService.navigateWithTransition(StaffView(),
        transition: "rightToLeftWithFade"),
    icon: facultyIcon,
    name: "Faculty",
  ),
  SpotlightItem(
    onTap: () => _navigationService.navigateWithTransition(FeedView(),
        transition: "rightToLeftWithFade"),
    icon: feedIcon,
    name: "Feed",
  ),
  SpotlightItem(
    icon: hallOfFameIcon,
    name: "Hall of Fame",
  ),
  SpotlightItem(
    onTap: () => _navigationService.navigateWithTransition(CalenderEventsView(),
        transition: "rightToLeftWithFade"),
    icon: eventsIcon,
    name: "Event Calendar",
  ),
  SpotlightItem(
    icon: campusIcon,
    name: "Campus",
  ),
];
