import '../../../../../../../../base/define/resource/resource.base.dart';

class CourseDetailResource extends Resource {
  const CourseDetailResource(String courseId)
      : super('/course/$courseId', description: 'Chi tiết khóa học');
}
