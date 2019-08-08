class Team      
    attr_accessor :name, :ranking

    def initialize(name, ranking)
        @name = name
        @ranking = ranking
    end
end

@teams = []

@new_line = "\n"

def menu
    puts "What would you like to do?"
    puts "1. Enter Teams"
    puts "2. List Teams"
    puts "3. List Matchups"
    puts "4. Exit Program"

    choice = gets.chomp.to_i

    case choice
        when 1
            enter_teams
        when 2
            list_teams
        when 3 
            matchups
        when 4
            exit
        else
            puts "Try again"
            menu
        end
    end

    def return_to_menu
        menu
    end

    def enter_teams
        puts "How many teams would you like to enter?"
        puts @new_line
        num = gets.chomp.to_i
        puts "Enter teams from highest ranking to lowest."
        
        num.times do
            puts "Enter team"
            @teams.push(gets.chomp)
        end

        puts @new_line

        list_teams
        menu
    end

    def list_teams
        @teams.each do |x|
            puts x
        end

        menu
    end

    def matchups 
        length = @teams.length

        if length % 2 != 0
            bye = @teams.shift
        end

        arr = @teams
        left,right = arr.each_slice( (arr.length/2.0).round ).to_a
        
        right = right.reverse
        puts @new_line
        puts "#{bye} has bye"
        left.count.times do |index|
            puts "#{left[index]} vs. #{right[index]}"
          end

          puts @new_line
        menu
    end

    menu
            
