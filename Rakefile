require 'rake'
#require 'ftools'
require 'erb'

task :default => [:install]

TILDE_PATH="tilde"

desc "install the dot files into user's home directory"
task :install do
  replace_all = false
  Dir.new(TILDE_PATH).each do |file|
    next if %w[. .. gitconfig.erb].include? file

    p File.join(ENV['HOME'], ".#{file}")

    if File.exist?(File.join(ENV['HOME'], ".#{File.basename file}"))
      if File.identical? File.join(TILDE_PATH, file), File.join(ENV['HOME'], ".#{File.basename file}")
        puts "identical ~/.#{file.sub('.erb', '')}"
      elsif replace_all
        replace_file(file)
      else
        print "overwrite ~/.#{file.sub('.erb', '')}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(file)
        when 'y'
          replace_file(file)
        when 'q'
          exit
        else
          puts "skipping ~/.#{file.sub('.erb', '')}"
        end
      end
    else
      link_file(file)
    end
  end
end

def remove_if_directory(file)
  if (File.directory? file)
    FileUtils.rm_rf file
  end
end

def replace_file(file)
  remove_if_directory(File.join(ENV['HOME'], ".#{file.sub('.erb', '')}"))
  system %Q{rm "$HOME/.#{file.sub('.erb', '')}"}
  link_file(file)
end

def link_file(file)
  puts "linking ~/.#{file}"
  system %Q{ln -sf "$PWD/#{TILDE_PATH}/#{file}" "$HOME/.#{file}"}
end
