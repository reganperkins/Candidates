# This is the main entrypoint into the program
# It requires the other files/gems that it needs

require 'pry'
require './candidates'
require './filters'

## Your test code can go here


#binding.pry

# pp qualified_candidates


#call def 

# puts experienced?(@candidates[1])
# puts find(15)

# puts qualified_candidates

ordered_by_qualifications

def repl
  in_play = true
  while in_play
    puts "Wanna Play?"
    user_input = gets.chomp

    #puts user_input

    case user_input
    when /find (\d+)/
      puts find($1)
    when 'all' 
      @candidates.each { |candidate| puts candidate }
    when 'qualified' 
      puts qualified_candidates(ordered_by_qualifications(@candidates))
    when 'quit' 
      in_play = false
    end
  end

end

repl
