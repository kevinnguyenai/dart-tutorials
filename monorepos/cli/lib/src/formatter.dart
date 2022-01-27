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
import 'package:intl/intl.dart';
import 'util.dart' as util;

// Format an [Event] for console output
abstract class EventFormatter {
  String format(Event event);
}

// Return a formatted string of the form `Friday, October 18 at 13:55 PM:
// <User> opened <URL>`.
class DefaultEventFormatter implements EventFormatter {
  static final dateFormat = DateFormat("EEEE, MMMM d 'at' HH:mm a");

  const DefaultEventFormatter();

  @override
  String format(Event event) {
    var date = dateFormat.format(event.createdAt!.toLocal());
    var type = event.type;
    var username = event.actor!.login;
    var url = util.getUrl(event);
    if (url == null) {
      return '$date: [$type]';
    }
    var action = util.getAction(event);

    return '$date: $username $action $url';
  }
}

class MarkdownEventFormatter implements EventFormatter {
  static final dateFormat = DateFormat('EEE, M/d/y');

  @override
  String format(Event event) {
    var date = dateFormat.format(event.createdAt!.toLocal());
    var type = event.type;
    var action = util.getAction(event);
    var url = util.getUrl(event);
    if (url == null) {
      return '- ($date): [$type]';
    }
    var title = util.getTitle(event);
    var repoName = event.repo!.name;
    var issueNumber = util.getIssueNumber(event);

    return '- ($date): $action "$title" ([$repoName/$issueNumber]($url))';
  }
}
