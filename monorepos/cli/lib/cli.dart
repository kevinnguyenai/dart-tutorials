/*
 Copyright 2022 Google LLC

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

      https://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

import 'dart:io';

import 'package:github/github.dart';

import 'src/options.dart';
import 'src/formatter.dart';
import 'src/util.dart' as util;

export 'src/options.dart';

// Return the value of the `GITHUB_TOKEN` environment variable. This
// variable should contain a Github auth token. Auth token are used to
// avoid API rate-limiting
Authentication get authentication {
  var ghStatsToken = Platform.environment['GITHUB_TOKEN'];
  if (ghStatsToken == null) {
    return Authentication.anonymous();
  }
  return Authentication.withToken(ghStatsToken);
}

// Returns the activity for a given Github users, formatted using the
// provided [formatter].
class ActivityService {
  final String username;
  final bool verbose;
  final Interval interval;
  final EventFormatter formatter;
  static const _supportedEventTypes = ['PullRequestEvent', 'IssuesEvent'];

  ActivityService(this.username, this.verbose, this.interval,
      {this.formatter = const DefaultEventFormatter()});

  // Return a stream of formatted lines for printing to the console.
  Stream<String> getActivityStrings() async* {
    var stream = _fetchUserStatsImpl();

    try {
      await for (var s in stream) {
        yield s;
      }
    } catch (e) {
      throw GetActivityException(username, e);
    }
  }

  Stream<String> _fetchUserStatsImpl() async* {
    var client = GitHub(auth: authentication);
    var events = client.activity.listEventsPerformedByUser(username);

    await for (var event in events) {
      if (util.isTooOld(event.createdAt, interval)) {
        return;
      }

      if (_isSupported(event) || verbose) {
        yield formatter.format(event);
      }
    }
  }

  bool _isSupported(Event event) {
    return _supportedEventTypes.contains(event.type);
  }
}

// Thrown when this package fails to get the user's Activity
class GetActivityException implements Exception {
  final String username;
  final Object original;

  GetActivityException(this.username, this.original);

  @override
  String toString() => 'failed to fetch stats for user $username: $original';
}
