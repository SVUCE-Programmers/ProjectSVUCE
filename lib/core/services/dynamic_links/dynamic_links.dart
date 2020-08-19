import 'package:svuce_app/core/models/event/event.dart';

abstract class DynamicLinkService {
  Future<String> createEventLink(Event event);
  Future handleDynamicLinks();
}
