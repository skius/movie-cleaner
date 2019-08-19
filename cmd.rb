# frozen_string_literal: true

require 'optparse'
require 'ostruct'

require_relative 'lib/movie_cleaner'

options = OpenStruct.new
OptionParser.new do |opt|
  opt.on('-v') { |o| options.verbose = o }
  opt.on('-d', '--directory DIRECTORY',
         'The base path for all movie files') { |o| options.base_path = o }
  opt.on('-r', '--resolutions 1080p,720p', Array,
         'The wanted resolutions in order (Default: 1080p,720p') { |o| options.resolutions = o }
end.parse!

movie_cleaner = MovieCleaner.new(options.base_path, options.verbose, options.resolutions)
puts movie_cleaner.sub_par_files
movie_cleaner.print_rm_commands
