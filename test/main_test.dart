import 'package:easy_mask/src/magic_mask.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  test('Brazilian Cellphone', () {
    final baseMask = ['\\+99? (99) 99999 - 9999?'];
    final basetest = '5519981234567';
    MagicMask mm = MagicMask(baseMask, false, '', 0);
    var result = mm.executeMasking(basetest, 3, -1);
    print(result);
    expect(result['text'], '+55 (19) 98123 - 4567');
    expect(result['selectionBase'], 6);
  });

  test('Brazilian Personal Document', () {
    final baseMask = ['999.999.999-99'];
    final basetest = '123123HUM12344';
    MagicMask mm = MagicMask(baseMask, false, '', 0);
    var result = mm.executeMasking(basetest, 4, -1);
    print(result);
    expect(result['text'], '123.123.123-44');
    expect(result['selectionBase'], 5);
  });

  test('USA Celphone', () {
    final baseMask = ['\\+1 (999) 999 99 99'];
    final basetest = '446667AAAAAA8899';
    MagicMask mm = MagicMask(baseMask, false, '', 0);
    var result = mm.executeMasking(basetest, 4, -1);
    print(result);
    expect(result['text'], '+1 (446) 667 88 99');
    expect(result['selectionBase'], 10);
  });

  test('Credit Card', () {
    final baseMask = ['9999 9999 9999 9999'];
    final basetest = '1234555@#566667878';
    MagicMask mm = MagicMask(baseMask, false, '', 0);
    var result = mm.executeMasking(basetest, 4, -1);
    print(result);
    expect(result['text'], '1234 5555 6666 7878');
    expect(result['selectionBase'], 4);
  });

  test('Reversed Money without thousand separator comma', () {
    final baseMask = ['\$! !9+.99'];
    final basetest = '1025065';
    MagicMask mm = MagicMask(baseMask, true, '', 0);
    var result = mm.executeMasking(basetest, 7, -1);
    print(result);
    expect(result['text'], '\$ 10250.65');
    expect(result['selectionBase'], 10);
  });

  test('Reversed Money with thousand separator comma', () {
    final baseMask = ['\$! !9+,999.99'];
    final basetest = '1025065A';
    MagicMask mm = MagicMask(baseMask, true, '', 0);
    var result = mm.executeMasking(basetest, 7, -1);
    print(result);
    expect(result['text'], '\$ 10,250.65');
    expect(result['selectionBase'], 11);
  });

  test('Custom Masks', () {
    final baseMask = ['99 AA 999'];
    final basetest = '33xyz.@999';
    MagicMask mm = MagicMask(baseMask, false, '', 0);
    var result = mm.executeMasking(basetest, 7, -1);
    print(result);
    expect(result['text'], '33 xy 999');
    expect(result['selectionBase'], 5);
  });

  test('Simple text', () {
    final text = '432516565';
    MagicMask mask = MagicMask(['\\+99 (99) 99999-9999']);
    var res = mask.getMaskedString(text);
    print(res);
  });
}
