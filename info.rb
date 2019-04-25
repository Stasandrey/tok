#!/usr/local/rvm/rubies/ruby-2.6.0/bin/ruby
module Info
class Ttable
  def initialize( db_name, tbl_name )
    @db_name = db_name
    @tbl_name = tbl_name
  end
  
  def print
    puts @db_name
    puts @tbl_name
  end

end
end
