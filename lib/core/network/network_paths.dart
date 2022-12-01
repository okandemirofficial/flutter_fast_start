// ignore_for_file: public_member_api_docs

const String api = 'https://api.myapi.com';

enum NetworkPaths {
  getUserById(
    url: '$api/user/getById',
    method: HttpMethod.get,
    shouldAuthorized: true,
  ),
  login(
    url: '$api/User/Login',
    method: HttpMethod.post,
    shouldAuthorized: false,
  );

  const NetworkPaths({
    required this.url,
    required this.method,
    required this.shouldAuthorized,
  });

  final String url;
  final HttpMethod method;
  final bool shouldAuthorized;
  //final Function? returnType;
  //final ApiItem apiItem;

}

enum HttpMethod {
  get('GET'),
  post('POST'),
  put('PUT'),
  delete('DELETE');

  const HttpMethod(this.val);

  final String val;
}
