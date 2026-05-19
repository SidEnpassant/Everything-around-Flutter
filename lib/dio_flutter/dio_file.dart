// features of the http package
// Lightweight : simple API package for GET , POST , PUT , DELETE requests

// EXAMPLE:

// import 'package:http/http.dart' as http;
//
// Future<void> fetchData() async{
//   final response = await http.get(Uri.parse('API ENDPOINT'));
//   if(response.statusCode == 200){
//     print(response.body);
//   }else{
//     print('FAILED');
//   }
// }
// LIMITATIONS:
// LACKS ADVANCED FEATURES LIKE REQUEST CANCELLATION , INTERCEPTORS , OR FILE UPLOAD WITH PROGRESS
// MANUAL Effort required for tasks like retries , timeouts , and handling cookies






// DIO
// Features of the DIO Package
// Advanced Features
// Built-in support for interceptors, request cancellation , timeout , and file uploads.
// highly customizable.
// Example Usage

import 'package:dio/dio.dart';
final dio = Dio();

Future<void> fetchData() async{
  try{
    final response = await dio.get('Api endpoint');
    print(response.data);
  }on DioExceptionType catch(e){
    print('Error: ${e}');
  }
}


// WHY CHOOSE DIO over HTTP?
// INTERCEPTORS:
// Automatically add headers or modify requests/responses.
// Example:

exampleFunction() async{
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler){
        options.headers['Authorization'] = 'Bearer token';
        return handler.next(options);
      },
      onResponse: (response , handler){
        print('Response: ${response.data}');
        return handler.next(response);
      },
      onError: (DioException e , handler){
        print('Error: ${e.message}');
        return handler.next(e);
      }
    )
  );
}

// Request Cancellation:
// Useful for scenarios like search , where previous requests need to be canceled when new intervene
// Example:

example() async{
  CancelToken cancelToken = CancelToken();
  dio.get('Api Endpoint', cancelToken: cancelToken);

  // cancel the request
  cancelToken.cancel('Request Cancelled');
}

// File Uploads with Progress:
// Direct support for multipart/form-data.
// Example:

exampleFileUpload() async{
  FormData formData = FormData.fromMap({
    'file': await MultipartFile.fromFile('./test.txt' , filename: 'test.txt'),
  });
  dio.post(
      'Api endpoint',
    data: formData,
    onSendProgress: (sent, total){
        print('Progress: ${(sent/total * 100).toStringAsFixed(0)}%');
    }
  );
}


// Timeout configuration:
// Separate settings for connection , read , and send timeouts.
// Example:

setOptions()async{
  dio.options.connectTimeout = Duration(seconds: 5);
  dio.options.receiveTimeout = Duration(seconds: 3);
}



// Better error handling:
// Categorized errors (DioExceptionType) with detailed information.
// Example:

exampleApiCall() async{
  try{
    await dio.get('Api endpoint');
  }on DioExceptionType catch (e){
    if(e.runtimeType == DioExceptionType.connectionTimeout){
      print('Connection timeout');
    }else if(e.runtimeType == DioExceptionType.badResponse){
      print('Response Error : ${e}');
    }
  }
}

// WHY TO USE DIO?:
// Complex apps
// Global headers or interceptors/
// Token management for authentication
// File uploads or downloads
// Retry mechanisms and cancellation support
// Detailed error categorization
