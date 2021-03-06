import 'dart:convert';

import 'package:moviee/domain/entities/entities.dart';
import 'package:moviee/external/helpers/helpers.dart';
import 'package:moviee/infra/client/clients.dart';
import 'package:moviee/infra/datasources/datasources.dart';
import 'package:moviee/infra/helpers/helpers.dart';
import 'package:moviee/infra/models/models.dart';

class MovieDetailsDatasource implements IMovieDetailsDatasource {
  final IConnectionClient client;
  MovieDetailsDatasource(this.client);

  @override
  Future<MovieDetailsModel> getMovieDetails(MovieEntity movie) async {
    final response =
        await client.get(TMDBEndpoints.movieDetails(movie.id.toString()));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.data);
      final movieDetails = MovieDetailsModel.fromJson(json);
      return movieDetails;
    } else if (response.statusCode == 404) {
      throw UnexpectedException();
    } else {
      throw ServerException();
    }
  }
}
