Pry.config.editor = proc {|file, line| "emacsclient +#{line} #{file}"}

