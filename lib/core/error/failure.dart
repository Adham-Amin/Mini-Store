import 'package:dio/dio.dart';

abstract class Failure {
  final String message;
  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('انتهت مهلة الاتصال بالخادم');

      case DioExceptionType.sendTimeout:
        return ServerFailure('انتهت مهلة إرسال البيانات');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('انتهت مهلة استقبال البيانات');

      case DioExceptionType.badCertificate:
        return ServerFailure('هناك مشكلة في شهادة الأمان الخاصة بالخادم');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          e.response?.statusCode ?? 0,
          e.response?.data,
        );

      case DioExceptionType.cancel:
        return ServerFailure('تم إلغاء الطلب');

      case DioExceptionType.connectionError:
        return ServerFailure('لا يوجد اتصال بالإنترنت');

      case DioExceptionType.unknown:
        return ServerFailure('حدث خطأ غير متوقع، حاول مرة أخرى');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 404) {
      return ServerFailure('الطلب غير موجود، حاول لاحقًا');
    } else if (statusCode == 500) {
      return ServerFailure('حدثت مشكلة في الخادم، حاول لاحقًا');
    } else if (statusCode == 400) {
      return ServerFailure('طلب غير صالح');
    } else if (statusCode == 401) {
      return ServerFailure('غير مصرح لك بالوصول');
    } else if (statusCode == 403) {
      return ServerFailure('تم رفض الوصول');
    } else {
      return ServerFailure('حدث خطأ ما، حاول مرة أخرى');
    }
  }
}
