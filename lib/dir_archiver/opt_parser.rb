require 'optparse'
require 'ostruct'
module DirArchiver
  class OptParser
    # Return a structure describing the options.
    def self.parse(args)
      # The options specified on the command line will be collected in *options*.
      options = OpenStruct.new

      # Set the sensible default for the options explicitly
      options.input_dir  = "."
      options.depth = 1
      options.seperator = "__"
      options.output_dir = "."
      options.commit = false

      # The parser
      opt_parser = OptionParser.new do |opts|
        opts.banner = "Usage: dir-archiver [options]"

        opts.separator ""
        opts.separator "Specific options:"

        # Mandatory argument
        opts.on("-i", "--input-dir INPUT_DIR",
                "where INPUT_DIR is starting directory",
                "If not specified, current directory will be used") do |dir|
          options.input_dir = dir
        end

        opts.on("-d", "--depth NUMBER", Integer,
                "where NUMBER is depth of the directory from the starting directory",
                "If not specified, 1 will be used") do |num|
          options.depth = num
        end

        opts.on("-s", "--seperator [SEP]",
                "The seperator string to be used",
                "If not specified, '__' will be used") do |sep|
          options.seperator = sep
        end

        opts.on("-o", "--output-dir OUTPUT_DIR",
                "where OUTPUT_DIR is output directory",
                "If not specified, current directory will be used") do |dir|
          options.output_dir = dir
        end

        opts.on( "-c", "--[no-]commit",
                "Commit your action",
                "default to --no-commit e.g. dry-run only") do |c|
          options.commit = c
        end

        opts.separator ""
        opts.separator "Common options:"

        # No argument, shows at tail.  This will print an options summary.
        opts.on_tail("-h", "--help", "Show this message") do
          puts opts
          puts <<-EOT.gsub(/^\s+\|/, "")
            |
            | Example Usage:
            |
            | a) archive all immediate directories from the given directory (default to 1 level)
            |
            | $cd ~/inputs/projects
            | $dir-archiver --commit
            |
            | b) archive all directory 2 level depth (dry-run)
            |
            | $dir-archiver -i ~/inputs/projects -d 2 -s '__' -o ~/outputs/archives
            |
            | c) archive all directory 2 level depth (commit action)
            |
            | $dir-archiver -i ~/inputs/projects -d 2 -s '__' -o ~/outputs/archives
          EOT
          exit
        end
      end

      opt_parser.parse!(args)
      options
    end
  end
end
