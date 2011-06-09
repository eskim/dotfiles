# require 'rubygems'
# require 'interactive_editor'
# j
# jrequire 'utility_belt'
# j
# j  UtilityBelt.equip(:command_history)
# j  UtilityBelt.equip(:hash_math)
# j  UtilityBelt.equip(:clipboard)
# j  UtilityBelt.equip(:interactive_editor)
# j  UtilityBelt.equip(:irb_options)
# j  UtilityBelt.equip(:print_methods)
# j  UtilityBelt.equip(:wirble)
# j  UtilityBelt.equip(:with)
# jUtilityBelt::Themes.background(:dark)
# jWirble.init
# jWirble.colorize
# j
# jrequire 'hirb'
# jHirb.enable
# j
# j
# jrequire 'rexml/document'

require 'rubygems'
require 'open-uri'
require 'nokogiri'


begin
  require 'ap'

  IRB::Irb.class_eval do
    def output_value
      ap @context.last_value, {:indent => -4}
    end 
  end

# doesn't work
#   AwesomePrint.defaults = {
#     :indent => -4
#   }

rescue
  require 'pp'
end

def open_nokogiri(url)
  doc = Nokogiri::HTML(open(url).read)
end

