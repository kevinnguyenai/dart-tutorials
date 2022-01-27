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

import 'package:github/github.dart';

import 'options.dart';

String? getAction(Event event) {
  return event.payload!['action'];
}

String? getUrl(Event event) {
  var type = event.type;

  if (type == 'PullRequestEvent') {
    return event.payload!['pull_request']['html_url'];
  }

  if (type == 'IssuesEvent') {
    return event.payload!['issue']['html_url'];
  }

  return null;
}

String? getTitle(Event event) {
  var type = event.type;

  if (type == 'PullRequestEvent') {
    return event.payload!['pull_request']['title'];
  }

  if (type == 'IssuesEvent') {
    return event.payload!['issue']['title'];
  }

  return null;
}

int? getIssueNumber(Event event) {
  var type = event.type;

  if (type == 'PullRequestEvent') {
    return event.payload!['pull_request']['number'];
  }

  if (type == 'IssuesEvent') {
    return event.payload!['issue']['number'];
  }

  return null;
}

bool isTooOld(DateTime? date, Interval interval) {
  var now = DateTime.now();
  switch (interval) {
    case Interval.day:
      return date!.isBefore(now.subtract(Duration(days: 1)));
    case Interval.week:
      return date!.isBefore(now.subtract(Duration(days: 7)));
    case Interval.month:
      return date!.isBefore(now.subtract(Duration(days: 30)));
    default:
      return true;
  }
}
