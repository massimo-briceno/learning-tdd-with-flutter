import 'package:flutter_test/flutter_test.dart';
import 'package:test_learning/view-model/math_utils.dart';

void main() {
  group(
    'Math' 's utils - ',
    () {
      test(
        'Testing sum method of the math_utils_file',
        () {
          // Arrange
          var a = 10;
          var b = 8;

          // Act
          var sum = add(a, b);

          // Assert
          expect(sum, 18);
        },
      );
      test(
        'Testing subtract method of the math_utils.dart file',
        () {
          // Arrange
          var a = 12;
          var b = 8;

          // Act
          var difference = subtract(a, b);

          // Assert
          expect(difference, 4);
        },
      );

      test(
        'Testing multiply method of the math_utils.dart file',
        () {
          // Arrange
          var a = 3;
          var b = 7;

          // Act
          var difference = multiply(a, b);

          // Assert
          expect(difference, 21);
        },
      );
    },
  );
}
