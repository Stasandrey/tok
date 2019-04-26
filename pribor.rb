#!/usr/local/rvm/rubies/ruby-2.6.0/bin/ruby
module Pribor
require './com.rb'
require './info.rb'
include Com
include Info

class Device
  
  def initialize( name, model, nomer, trans, time, db_name)
    @now=0
    @name = name
    @model = model
    @nomer = nomer
    @trans = trans
    @time = time
    @data = Ttable.new( db_name, @name ) 
    puts "Add device '#{@name}':'#{@model}':#{@nomer}:#{@trans}"  
  end

  def tick
    if @now==0 then 
      @now = @time
      read
#      puts @now
    else 
      @now = @now - 1
#      puts @now   
    end
    
  end
  
  def read
#    puts "Tick for #{@name}"
    s = read_com
    puts s
    puts s[ 0, 8 ]
    puts s[ 9, 8 ]
    puts s[ 18, 12]
    @data.print( s[ 0, 8 ], s[ 9, 8 ], s[ 18,12 ].to_i, 0, 0 )
  
  
  
  end
  
end

end
