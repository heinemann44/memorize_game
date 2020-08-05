import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconUtils {
  static List<IconData> icons = [
    Icons.threesixty,
    Icons.threed_rotation,
    Icons.four_k,
    Icons.ac_unit,
    Icons.access_alarm,
    Icons.access_time,
    Icons.accessibility,
    Icons.accessible,
    Icons.accessible_forward,
    Icons.account_balance,
    Icons.account_balance_wallet,
    Icons.account_box,
    Icons.account_circle,
    Icons.adb,
    Icons.add,
    Icons.add_a_photo,
    Icons.add_alarm,
    Icons.add_alert,
    Icons.add_box,
    Icons.add_call,
    Icons.add_circle,
    Icons.add_circle_outline,
    Icons.add_comment,
    Icons.add_location,
    Icons.add_photo_alternate,
    Icons.add_shopping_cart,
    Icons.add_to_home_screen,
    Icons.add_to_photos,
    Icons.add_to_queue,
    Icons.adjust,
    Icons.airline_seat_flat,
    Icons.airline_seat_flat_angled,
    Icons.airline_seat_individual_suite,
    Icons.airline_seat_legroom_extra,
    Icons.airline_seat_recline_extra,
    Icons.airline_seat_recline_normal,
    Icons.airplanemode_active,
    Icons.airplanemode_inactive,
    Icons.airplay,
    Icons.airport_shuttle,
    Icons.alarm_add,
  ];

  // TODO - Find a smart way to do this, without a static list
  static List<IconData> getRandom({quantity = 1}) {
    Random random = Random();
    List<IconData> auxListIcon = List();
    auxListIcon.addAll(icons);
    List<IconData> resultListIcon = List();

    for(int i = 0; i < quantity; i ++){
      IconData icon = auxListIcon[random.nextInt(auxListIcon.length)];
      auxListIcon.removeWhere((aux) => aux.codePoint == icon.codePoint);
      resultListIcon.add(icon);
    }

    return resultListIcon;
  }
}
