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
import 'package:cli/cli.dart';
import 'package:cli/src/formatter.dart';

void main(List<String> args) {
  var options = parseOptions(args);

  if (options.help) {
    _printUsage();
    return;
  }

  if (options.user?.isEmpty ?? true) {
    _printUsage();
    return;
  }

  var fetcher = ActivityService(
      options.user!, options.verbose!, options.interval,
      formatter: _getFormatter(options));

  // Stream the github activity to the console
  fetcher.getActivityStrings().listen((s) {
    print(s);
  })
    ..onDone(() => exit(0))
    ..onError((e) => print('Unable to fetch stats:\n$e'));
}

/// Gets the correct [Formatter] defined by [Options]
EventFormatter _getFormatter(Options options) {
  if (options.format == 'markdown') {
    return MarkdownEventFormatter();
  }
  return DefaultEventFormatter();
}

void _printUsage() {
  print('''
A command line utility for fetching a Github user's recent activity.

Usage: cli [<args>]

Arguments:
${parser.usage}
  ''');
}
