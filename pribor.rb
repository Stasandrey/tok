#!/usr/local/rvm/rubies/ruby-2.6.0/bin/ruby
module Pribor

require './info.rb'

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
    else 
      @now-=1
    end
    
  end
  
  def read
    puts "Tick for #{@name}"
  end
  
end

end
