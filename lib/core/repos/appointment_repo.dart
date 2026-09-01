import '../../data/models/appointment_model/appointment_model.dart';
import '../api/api_url.dart';
import '../api/dio_client.dart';
import '../../features/book_appointment/widgets/payment_method.dart';

class AppointmentRepository {
  final DioClient dioClient;

  AppointmentRepository({
    required this.dioClient,
  });

  // ================= BOOK APPOINTMENT =================

  Future<AppointmentModel> bookAppointment({
    required int doctorId,
    required DateTime date,
    required String time,
    required String appointmentType,
    required PaymentSelection paymentSelection,
  }) async {
    final response = await dioClient.post(
      ApiUrl.appointmentStoreUrl,
      data: {
        'doctor_id': doctorId,
        'date': _formatDate(date),
        'time': time,
        'type': appointmentType,
        'payment_method': paymentSelection.method,
        if (paymentSelection.cardId != null)
          'card_id': paymentSelection.cardId,
      },
    );

    return AppointmentModel.fromJson(_unwrap(response.data));
  }

  // ================= FETCH APPOINTMENTS =================

  Future<List<AppointmentModel>> fetchAppointments() async {
    final response = await dioClient.get(ApiUrl.appointmentIndexUrl);
    final data = response.data;

    if (data is Map && data['data'] is List) {
      return (data['data'] as List)
          .map((e) => AppointmentModel.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    return const [];
  }


  Map<String, dynamic> _unwrap(dynamic data) {
    if (data is Map && data['data'] is Map) {
      return Map<String, dynamic>.from(data['data'] as Map);
    }
    return Map<String, dynamic>.from(data as Map);
  }

  String _formatDate(DateTime date) {
    final y = date.year.toString().padLeft(4, '0');
    final m = date.month.toString().padLeft(2, '0');
    final d = date.day.toString().padLeft(2, '0');
    return '$y-$m-$d';
  }
}