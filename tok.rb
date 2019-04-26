#!/usr/local/rvm/rubies/ruby-2.6.0/bin/ruby

require './read_ini.rb'
require './info.rb'
require './pribor.rb'
require './com.rb'
include Read_ini
include Info
include Pribor  
include Com



#s = read_com
#puts s
#puts ("Date:#{td}, Time:#{tt}, Pok:#{tp}")


  
  ini = Ini.new('./conf.ini')
  db_name = db_init( './data.db' )
  
  pribory = Array.new

  ini.read_all_ini( db_name, pribory )  
  
#Main circle

  while true do
    pribory.each { |p|
	  p.tick
		
	}      
    sleep(1)
  end
    
 
  
  
  
  
  
#  n = Ttable.new( db_name, 'Table1' )
#  n1 = Ttable.new( db_name, '3456');
#  n.print( '2019-04-25', '08:53:49', 3.14, 1.2, 0.75)

