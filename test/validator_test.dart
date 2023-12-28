import 'package:flutter_test/flutter_test.dart';
import 'package:test_learning/view-model/validator.dart';

void main() {
  group('Validating mail - ', () {
    test('validate for empty mail', () {
      //Arrange
      var mail = "";
      //Act
      var result = Validator.validateMail(mail);
      //Assert
      expect(result, "Required field");
    });
    test('validate for invalid mail', () {
      //Arrange
      var mail = "dskjcvbsdkc";
      //Act
      var result = Validator.validateMail(mail);
      //Assert
      expect(result, "Invalid mail");
    });
    test('validate for valid mail', () {
      //Arrange
      var mail = "test@gmail.com";
      //Act
      var result = Validator.validateMail(mail);
      //Assert
      expect(result, null);
    });
  });
  group('Validating password - ', () {
    test('validate for empty password', () {
      //Arrange
      var password = "";
      //Act
      var result = Validator.validatePassword(password);
      //Assert
      expect(result, "Required field");
    });
    test('validate for invalid password', () {
      //Arrange
      var password = "cioa6";
      //Act
      var result = Validator.validatePassword(password);
      //Assert
      expect(result, "Invalid password");
    });
    test('validate for valid password', () {
      //Arrange
      var password = "Test@123";
      //Act
      var result = Validator.validatePassword(password);
      //Assert
      expect(result, null);
    });
  });
}
