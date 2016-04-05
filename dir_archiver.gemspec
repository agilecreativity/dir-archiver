# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dir_archiver/version'
Gem::Specification.new do |spec|
  spec.name          = 'dir-archiver'
  spec.version       = DirArchiver::VERSION
  spec.authors       = ['Burin Choomnuan']
  spec.email         = ['agilecreativity@gmail.com']
  spec.summary       = %q{Archive multiple directories having a given depth from a given starting directory}
  spec.description   = %q(
    Archive all directories having the given depth from a given directory.
    TL;DR: dir-archiver --input-dir ~/projects --depth 2 --seperator "__" --output-dir ~/archives --commit
    ).gsub(/^\s+/, " ")
  spec.homepage      = 'https://github.com/agilecreativity/dir-archiver'
  spec.required_ruby_version = ">= 2.0.0"
  spec.license       = 'MIT'
  spec.files         = Dir.glob('{bin,lib,spec,test}/**/*') + %w(Gemfile
                                                                 Rakefile
                                                                 dir_archiver.gemspec
                                                                 README.md
                                                                 CHANGELOG.md
                                                                 LICENSE
                                                                 .rubocop.yml
                                                                 .gitignore)

  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'awesome_print', '~> 1.6'
  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'gem-ctags', '~> 1.0'
  spec.add_development_dependency 'guard', '~> 2.12'
  spec.add_development_dependency 'guard-minitest', '~> 2.4'
  spec.add_development_dependency 'minitest', '~> 5.6'
  spec.add_development_dependency 'minitest-spec-context', '~> 0.0'
  spec.add_development_dependency 'pry', '~> 0.10'
  spec.add_development_dependency 'pry-byebug', '~> 3.1'
  spec.add_development_dependency 'rake', '~> 10.4'
  spec.add_development_dependency 'rubocop', '~> 0.31'
  spec.add_development_dependency 'yard', '~> 0.8'
end
