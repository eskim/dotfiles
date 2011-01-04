#!/usr/bin/env ruby
# https://github.com/mislav/dotfiles/blob/master/install.rb

home = ENV["HOME"]

excludes = %w[install.rb README]

Dir.chdir File.dirname(__FILE__) do
  dotfiles_dir = Dir.pwd.sub(home+'/', '')

  Dir['*'].each do |file|
    next if excludes.include? file
    target_name = ".#{file}"
    target = File.join(home, target_name)
    unless File.exist? target
      system %(ln -vsf #{File.join(dotfiles_dir, file)} #{target})
    end

  end

end
