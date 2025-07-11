import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem(
      {required this.title,
      required this.subTitle,
      required this.link,
      required this.icon});
}

const appMenuItems = [
  MenuItem(
      title: 'Counter',
      subTitle: 'counter',
      link: '/counter',
      icon: Icons.add_circle_outline),
  MenuItem(
      title: 'Theme Changer',
      subTitle: 'changer colors',
      link: '/theme-changer',
      icon: Icons.color_lens),
  MenuItem(
      title: 'Botones',
      subTitle: 'Varios botones flutter',
      link: '/buttons',
      icon: Icons.smart_button_outlined),
  MenuItem(
      title: 'Tarjetas',
      subTitle: 'Contenedores personalizados',
      link: '/cards',
      icon: Icons.credit_card),
  MenuItem(
      title: 'Progress Indicator',
      subTitle: 'Barras de progreso',
      link: '/progress',
      icon: Icons.refresh_outlined),
  MenuItem(
      title: 'Snackbar',
      subTitle: 'Snackbar',
      link: '/snackbars',
      icon: Icons.info_outline),
  MenuItem(
      title: 'Animated Container',
      subTitle: 'Animated',
      link: '/animated',
      icon: Icons.check_box_outline_blank_rounded),
  MenuItem(
      title: 'UI Controls',
      subTitle: 'UI Controls Screen',
      link: '/ui-controls',
      icon: Icons.car_rental_outlined),
  MenuItem(
      title: 'Tutorial',
      subTitle: 'App tutorial',
      link: '/tutorial',
      icon: Icons.tune_outlined),
  MenuItem(
      title: 'InfiniteScroll y pull',
      subTitle: 'Infinity',
      link: '/infinite',
      icon: Icons.list_alt_outlined),
];
