import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

import 'main.dart';

class MyEncryptionDecryption {

  //for AES encryption/decryption

  static final key = encrypt.Key.fromUtf8(key_tec.text);
  static final iv = encrypt.IV.fromLength(16);
  static final encrypter = encrypt.Encrypter(encrypt.AES(key));

  static encryptAES(text){
    final encrypted = encrypter.encrypt(text, iv: iv);

    print(encrypted.bytes);
    print(encrypted.base16);
    print(encrypted.base64);

    return encrypted;
  }
  static decryptaES(text){
    final decrypted = encrypter.decrypt(text, iv: iv);
    return decrypted;
  }

  //For Fernet  Encryption/Decryption

  static final keyFernet = encrypt.Key.fromUtf8(key_tec.text); //"myflutternmbhjumlkjhnbgyuimndfer"
  static final fernet = encrypt.Fernet(keyFernet);
  static final encrypterFernet = encrypt.Encrypter(fernet);

  static encryptFernet(text){
    final encrypted = encrypterFernet.encrypt(text);
    return encrypted;
  }

  static decryptFernet(text){
    final decrypted = encrypterFernet.decrypt(text);

    return decrypted;
  }

  //For Salso20 Algorithm encrytion/Decryption

  static final keySalsa20 = encrypt.Key.fromUtf8(key_tec.text);
  static final ivSalsa20 = encrypt.IV.fromLength(8);
  static final encrypterSalsa20 = encrypt.Encrypter(encrypt.Salsa20(keySalsa20));

  static encryptSalsa20(text){
    final encrypted = encrypterSalsa20.encrypt(text, iv: ivSalsa20);
    return encrypted;
  }

  static decryptSalsa20(text){
    final decrypted = encrypterSalsa20.decrypt(text, iv: ivSalsa20);
    return decrypted;
  }

  //SHA1 Function

  static GetSHA1(text){
    var data = utf8.encode(text); // data being hashed
    var hashvalue = sha1.convert(data);

    var plaintext = hashvalue.toString();
    return plaintext;
  }

  static GetSHA256(text){
    var key = utf8.encode('p@ssw0rd');
    var bytes = utf8.encode(text);

    var hmacSha256 = Hmac(sha256, key); // HMAC-SHA256
    var digest = hmacSha256.convert(bytes);
    var plaintext = digest.toString();
    return plaintext;
  }

  static GetSHA384(text){
    var dataToHash = text;

    var bytesToHash = utf8.encode(dataToHash);
    var sha384Digest = sha384.convert(bytesToHash);

    var plaintext = sha384Digest.toString();
    return plaintext;
  }

  static GetSHA512(text){
    var dataToHash = text;
    var bytesToHash = utf8.encode(dataToHash);
    var sha512Digest = sha512.convert(bytesToHash);

    var plaintext = sha512Digest.toString();
    return plaintext;
  }

  static GetMD5(text){
    var dataToHash = text;

    var bytesToHash = utf8.encode(dataToHash);
    var md5Digest = md5.convert(bytesToHash);
    var plaintext = md5Digest.toString();
    return plaintext;
  }


}