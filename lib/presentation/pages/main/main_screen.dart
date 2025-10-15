import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/infrastructure/apis/apis.dart';
import 'package:rick_and_morty/infrastructure/repository/rick_morty_repository.dart';
import 'package:rick_and_morty/presentation/component/c_appbar.dart';
import 'package:rick_and_morty/presentation/styles/theme.dart';
import 'package:rick_and_morty/presentation/styles/theme_wrapper.dart';
import 'package:rick_and_morty/domain/models/rick_morty_models.dart';

import 'package:rick_and_morty/infrastructure/services/local_database/db_service.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late RickMortyRepository _repository;
  CharactersResponse? _charactersResponse;
  LocationsResponse? _locationsResponse;
  EpisodesResponse? _episodesResponse;
  bool _isLoading = false;
  String _errorMessage = '';
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeRepository();
  }

  Future<void> _initializeRepository() async {
    try {
      final dbService = await DBService.create;
      _repository = RickMortyRepository(RickMortyService.create(dbService));
      setState(() {
        _isInitialized = true;
      });
      _loadInitialData();
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to initialize database: $e';
        _isLoading = false;
      });
    }
  }

  Future<void> _loadInitialData() async {
    if (!_isInitialized) return;

    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    try {
      // Load characters
      final charactersResult = await _repository.getCharacters(page: 1);
      charactersResult.fold(
        (failure) {
          setState(() {
            _errorMessage = failure.message;
          });
        },
        (characters) {
          setState(() {
            _charactersResponse = characters;
          });
        },
      );

      // Load locations
      final locationsResult = await _repository.getLocations(page: 1);
      locationsResult.fold(
        (failure) {
          if (_errorMessage.isEmpty) {
            setState(() {
              _errorMessage = failure.message;
            });
          }
        },
        (locations) {
          setState(() {
            _locationsResponse = locations;
          });
        },
      );

      // Load episodes
      final episodesResult = await _repository.getEpisodes(page: 1);
      episodesResult.fold(
        (failure) {
          if (_errorMessage.isEmpty) {
            setState(() {
              _errorMessage = failure.message;
            });
          }
        },
        (episodes) {
          setState(() {
            _episodesResponse = episodes;
          });
        },
      );
    } catch (e) {
      setState(() {
        _errorMessage = 'Unexpected error: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Widget _buildInfoCard(String title, String value) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Row(
          children: [
            Text(
              '$title: ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
            ),
            Expanded(child: Text(value, style: TextStyle(fontSize: 14.sp))),
          ],
        ),
      ),
    );
  }

  Widget _buildCharacterCard(Character character) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: Image.network(
                character.image,
                width: 60.w,
                height: 60.w,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 60.w,
                    height: 60.w,
                    color: Colors.grey[300],
                    child: Icon(Icons.person, size: 30.w),
                  );
                },
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    character.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    '${character.status} • ${character.species}',
                    style: TextStyle(fontSize: 12.sp, color: Colors.grey[600]),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    'Gender: ${character.gender}',
                    style: TextStyle(fontSize: 12.sp),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    'Origin: ${character.origin.name}',
                    style: TextStyle(fontSize: 12.sp),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationCard(Location location) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              location.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
            ),
            SizedBox(height: 4.h),
            Text('Type: ${location.type}', style: TextStyle(fontSize: 12.sp)),
            SizedBox(height: 2.h),
            Text(
              'Dimension: ${location.dimension}',
              style: TextStyle(fontSize: 12.sp),
            ),
            SizedBox(height: 2.h),
            Text(
              'Residents: ${location.residents.length}',
              style: TextStyle(fontSize: 12.sp),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEpisodeCard(Episode episode) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              episode.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
            ),
            SizedBox(height: 4.h),
            Text(
              episode.episode,
              style: TextStyle(fontSize: 14.sp, color: Colors.blue[700]),
            ),
            SizedBox(height: 2.h),
            Text(
              'Air Date: ${episode.airDate}',
              style: TextStyle(fontSize: 12.sp),
            ),
            SizedBox(height: 2.h),
            Text(
              'Characters: ${episode.characters.length}',
              style: TextStyle(fontSize: 12.sp),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return Scaffold(
          backgroundColor: colors.backgroundColor,
          body: Column(
            children: [
              CAppBar(
                title: "Rick And Morty",
                centerTitle: true,
                isBack: false,
                trailing: icons.search.svg(color: colors.primary900),
              ),
              Expanded(
                child:
                    !_isInitialized
                        ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircularProgressIndicator(
                                color: colors.primary900,
                              ),
                              SizedBox(height: 16.h),
                              Text(
                                'Initializing...',
                                style: TextStyle(fontSize: 16.sp),
                              ),
                            ],
                          ),
                        )
                        : _isLoading
                        ? Center(
                          child: CircularProgressIndicator(
                            color: colors.primary900,
                          ),
                        )
                        : _errorMessage.isNotEmpty
                        ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.error_outline,
                                size: 50.w,
                                color: Colors.red,
                              ),
                              SizedBox(height: 16.h),
                              Text(
                                _errorMessage,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.red,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 16.h),
                              ElevatedButton(
                                onPressed: _loadInitialData,
                                child: Text('Retry'),
                              ),
                            ],
                          ),
                        )
                        : SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // API Info Section
                              if (_charactersResponse != null)
                                Padding(
                                  padding: EdgeInsets.all(16.w),
                                  child: Text(
                                    'API Information',
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              if (_charactersResponse != null)
                                _buildInfoCard(
                                  'Total Characters',
                                  _charactersResponse!.info.count.toString(),
                                ),
                              if (_charactersResponse != null)
                                _buildInfoCard(
                                  'Total Pages',
                                  _charactersResponse!.info.pages.toString(),
                                ),
                              if (_locationsResponse != null)
                                _buildInfoCard(
                                  'Total Locations',
                                  _locationsResponse!.info.count.toString(),
                                ),
                              if (_episodesResponse != null)
                                _buildInfoCard(
                                  'Total Episodes',
                                  _episodesResponse!.info.count.toString(),
                                ),

                              // Characters Section
                              if (_charactersResponse != null &&
                                  _charactersResponse!.results.isNotEmpty)
                                Padding(
                                  padding: EdgeInsets.all(16.w),
                                  child: Text(
                                    'Characters (${_charactersResponse!.results.length})',
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              if (_charactersResponse != null)
                                ..._charactersResponse!.results
                                    .take(5)
                                    .map(_buildCharacterCard)
                                    .toList(),

                              // Locations Section
                              if (_locationsResponse != null &&
                                  _locationsResponse!.results.isNotEmpty)
                                Padding(
                                  padding: EdgeInsets.all(16.w),
                                  child: Text(
                                    'Locations (${_locationsResponse!.results.length})',
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              if (_locationsResponse != null)
                                ..._locationsResponse!.results
                                    .take(3)
                                    .map(_buildLocationCard)
                                    .toList(),

                              // Episodes Section
                              if (_episodesResponse != null &&
                                  _episodesResponse!.results.isNotEmpty)
                                Padding(
                                  padding: EdgeInsets.all(16.w),
                                  child: Text(
                                    'Episodes (${_episodesResponse!.results.length})',
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              if (_episodesResponse != null)
                                ..._episodesResponse!.results
                                    .take(3)
                                    .map(_buildEpisodeCard)
                                    .toList(),

                              SizedBox(height: 20.h),
                            ],
                          ),
                        ),
              ),
            ],
          ),
          floatingActionButton:
              _isInitialized
                  ? FloatingActionButton(
                    onPressed: _loadInitialData,
                    child: Icon(Icons.refresh),
                    backgroundColor: colors.primary900,
                  )
                  : null,
        );
      },
    );
  }
}
