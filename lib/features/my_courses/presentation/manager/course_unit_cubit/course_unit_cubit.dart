import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'course_unit_state.dart';

class CourseUnitCubit extends Cubit<CourseUnitState> {
  CourseUnitCubit() : super(CourseUnitInitial());
}
