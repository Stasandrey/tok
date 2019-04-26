
module Com
require "serialport"
def read_com
  
  port_str = "/dev/ttyUSB0"
  baud_rate = 9600
  data_bits = 7
  stop_bits = 1
  parity = SerialPort::EVEN

  sp = SerialPort.new( port_str, baud_rate, data_bits, stop_bits, parity)
#Protokol for ce301
#puts "Port opened"
#Connecting
  s = sprintf( "%c%c%c%c%c", 0x2F, 0x3F, 0x21, 0x0D, 0x0A ) 
  sp.write(s)
  sp.readline( 15 )
  
  s = sprintf( "%c%c%c%c%c%c", 0x06, 0x30, 0x35, 0x31, 0x0D, 0x0A ) 
  sp.write(s)
  sp.readline( 14 )
  
  s = sprintf( "%c%c%c%c%c%c%c%c%c%c%c%c%c%c", 
     0x01, 0x50, 0x31, 0x02, 0x28, 0x37, 0x37,
     0x37, 0x37, 0x37, 0x37, 0x29, 0x03, 0x21 ) 
  sp.write(s)
  sp.readline( 1 )
#puts "Connected"  
#read date
  s = sprintf( "%c%c%c%c%c%c%c%c%c%c%c%c%c", 
     0x01, 0x52, 0x31, 0x02, 0x44, 0x41, 0x54,
     0x45, 0x5F, 0x28, 0x29, 0x03, 0x56 ) 
  sp.write(s)
  s = sp.readline( 23 )
  s = s[ 10, 8 ]
#  puts( "Date->[#{s}]")
  res = s
#puts "Date read"
#read time
  s = sprintf( "%c%c%c%c%c%c%c%c%c%c%c%c%c", 
     0x01, 0x52, 0x31, 0x02, 0x54, 0x49, 0x4D,
     0x45, 0x5F, 0x28, 0x29, 0x03, 0x67 ) 
  sp.write(s)
  s = sp.readline( 20 )
  s = s[ 9, 8 ]
#  puts( "Time->[#{s}]")
  res = res + '|'+s
#puts "Time read"
#read pokazaniya
  s = sprintf( "%c%c%c%c%c%c%c%c%c%c%c%c%c", 
     0x01, 0x52, 0x31, 0x02, 0x45, 0x54, 0x30,
     0x50, 0x45, 0x28, 0x29, 0x03, 0x37 ) 
  sp.write(s)
  s = sp.readline( 20 )
  s = s[ 9,10 ]
#  puts( "Pokazaniya->[#{s}]")
  res = res + '|'+s
#puts "Pok read"
#disconnect
  s = sprintf( "%c%c%c%c%c", 0x01, 0x42, 0x30, 0x03, 0x75 ) 
  sp.write(s)
#puts "Diskonnected"
=begin
#Connecting
  s = sprintf( "%c%c%c%c%c", 0x2F, 0x3F, 0x21, 0x0D, 0x0A ) 
  sp.write(s)
  sp.readline( 15 )
  
  s = sprintf( "%c%c%c%c%c%c", 0x06, 0x30, 0x35, 0x31, 0x0D, 0x0A ) 
  sp.write(s)
  sp.readline( 14 )
  
  s = sprintf( "%c%c%c%c%c%c%c%c%c%c%c%c%c%c", 
     0x01, 0x50, 0x31, 0x02, 0x28, 0x37, 0x37,
     0x37, 0x37, 0x37, 0x37, 0x29, 0x03, 0x21 ) 
  sp.write(s)
  sp.readline( 1 )

#read power
  s = sprintf( "%c%c%c%c%c%c%c%c%c%c%c%c%c", 
     0x01, 0x52, 0x31, 0x02, 0x50, 0x4F, 0x57,
     0x45, 0x50, 0x28, 0x29, 0x03, 0x64 ) 
  sp.write(s)
  s = sp.readline( 20 )
  s = s[ 2, 10 ]
  puts( "POWER->#{s}")


#read cos fi
  s = sprintf( "%c%c%c%c%c%c%c%c%c%c%c%c%c", 
     0x01, 0x52, 0x31, 0x02, 0x43, 0x4F, 0x53,
     0x5F, 0x66, 0x28, 0x29, 0x03, 0x03 ) 
  sp.write(s)
  s = sp.readline( 55 )
#  s = s[ 2, 10 ]
  puts( "COS fi->#{s}")

#read tg fi
  s = sprintf( "%c%c%c%c%c%c%c%c%c%c%c%c%c", 
     0x01, 0x52, 0x31, 0x02, 0x54, 0x41, 0x4E,
     0x5F, 0x66, 0x28, 0x29, 0x03, 0x01 ) 
  sp.write(s)
  s = sp.readline( 54 )
#  s = s[ 7, 3 ]
  puts( "TAN fi->#{s}")

#disconnect
  s = sprintf( "%c%c%c%c%c", 0x01, 0x42, 0x30, 0x03, 0x75 ) 
  sp.write(s)
=end  
  sp.close
#puts "Port closed"  
  res
end





end
