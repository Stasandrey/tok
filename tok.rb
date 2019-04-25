#!/usr/local/rvm/rubies/ruby-2.6.0/bin/ruby

require 'sqlite3'
require './read_ini.rb'
#require 'info'

class Ttable
  
  def initialize( db, tbl_name )
    @db = db
    @tbl_name = tbl_name
=begin
Format for table
daten   DATE
timen   TIME
energy  FLOAT
power   FLOAT
cosfi   FLOAT
=end    
    result = @db.execute <<-SQL
    CREATE TABLE IF NOT EXISTS '#{@tbl_name}' (
      daten DATE,
      timen TIME,
      energy FLOAT,
      power FLOAT,
      cosfi FLOAT
    ) 
    SQL
    puts result.to_s
  end
  
  def print( dateg, timeg, energyg, powerg, cosfig )
    
    s = "insert into  #{@tbl_name} values( '#{dateg}', '#{timeg}', #{energyg}, #{powerg}, #{cosfig} )"
    puts s
    @db.execute "insert into  #{@tbl_name} values( '#{dateg}',
       '#{timeg}', #{energyg}, #{powerg}, #{cosfig} )"
  
  end

end


  
  Read_ini.Read_all

# Database filename
  db_name = SQLite3::Database.new './data.db'

=begin  result = db_name.execute <<-SQL
    CREATE TABLE numbers (
      name VARCHAR(30),
      val INT
  ) 
  SQL
  
=end
=begin
  {'one' => 1, 'two' => 2}.each do |data|
    db_name.execute 'insert into numbers values( ?, ? )', data
  end
=end
  n = Ttable.new( db_name, 'Table1' )
  n1 = Ttable.new( db_name, '3456');
  n.print( '2019-04-25', '08:53:49', 3.14, 1.2, 0.75)

