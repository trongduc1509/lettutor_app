import '../../../../../../../../base/define/resource/resource.base.dart';

class TeacherDetailResource extends Resource {
  const TeacherDetailResource(String teacherId)
      : super('/tutor/$teacherId', description: 'Thông tin chi tiết giáo viên');
}
