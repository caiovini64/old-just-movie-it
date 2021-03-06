import 'package:equatable/equatable.dart';
import 'package:moviee/domain/entities/genres_entity.dart';

class MovieDetailsEntity extends Equatable {
  final int id;
  final String title;
  final posterPath;
  final backdropPath;
  final List<GenresEntity> genres;
  final String description;

  MovieDetailsEntity({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.backdropPath,
    required this.genres,
    required this.description,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [id, title, posterPath, backdropPath, genres];
}
