class ApiUrl {
  static const String baseUrl = "https://vcare.integration25.com/api/";

  // ---------------- Auth Module ----------------
  static const String registerUrl = "${baseUrl}auth/register";

  static const String loginUrl = "${baseUrl}auth/login";

  static const String logoutUrl = "${baseUrl}auth/logout";

  // ---------------- User Module ----------------
  static const String userProfileUrl = "${baseUrl}user/profile";

  static const String updateProfileUrl = "${baseUrl}user/update";

  // ---------------- Home Module ----------------
  static const String homeIndexUrl = "${baseUrl}home/index";

  // ---------------- Governorate Module ----------------
  static const String governorateIndexUrl = "${baseUrl}governrate/index";

  // ---------------- City Module ----------------
  static const String cityIndexUrl = "${baseUrl}city/index";

  static String cityShowUrl(int govId) => "${baseUrl}city/show/$govId";

  // ---------------- Specialization Module ----------------
  static const String specializationIndexUrl = "${baseUrl}specialization/index";

  static String specializationShowUrl(int id) =>
      "${baseUrl}specialization/show/$id";

  // ---------------- Doctor Module ----------------
  static const String doctorIndexUrl = "${baseUrl}doctor/index";

  static String doctorShowUrl(int id) => "${baseUrl}doctor/show/$id";

  static const String doctorFilterUrl = "${baseUrl}doctor/doctor-filter";

  static const String doctorSearchUrl = "${baseUrl}doctor/doctor-search";

  // ---------------- Appointment Module ----------------
  static const String appointmentIndexUrl = "${baseUrl}appointment/index";

  static const String appointmentStoreUrl = "${baseUrl}appointment/store";
}
