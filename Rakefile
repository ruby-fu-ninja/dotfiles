require 'rake'
require 'erb'

desc "install the dot files into user's home directory"
task :install do
  replace_all = false
  
  Dir['*'].each do |file|
    next if %w[Rakefile README.rdoc LICENSE].include? file
     
    if (file =~ /\.zsh-theme/)
      if File.exist?(File.join(ENV['HOME'], ".oh-my-zsh/themes", file))
        system %Q{rm -rf  "$HOME/.oh-my-zsh/themes/#{file}"}
        link_file(file, "$HOME/.oh-my-zsh/themes")
      else             
        link_file(file, "$HOME/.oh-my-zsh/themes")
      end
    else 
      if File.directory?(file)
        link_dir(file) 
      elsif File.exist?(File.join(ENV['HOME'], ".#{file.sub('.erb', '')}"))
        if File.identical? file, File.join(ENV['HOME'], ".#{file.sub('.erb', '')}")
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
end

def replace_file(file)
  system %Q{rm -rf "$HOME/.#{file.sub('.erb', '')}"}
  link_file(file)
end

def link_dir(file, dest=nil)
  if dest
    puts %Q{ln -s "$PWD/#{file}" "#{dest}"}
    system %Q{ln -s "$PWD/#{file}" "#{dest}"}
  else
    puts %Q{ln -s "$PWD/#{file}" "$HOME"}
    system %Q{ln -s "$PWD/#{file}" "$HOME"}
  end
end

def link_file(file, dest=nil)
  if file =~ /.erb$/
    puts "generating ~/.#{file.sub('.erb', '')}"
    File.open(File.join(ENV['HOME'], ".#{file.sub('.erb', '')}"), 'w') do |new_file|
      new_file.write ERB.new(File.read(file)).result(binding)
    end
  else
    puts "linking ~/.#{file}"
    if dest
      system %Q{ln -s "$PWD/#{file}" "#{dest}/#{file}"}
    else
      system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
    end
  end
end
