## Directory Archiver (dir-archiver)

Archive directory having the given depth from a given directory.
TL;DR: `dir-archiver --input-dir ~/projects --depth 2 --sep "__" -output-dir ~/archives --commit`

[![Gem Version](https://badge.fury.io/rb/dir-archiver.svg)][gem]
[![Dependency Status](https://gemnasium.com/agilecreativity/dir-archiver.png)][gemnasium]

[gem]: http://badge.fury.io/rb/dir-archiver
[gemnasium]: https://gemnasium.com/agilecreativity/dir-archiver

### Installation

```sh
# Install the gem
gem install dir-archiver

# refresh your gem just in case
rbenv rehash

# Get list of options just type the name of the gem
github_archiver
```

You should see something like

```
Usage: dir-archiver [options]

Specific options:
    -i, --input-dir INPUT_DIR        where INPUT_DIR is starting directory
                                     If not specified, current directory will be used
    -d, --depth NUMBER               where NUMBER is depth of the directory from the starting directory
                                     If not specified, 1 will be used
    -s, --seperator [SEP]            The seperator string to be used
                                     If not specified, '__' will be used
    -o, --output-dir OUTPUT_DIR      where OUTPUT_DIR is output directory
                                     If not specified, current directory will be used
    -c, --[no-]commit                Commit your action
                                     default to --no-commit e.g. dry-run only

Common options:
    -h, --help                       Show this message

 Example Usage:

 a) archive all immediate directories from the given directory (default to 1 level)

 $cd ~/inputs/projects
 $dir-archiver --commit

 b) archive all directory 2 level depth (dry-run)

 $dir-archiver -i ~/inputs/projects -d 2 -s '__' -o ~/outputs/archives

 c) archive all directory 2 level depth (commit action)

 $dir-archiver -i ~/inputs/projects -d 2 -s '__' -o ~/outputs/archives
```

### Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

[Thor]: https://github.com/erikhuda/thor
[Minitest]: https://github.com/seattlerb/minitest
[RSpec]: https://github.com/rspec
[Guard]: https://github.com/guard/guard
[Yard]: https://github.com/lsegal/yard
[Pry]: https://github.com/pry/pry
[Rubocop]: https://github.com/bbatsov/rubocop
