require 'fileutils'
module DirArchiver
  class << self
    # Compress all directories with a given depth from the starting directory
    #
    # @params [String] input_dir the starting directory can be `~/Desktop/codes` or `.`
    # @params [Fixnum] depth the directory level from the input_dir
    # @params [String] separator the separator to use in the output
    # @params [String] output_dir the output directory for the result
    # @params [Boolean] commit commit the action if true
    def archive(input_dir = '.', depth = 1, separator = "__", output_dir = ".", commit = false)
      input_path  = File.expand_path(input_dir)
      output_path = File.expand_path(output_dir)

      return unless File.exists?(input_path) && File.directory?(input_path)

      # Create one if the output directory is not exist!
      FileUtils.mkdir_p(output_path) unless File.exists?(output_path) && File.directory?(output_path)

      # Get the result from the result of `find` command
      result = `find #{input_path} -type d -depth #{depth}`
      return if result && result.empty?

      files = result.split("\n").map { |i| i.gsub(input_path, ".") }

      puts "DRY-RUN ONLY : No action taken!"  unless commit

      files.each_with_index do |path, index|
        # Strip off the [".", "path", "to", "dir"]
        dirs = path.split(File::SEPARATOR).drop(1)
        puts "Process #{index+1} of #{files.size} : #{path}"

        output_name = "#{[output_path, File::SEPARATOR, dirs.join(separator)].join('')}.tar.gz"

        # Note: just in case!, maybe don't need this one just use
        Dir.chdir(input_path)

        if commit
          puts "tar zcvf #{output_name} #{path}"
          # Perform the actual compress here!
          `tar zcvf #{output_name} #{path} 2> /dev/null`
        else
          puts "tar zcvf #{output_name} #{path} (dry-run)"
        end
      end
    end
  end
end
