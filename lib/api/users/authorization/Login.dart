import 'dart:io';
import 'package:http/http.dart' show Response, get;
import 'package:OtoWave/api/ApiUrls.dart';

class Login {
  static final _url = ApiUrls.getUrl(ApiUrls.LOGIN);
  String _email;
  String _password;

  Login(this._email, this._password);

  Future<Map<String, dynamic>> login() async {
    try {
      _checkEmail();
      return await _sendRequest();
    }
    on FormatException catch (e) {
      return {'error': e.message};
    }
    on HttpException catch (e) {
      return {'error': e.message};
    }
    catch (e) {
      return {'error': 'An unknown error occurred: $e'};
    }
  }

  void _checkEmail() {
    if (!_email.contains('@')) {
      throw FormatException('Invalid email format');
    }
  }

  Future<Map<String, dynamic>> _sendRequest() async {
    var requestBody = {
      'email': _email,
      'password': _password,
    };
    return await _buildRequest(requestBody);
  }

  Future<Map<String, dynamic>> _buildRequest(Map<String, String> requestBody) async {
    var urlWithParams = Uri.parse('$_url?${_encodeQueryParameters(requestBody)}');
    var response = await get(urlWithParams, headers: {
      'Content-Type': 'application/json',
    });
    return _handleResponse(response);
  }

  String _encodeQueryParameters(Map<String, String> params) {
    return params.entries.map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}').join('&');
  }

  Map<String, dynamic> _handleResponse(Response response) {
    if (response.statusCode == 200)
      return _getResponseData(response);
    throw HttpException('Request failed with status: ${response.statusCode}, body: ${response.body}');
  }

  Map<String, dynamic> _getResponseData(Response response) {
    return response.body.isEmpty? {'error': 'Incorrect data'} : {'userID': response.body};
  }
}