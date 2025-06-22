class ApiConstants {
  static const String apiBaseUrl = "https://carenest-serverside.vercel.app/";
  static const String login = "auth/login";
  static const String signUp = "auth/signup";
  static const String forgetPassword = "auth/forgetpass";
  static const String verifyPassword = "auth/verifycode";
  static const String resetPassword = "auth/resetpassword";
  static const String verifyAccount = "auth/verifyEmailUser";
  static const String addNewBaby = "babies";
  static const String getAllBabies = "babies/allBabiesOfLoggedUser";
  static const String deleteBaby = "babies/{id}";
  static const String updateBaby = "babies/{id}";
  static const String getAllMedicationSchedule =
      "babies/medicationSchedule/all/{id}";
  static const String addMedicationSchedule =
      'babies/medicationSchedule/{babyId}';
  static const String updateMedicationSchedule =
      'babies/medicationSchedule/{id}/{scheduleId}';
  static const String updateFcmToken = "users/updateFcmToken";
  static const String deleteMedicationSchedule =
      'babies/medicationSchedule/{id}/{scheduleId}';
  static const String getAllBabiesMedicationSchedule =
      "babies/medicationSchedule/allBabiesMedications";
  static const String getAllNotifications = "user/notifications/all";
  static const String deleteAllNotifications = "user/notifications/all";
  static const String deleteNotification = "user/notifications/{id}";
  static const String getBabyVaccines = "babies/vaccines/forBaby/{id}";
  static const String markVaccine =
      "babies/vaccines/{babyId}/administered/{id}";
  static const String getHeightGrowth = "dataGrowth/height/{babyid}";
  static const String getWeightGrowth = "dataGrowth/weight/{babyid}";
  static const String putGrowthData = "dataGrowth/{id}";
  static const String latestGrowthData = "dataGrowth/LatestGrowthData/{id}";
  static const String getAllTipsOfBaby = "tips/?target=Baby&limit=40";
  static const String getAllTipsOfMom = "tips/?target=Mama&limit=10";
  static const String getTipDetails = "tips/{id}";
  static const String getMusic = "relaxSounds/?category=Music";

  static const String getWhiteNoise =
      "relaxSounds/?category=White Noise&limit=15";

  static const String getAllStories = "stories/?limit=26";
  static const String getAllChannels = "channels/?limit=26";
  static const String getAllDoctors = "doctor/near";
  static const String getAllHospitals = "doctor/hospital";
  static const String postPrediction =
      "https://pythonai.codepeak.software/predict";
  static const String bookDoctor = "appointments";
  static const String bookedAppointments = "appointments/orders";
  static const String cancelbookedAppointment = "appointments/{id}";
  static const String createReview = "doctor/{doctorId}/reviews";
  static const String updateUser = "users/updateMe";
  static const String getCommunityMessages = "community";
  static const String createMessage = "community";
  static const String deleteCommunityMessage = 'community/{id}';
  static const String getCommunityOnlineUsers = "community/chat-users";
   static const String createReport = "feedback";
  static const String updateReport = "feedback/{id}";
  static const String updatePassword = "users/updateUserPassword";
  static const String getFeedbacks = "feedback";
  
}

class ApiErrors {
  static const String badRequestError = "Bad Request Error";
  static const String noContent = "No Content";
  static const String forbiddenError = "Forbidden Error";
  static const String authenticationError = "Authentication Error";
  static const String notFoundError = "Not Found Error";
  static const String conflictError = "Conflict Error";
  static const String internalServerError = "Internal Server Error";
  static const String unknownError = "Unknown Error";
  static const String timeoutError = "Timeout Error";
  static const String defaultError = "Default Error";
  static const String cacheError = "Cache Error";
  static const String noInternetError = "No Internet Error";
  static const String loadingMessage = "Loading_Message";
  static const String retryAgainMessage = "Retry_Again_ Message";
  static const String unauthorizedError = "Unauthorized Error";
  static const String ok = "OK";
}
