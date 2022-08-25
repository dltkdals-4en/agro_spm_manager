import 'package:gsheets/gsheets.dart';

class AgrodoctorApiConfig {
  static const _credentials = r'''{
  "type": "service_account",
  "project_id": "agrodoctor-358507",
  "private_key_id": "c15670cdb800c894cf79146cf9750eeb850371a6",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCYR/4W4usb7jKL\nf0WyVMpyU8kl5d9kMQ9KU4+dvXLdDF9ruupbXaXEgcd77c03By3XR+N6jlfjorAD\nDWMOpUQmrJ+7wMjAY2HUH+oXsuHcPkCrz1uqgqokdBNfzJxT4KcA6yp/0RHuHPGX\nIlPB7AHeu1EZHejuv+gRt2mrH+yMZqy7lXgjJCNvB6JiJ1Se0YtsUoeN2b8Gp2u9\nF5xpQ2HB9lbaLwcO3BtdDMArSxF0i837Dl0QkjneNJLxP2yVXEjuMmtPAXbjL28J\ndh7RqOcwTrep4O4AYohDiPMT3Uop6SwI6/1ZDqEg/Lhinq9HX2Wcr4ytPpq+gHoU\n4q5gul4BAgMBAAECggEADU10r9Eg0q7LMY5rqzlm+ffBwZLEIf97I3YLPK9ZAmBb\nUZDhehvDKFhh8byDScRRx9Wa1JDsspD6qTmZJqVfP7WiuocLwmqsGBi1nV5eBpxV\nj+ysSEfjzw1ox9ya52Tfkd/5NXMxCsjyfc5c3LreKvPYEMahG4IeJrYMAAvo4RbQ\njmkzZeFs9PqSFLOB8aqFbWSWPCE8RtjnfNj+Lb7zUDvkE3MhyCVj5M40puTN7C1x\nuqAcP4/0E/z5DWrJCSdXtVFtvzzTl94/lo1HE80ZAbZEzVem+gtXjdPUoZ5AUPhT\n5NNiIOjCMUtuGWv69dv4xX1jqRMiJ/qimEIegrHIBQKBgQDH5AiVleENa968CrHa\nESSEiBB3DTs7wfXSHDmvree/qev+Y4UGsmhvWeGM9yCsgoWaFrmw41Ha9JEyqanK\ne6Rr/FQGJHRJWLlX6ZJu2UjR2Sn4q07aFLrvUQwZXay+/lqSC7I0lfSiv/wcZZu8\nwlnHEOu5kH8dYHv5mVsiv+Rz2wKBgQDDBsgNkKsaYF6OdlTaDzKidoYjm+AA9jVz\n/QzUr65mby7dY7HzVhguTndgOn6xRtWZtR4f30HoPROFu/zoQ0mN8k9M8epI1NTS\nzqVqE0lgSw7P6h1xnUw3MKuxRKkZ8F5nUaMuqDtv0kkIKdBEUAlNdHXsIfG9h6hc\nZr/PBhrKUwKBgQCv83H6+itX/RPawi87nMtgPcUAho0VVO5lPKMqmRHeDFzHWCLI\nelKjcaKwyvff4iRoNojNw8tRyOXmiqICskNRKpNrtLsHtSmw0NEs8ea/kUD4uxJ1\ntLm33sefrG1a0do3pEQBNd5ZRFVPScGEri8Io0Rb222JFl0KoIswU2ls8QKBgF1g\n2tp74SDw8XU+vSPnUPQu0c0s7hUnzbIqgEE5mMRdCdBg0qxTFaLeWRQPDegtpUpC\nSRkzmWfsDnPi7ZX72bUIRuXtkqKqnPgOj275qxFa/s2YJ97lVL+8IwjuehT8XQcV\nNI+7ZzIEOomZE6oRtFKMp4WXPxrjYD5VyBMEtkEXAoGAVeRqLV2iCbzFydHWsrSu\nFRoKuqSZHHDLvffU1LM2KOuvmclHgcKgb9ywEnoirMZVtdR8uq7fyhaYyvwUpatx\nWBzUSvnrIMn1zXVWf3CEs2hUqTVwEmroSDmRC9VgNAHvg2xMSHjZHcON2IJlyTzg\nY621SX+Kdfs7nNYTBZ8Y2e8=\n-----END PRIVATE KEY-----\n",
  "client_email": "agrodoctor-manager@agrodoctor-358507.iam.gserviceaccount.com",
  "client_id": "100151742733601940826",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/agrodoctor-manager%40agrodoctor-358507.iam.gserviceaccount.com"
}''';
  static final AgrodoctorGSheets = GSheets(_credentials);
  static final String gsheetsId =
      "1zHQ2lB68SSL49Ch_wiasz4CjPEDgwNm8OnCwmyTCgYY";
}
