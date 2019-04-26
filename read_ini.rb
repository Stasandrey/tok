#!/usr/local/rvm/rubies/ruby-2.6.0/bin/ruby
module Read_ini
require 'inifile'
require './pribor.rb'

include Pribor

class Ini  
  
  def initialize(name)
    @name = name
    @ini = IniFile.load( name ) 
  end
  
  def get_number
    n = 0
    @ini.each_section do 
      n += 1
    end
    n
  end
 
 
 
 
  def read_all_ini(db, pribory)
     
    @ini.each_section do |section|
      
      p = Device.new(
        @ini[section]['name'].to_s,
        @ini[section]['model'].to_s,
        @ini[section]['nomer'].to_i,
        @ini[section]['trans'].to_i,
        @ini[section]['time'].to_i,
        db  
      )
      pribory << p
    end
  end

end


end


