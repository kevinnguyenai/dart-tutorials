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
import 'package:build_cli_annotations/build_cli_annotations.dart';

part 'options.g.dart';

ArgParser get parser => _$populateOptionsParser(ArgParser(usageLineLength: 80));

// The command line options for this app
@CliOptions()
class Options {
  @CliOption(abbr: 'u', help: 'Required. The github user')
  final String? user;

  @CliOption(
    abbr: 'i',
    help: 'The time interval to filter events.',
    allowed: ['day', 'week', 'month'],
    defaultsTo: Interval.week,
  )
  Interval interval;

  @CliOption(abbr: 'v', defaultsTo: false, help: 'Print addtional event types')
  final bool? verbose;

  @CliOption(
    abbr: 'f',
    help: 'The format to display. Befaults to '
        '"Friday, October 18 at 13:55 PM: <User> opend <URL>"',
    allowed: ['default', 'mardown'],
  )
  final String? format;

  @CliOption(abbr: 'h', negatable: false, help: 'Prints usage information.')
  final bool help;

  Options(this.user, this.interval, this.verbose, this.format, this.help);
}

enum Interval {
  day,
  week,
  month,
}
