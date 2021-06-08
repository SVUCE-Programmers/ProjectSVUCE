import 'dart:io';

import 'internet_connection.dart';

class AddressCheckOptions {
  /// [AddressCheckOptions] Constructor
  AddressCheckOptions(
    this.address, {
    this.port = InternetConnectionChecker.DEFAULT_PORT,
    this.timeout = InternetConnectionChecker.DEFAULT_TIMEOUT,
  });

  /// An internet address or a Unix domain address.
  /// This object holds an internet address. If this internet address
  /// is the result of a DNS lookup, the address also holds the hostname
  /// used to make the lookup.
  /// An Internet address combined with a port number represents an
  /// endpoint to which a socket can connect or a listening socket can
  /// bind.
  final InternetAddress address;

  /// Port
  final int port;

  /// Timeout Duration
  final Duration timeout;

  @override
  String toString() => 'AddressCheckOptions($address, $port, $timeout)';
}

class AddressCheckResult {
  /// [AddressCheckResult] constructor
  AddressCheckResult(
    this.options,
    this.isSuccess,
  );

  /// AddressCheckOptions
  final AddressCheckOptions options;

  /// bool val to store result
  final bool isSuccess;

  @override
  String toString() => 'AddressCheckResult($options, $isSuccess)';
}
