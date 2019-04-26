#!/usr/local/rvm/rubies/ruby-2.6.0/bin/ruby
require "serialport"
require './read_ini.rb'
require './info.rb'
require './pribor.rb'
require './com.rb'
include Read_ini
include Info
include Pribor  
include Com

  port_str = "/dev/ttyUSB0"
  baud_rate = 9600
  data_bits = 7
  stop_bits = 1
  parity = SerialPort::EVEN

  sp = SerialPort.new( port_str, baud_rate, data_bits, stop_bits, parity)
#Protokol for ce301

#Connecting
  s = sprintf( "%c%c%c%c%c", 0x2F, 0x3F, 0x21, 0x0D, 0x0A ) 
  puts( "Sending to device->#{s}" )
  sp.write(s)
  sp.readline( 15 )
  
  s = sprintf( "%c%c%c%c%c%c", 0x06, 0x30, 0x35, 0x31, 0x0D, 0x0A ) 
  puts( "Sending to device->#{s}" )
  sp.write(s)
  sp.readline( 14 )
  
  s = sprintf( "%c%c%c%c%c%c%c%c%c%c%c%c%c%c", 
     0x01, 0x50, 0x31, 0x02, 0x28, 0x37, 0x37,
     0x37, 0x37, 0x37, 0x37, 0x29, 0x03, 0x21 ) 
  puts( "Sending to device->#{s}" )
  sp.write(s)
  sp.readline( 1 )
  
#read date
  s = sprintf( "%c%c%c%c%c%c%c%c%c%c%c%c%c", 
     0x01, 0x52, 0x31, 0x02, 0x44, 0x41, 0x54,
     0x45, 0x5F, 0x28, 0x29, 0x03, 0x56 ) 
  puts( "Sending to device->#{s}" )
  sp.write(s)
  s = sp.readline( 23 )
  puts( "Reading device->#{s}")

#read time
  s = sprintf( "%c%c%c%c%c%c%c%c%c%c%c%c%c", 
     0x01, 0x52, 0x31, 0x02, 0x54, 0x49, 0x4D,
     0x45, 0x5F, 0x28, 0x29, 0x03, 0x67 ) 
  puts( "Sending to device->#{s}" )
  sp.write(s)
  s = sp.readline( 20 )
  puts( "Reading device->#{s}")
#read pokazaniya
  s = sprintf( "%c%c%c%c%c%c%c%c%c%c%c%c%c", 
     0x01, 0x52, 0x31, 0x02, 0x45, 0x54, 0x30,
     0x50, 0x45, 0x28, 0x29, 0x03, 0x37 ) 
  puts( "Sending to device->#{s}" )
  sp.write(s)
  s = sp.readline( 111 )
  puts( "Reading device->#{s}")
#read cos fi
  s = sprintf( "%c%c%c%c%c%c%c%c%c%c%c%c%c", 
     0x01, 0x52, 0x31, 0x02, 0x43, 0x4F, 0x53,
     0x5F, 0x66, 0x28, 0x29, 0x03, 0x03 ) 
  puts( "Sending to device->#{s}" )
  sp.write(s)
  s = sp.readline( 55 )
  puts( "Reading device->#{s}")
#read tg fi
  s = sprintf( "%c%c%c%c%c%c%c%c%c%c%c%c%c", 
     0x01, 0x52, 0x31, 0x02, 0x54, 0x41, 0x4E,
     0x5F, 0x66, 0x28, 0x29, 0x03, 0x01 ) 
  puts( "Sending to device->#{s}" )
  sp.write(s)
  s = sp.readline( 54 )
  puts( "Reading device->#{s}")
#disconnect
  s = sprintf( "%c%c%c%c%c", 0x01, 0x42, 0x30, 0x03, 0x75 ) 
  puts( "Sending to device->#{s}" )
  sp.write(s)
  s = sp.readline( 23 )
  puts( "Reading device->#{s}")


=begin
  
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
=end    
 
  
  
  
  
  
#  n = Ttable.new( db_name, 'Table1' )
#  n1 = Ttable.new( db_name, '3456');
#  n.print( '2019-04-25', '08:53:49', 3.14, 1.2, 0.75)

