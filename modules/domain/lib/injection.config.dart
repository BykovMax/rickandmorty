// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:domain/src/get_character_use_case.dart' as _i3;
import 'package:domain/src/mark_favourite_use_case.dart' as _i4;
import 'package:domain/src/mark_un_favourite_use_case.dart' as _i5;
import 'package:domain/src/search_characters_use_case.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.GetCharacterUseCase>(() => _i3.GetCharacterUseCase());
    gh.factory<_i4.MarkFavouriteUseCase>(() => _i4.MarkFavouriteUseCase());
    gh.factory<_i5.MarkUnFavouriteUseCase>(() => _i5.MarkUnFavouriteUseCase());
    gh.factory<_i6.SearchCharactersUseCase>(
        () => _i6.SearchCharactersUseCase());
    return this;
  }
}
