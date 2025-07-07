//
// const authNotFound = '01_01';
// const authPassIncorrect = '01_02';
// const authAlreadyExist = '01_03';
// const authInvalidToken = '01_04';
// const authOldPassIncorrect = '01_05';
// const authExpiredCode = '01_06';
// const authInvalidCode = '01_07';
//
// const authBanned = '01_08';
// const authPhoneAlreadyExist = '01_09';
//
// const roleAlreadyExist = '01_10';
// const userNotExist = '01_11';
// const userSuspended = '01_12';
// const userNameExsist = '01_13';
//
// // subscriptions
// const invalidReceipt = '02_01';
// const userAlreadySubscribed = '02_02';
// const purchaseAlreadyUsed = '02_03';
// const notSubscribed = '02_05';
//

class ErrorEnum {
  static const authNotFound = '01_01';
  static const authPassIncorrect = '01_02';
  static const authAlreadyExist = '01_03';
  static const authInvalidToken = '01_04';
  static const authOldPassIncorrect = '01_05';
  static const authExpiredCode = '01_06';
  static const authInvalidCode = '01_07';
  static const authBanned = '01_08';
  static const authPhoneAlreadyExist = '01_09';
  static const roleAlreadyExist = '01_10';
  static const userNotExist = '01_11';
  static const userSuspended = '01_12';
  static const userNameExsist = '01_13';
  static const invalidReceipt = '02_01';
  static const userAlreadySubscribed = '02_02';
  static const purchaseAlreadyUsed = '02_03';
  static const notSubscribed = '02_05';

  static const unknown = '00_00';

  //string
  static const String network = 'network';
  static const String timeout = 'timeout';

  //array of all error codes
  static const List<String> errorCodes = [
    authNotFound,
    authPassIncorrect,
    authAlreadyExist,
    authInvalidToken,
    authOldPassIncorrect,
    authExpiredCode,
    authInvalidCode,
    authBanned,
    authPhoneAlreadyExist,
    roleAlreadyExist,
    userNotExist,
    userSuspended,
    userNameExsist,
    invalidReceipt,
    userAlreadySubscribed,
    purchaseAlreadyUsed,
    notSubscribed,
    unknown,
    network,
    timeout,
  ];
}
