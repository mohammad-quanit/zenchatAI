import 'dart:io';
import 'package:dart_frog/dart_frog.dart';

Response onRequest(RequestContext ctx) {
  if (ctx.request.method != HttpMethod.get) {
    return Response(
      statusCode: HttpStatus.methodNotAllowed,
      body: 'Only get req are allowed',
    );
  }

  return _get(ctx);
}

Response _get(ctx) {
  return Response(body: 'Chat ID:');
}
