[![Build Status](https://semaphoreci.com/api/v1/skius/movie-cleaner/branches/develop/badge.svg)](https://semaphoreci.com/skius/movie-cleaner)  
# MovieCleaner
Removes media files where there already is a higher resolution ([RubyGems](https://rubygems.org/gems/movie_cleaner))

## Prerequisites

* ruby
* A movie library with sub-folders per movie containing different quality files of the movie
* Movie files must have the resolution in the filename (e.g. `It (2017) - 1080p.mkv`)

## Installation

    $ gem install movie_cleaner

## Usage

```
$ movie_cleaner [options]
```

| option | description | example |
|-|-| - |
|`-v`| verbose - omitting this results in a completely `\| bash`-able output of `rm` commands. | |
|`-d,--directory DIRECTORY`| Directory which contains all other movie folders | `-d /home/user/media/movies` |
|`-r,--resolutions res1,res2`| Comma-separated list of resolutions in order of priority | `-r 1080p,720p` |

## Example

Run `movie_cleaner` for `/home/user/Media/Movies` with 2160p being the highest quality we want and 720p being the lowest.
`-v` means we run it in verbose mode.

```
$ movie_cleaner -d /home/user/Media/Movies -v -r 2160p,1080p,720p
Found sub-par files for movie 'Movie 1 (2018)':
rm '/home/user/Media/Movies/Movie 1 (2018)/Movie 1 (2018) WEBDL-720p.mkv'

Found sub-par files for movie 'Movie 2 (2018)':
rm '/home/user/Media/Movies/Movie 2 (2018)/Movie 2 (2018) WEBDL-720p.mkv'

Found sub-par files for movie 'Movie 3 (2017)':
rm '/home/user/Media/Movies/Movie 3 (2017)/Movie 3 (2017) Bluray-1080p.mkv'
```

Do the same, but in non-verbose mode. Output to `rm.sh`, chmod and execute to remove:

```
$ movie_cleaner -d /home/user/Media/Movies -r 2160p,1080p,720p > rm.sh
rm '/home/user/Media/Movies/Movie 1 (2018)/Movie 1 (2018) WEBDL-720p.mkv'
rm '/home/user/Media/Movies/Movie 2 (2018)/Movie 2 (2018) WEBDL-720p.mkv'
rm '/home/user/Media/Movies/Movie 3 (2017)/Movie 3 (2017) Bluray-1080p.mkv'
$ chmod +x rm.sh
$ ./rm.sh
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/skius/movie_cleaner.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
