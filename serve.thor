class Serve < Thor::Group

  include Thor::Actions

  argument :name

  def self.source_root
    Dir.getcwd
  end

  def create_index_file
    create_file "#{name}/index.haml" do
<<HAML
!!! 5

%html
  %link(rel="stylesheet" href="http://twitter.github.com/bootstrap/1.3.0/bootstrap.min.css")
  %link(rel="stylesheet" href="style.css")
  %script(src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" type="text/javascript")
  %script(src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.16/jquery-ui.min.js" type="text/javascript")
  %script(src="app.coffee" type="text/javascript")

  %body
    .container
      .page-header
        %h1 #{name}

      .row
        .span16
          %p lorem ....

HAML

    end
  end


  def create_coffee_file

    create_file "#{name}/app.coffee" do
      <<JS
$ ->
  console.log 'ready'
JS
    end
  end

  def create_scss_file

    create_file "#{name}/style.scss" do
      <<SCSS
@mixin clearfix {
  overflow: hidden;
  *zoom: 1;
}

body {
}
SCSS
    end
  end

  def start_serve
    run "cd #{name} && serve"
  end

end
