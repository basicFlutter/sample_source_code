import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';



class ObjectDetectEntity extends Equatable{
  final Rect boundingRect ;
  const ObjectDetectEntity({required this.boundingRect});

  @override
  // TODO: implement props
  List<Object?> get props => [boundingRect];
}