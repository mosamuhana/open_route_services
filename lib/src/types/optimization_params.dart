import 'package:flutter/foundation.dart';

import '../utils/index.dart' show cleanMap;

class OptimizationParams {
  final List<OptimizationJob> jobs;
  final List<OptimizationVehicle> vehicles;
  final Map<String, dynamic>? options;
  final dynamic matrix;

  OptimizationParams({
    required this.jobs,
    required this.vehicles,
    this.options,
    this.matrix,
  });

  OptimizationParams copyWith({
    List<OptimizationJob>? jobs,
    List<OptimizationVehicle>? vehicles,
    Map<String, dynamic>? options,
    dynamic matrix,
  }) {
    return OptimizationParams(
      jobs: jobs ?? this.jobs,
      vehicles: vehicles ?? this.vehicles,
      options: options ?? this.options,
      matrix: matrix ?? this.matrix,
    );
  }

  Map<String, dynamic>? toMap() {
    return cleanMap({
      'jobs': jobs.map((x) => x.toMap()).toList(),
      'vehicles': vehicles.map((x) => x.toMap()).toList(),
      'options': options,
      'matrix': matrix,
    });
  }

  @override
  String toString() => 'OptimizationParams ('
      'jobs: $jobs, '
      'vehicles: $vehicles, '
      'options: $options'
      'matrix: $matrix'
      ')';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OptimizationParams &&
        listEquals(other.jobs, jobs) &&
        listEquals(other.vehicles, vehicles) &&
        other.options == options &&
        other.matrix == matrix;
  }

  @override
  int get hashCode => Object.hashAll([jobs, vehicles, options]);
}

class OptimizationJob {
  final int id;
  final int service;
  final List<int> amount;
  final List<double> location;
  final List<int> skills;
  final List<List<int>> timeWindows;

  OptimizationJob({
    required this.id,
    required this.service,
    required this.amount,
    required this.location,
    required this.skills,
    required this.timeWindows,
  });

  OptimizationJob copyWith({
    int? id,
    int? service,
    List<int>? amount,
    List<double>? location,
    List<int>? skills,
    List<List<int>>? timeWindows,
  }) {
    return OptimizationJob(
      id: id ?? this.id,
      service: service ?? this.service,
      amount: amount ?? this.amount,
      location: location ?? this.location,
      skills: skills ?? this.skills,
      timeWindows: timeWindows ?? this.timeWindows,
    );
  }

  Map<String, dynamic>? toMap() {
    return cleanMap({
      'id': id,
      'service': service,
      'amount': amount,
      'location': location,
      'skills': skills,
      'time_windows': timeWindows,
    });
  }

  @override
  String toString() => 'OptimizationJob ('
      'id: $id, '
      'service: $service, '
      'amount: $amount, '
      'location: $location, '
      'skills: $skills, '
      'timeWindows: $timeWindows'
      ')';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OptimizationJob &&
        other.id == id &&
        other.service == service &&
        listEquals(other.amount, amount) &&
        listEquals(other.location, location) &&
        listEquals(other.skills, skills) &&
        listEquals(other.timeWindows, timeWindows);
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        service,
        amount,
        location,
        skills,
        timeWindows,
      ]);
}

class OptimizationVehicle {
  final int id;
  final String profile;
  final List<double> start;
  final List<double> end;
  final List<int> capacity;
  final List<int> skills;
  final List<int> timeWindow;

  OptimizationVehicle({
    required this.id,
    required this.profile,
    required this.start,
    required this.end,
    required this.capacity,
    required this.skills,
    required this.timeWindow,
  });

  OptimizationVehicle copyWith({
    int? id,
    String? profile,
    List<double>? start,
    List<double>? end,
    List<int>? capacity,
    List<int>? skills,
    List<int>? timeWindow,
  }) {
    return OptimizationVehicle(
      id: id ?? this.id,
      profile: profile ?? this.profile,
      start: start ?? this.start,
      end: end ?? this.end,
      capacity: capacity ?? this.capacity,
      skills: skills ?? this.skills,
      timeWindow: timeWindow ?? this.timeWindow,
    );
  }

  Map<String, dynamic>? toMap() {
    return cleanMap({
      'id': id,
      'profile': profile,
      'start': start,
      'end': end,
      'capacity': capacity,
      'skills': skills,
      'time_window': timeWindow,
    });
  }

  @override
  String toString() => 'OptimizationVehicle ('
      'id: $id, '
      'profile: $profile, '
      'start: $start, '
      'end: $end, '
      'capacity: $capacity, '
      'skills: $skills, '
      'timeWindow: $timeWindow'
      ')';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OptimizationVehicle &&
        other.id == id &&
        other.profile == profile &&
        listEquals(other.start, start) &&
        listEquals(other.end, end) &&
        listEquals(other.capacity, capacity) &&
        listEquals(other.skills, skills) &&
        listEquals(other.timeWindow, timeWindow);
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        profile,
        start,
        end,
        capacity,
        skills,
        timeWindow,
      ]);
}
