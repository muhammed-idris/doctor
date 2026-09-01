
class AppointmentModel {
  final int id;
  final int doctorId;
  final DateTime date;
  final String time;
  final String appointmentType;
  final String status;
  final String paymentMethod;
  final double total;

  const AppointmentModel({
    required this.id,
    required this.doctorId,
    required this.date,
    required this.time,
    required this.appointmentType,
    required this.status,
    required this.paymentMethod,
    required this.total,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      id: json['id'] as int,
      doctorId: json['doctor_id'] as int,
      date: DateTime.parse(json['date'] as String),
      time: json['time'] as String,
      appointmentType: json['type'] as String,
      status: json['status'] as String? ?? 'pending',
      paymentMethod: json['payment_method'] as String? ?? '',
      total: (json['total'] as num?)?.toDouble() ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'doctor_id': doctorId,
      'date': _formatDate(date),
      'time': time,
      'type': appointmentType,
      'status': status,
      'payment_method': paymentMethod,
      'total': total,
    };
  }

  static String _formatDate(DateTime date) {
    final y = date.year.toString().padLeft(4, '0');
    final m = date.month.toString().padLeft(2, '0');
    final d = date.day.toString().padLeft(2, '0');
    return '$y-$m-$d';
  }
}