#!/usr/local/rvm/rubies/ruby-2.6.0/bin/ruby
module Read_ini
require 'inifile'
  def Read_ini.Read_all
    ini = IniFile.load('conf.ini') 
    ini.each_section do |section|
      puts "Scetchik"
      puts "Nazvanie:#{ini[section]['name']}"
      puts "Marka:#{ini[section]['marka']}"
      puts "Zav. nomer:#{ini[section]['number'].to_i}"
      puts "Koef. transformacii: #{ini[section]['trans']}"  
    end
  end
end


