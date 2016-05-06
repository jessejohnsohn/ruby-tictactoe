Written on February 23, 2016 as part of my learning of the Ruby Language

Concerns: too many class variables. Way too long. Code smell. But it works.
# TicTacToe game

class Board
    def initialize
        @@x = []
        @@y = []
        @@z = (1..9).to_a
        @@remaining = @@z - @@x - @@y
        puts 'Tic Tac Toe Board'
        @@row1 = { 1 => 1, 2 => 2, 3 => 3 }
        @@row2 = { 4 => 4, 5 => 5, 6 => 6 }
        @@row3 = { 7 => 7, 8 => 8, 9 => 9 }
        p @@row1.values
        p @@row2.values
        p @@row3.values
        @@win1 = [1,2,3]
        @@win2 = [4,5,6]
        @@win3 = [7,8,9]
        @@win4 = [1,4,7]
        @@win5 = [2,5,8]
        @@win6 = [3,6,9]
        @@win7 = [1,5,9]
        @@win8 = [3,5,8]
    end
end

class PlayerA < Board
    def initialize(name='', xoro='')
        @name = name
        @xoro = xoro
    end

    def move
        move = gets.chomp.to_i
        @@x.push(move)
        if @@row1.has_value?(move)
            @@row1[move] = @xoro
        elsif @@row2.has_value?(move)
            @@row2[move] = @xoro
        else @@row3[move] = @xoro
        end
        @@remaining = @@z - @@x - @@y
        if (@@win1 - @@x).empty? || (@@win2 - @@x).empty? || (@@win3 - @@x).empty? ||
            (@@win4 - @@x).empty? || (@@win5 - @@x).empty? || (@@win6 - @@x).empty? ||
            (@@win7 - @@x).empty? || (@@win8 - @@x).empty?
            puts 'Player X won!'
            sleep(2)
            p @@row1.values
            p @@row2.values
            p @@row3.values
            exit
        elsif (@@win1 - @@y).empty?
            puts 'Player Y won!'
            sleep(2)
            p @@row1.values
            p @@row2.values
            p @@row3.values
            exit
        elsif @@remaining.empty?
            puts "Cat's Game"
            sleep(2)
            exit
        else
            p @@row1.values
            p @@row2.values
            p @@row3.values
        end
    end
end

class PlayerB < Board
    def initialize(name='', xoro='')
        @name = name
        @xoro = xoro
    end

    def move
        puts "Hmmmmmm...."
        sleep(2)
        move = @@remaining.shuffle.first
        sleep(1)
        puts move
        sleep(1)
        @@y.push(move)
        if @@row1.has_value?(move)
            @@row1[move] = @xoro
        elsif @@row2.has_value?(move)
            @@row2[move] = @xoro
        else @@row3[move] = @xoro
        end
        @@remaining = @@z - @@x - @@y
        if (@@win1 - @@x).empty?
            puts 'Player X won!'
            sleep(2)
            p @@row1.values
            p @@row2.values
            p @@row3.values
            exit
        elsif (@@win1 - @@y).empty?
            puts 'Player Y won!'
            sleep(2)
            p @@row1.values
            p @@row2.values
            p @@row3.values
            exit
        elsif @@remaining.empty?
            puts "Cat's Game"
            sleep(2)
            exit
        else
            p @@row1.values
            p @@row2.values
            p @@row3.values
        end
    end
end

new_game = Board.new

puts "Let's begin. What's your name?"
your_name = gets.chomp

turn = rand(2) == 1

x = []
y = []
z = (1..9).to_a

if turn == true
    sign_a = 'X'
    sign_b = 'O'
    new_player_a = PlayerA.new(your_name, sign_a)
    new_player_b = PlayerB.new('Computo', sign_b)
    puts 'Your turn, ' + your_name
    new_player_a.move
    new_player_b.move
    puts 'Your turn, ' + your_name
    new_player_a.move
    new_player_b.move
    puts 'Your turn, ' + your_name
    new_player_a.move
    new_player_b.move
    puts 'Your turn, ' + your_name
    new_player_a.move
    new_player_b.move
    puts 'Your turn, ' + your_name
    new_player_a.move
else
    sign_b = 'X'
    sign_a = 'O'
    new_player_b = PlayerB.new('Computo', sign_b)
    new_player_a = PlayerA.new(your_name, sign_a)
    new_player_b.move
    puts 'Your turn, ' + your_name
    new_player_a.move
    new_player_b.move
    puts 'Your turn, ' + your_name
    new_player_a.move
    new_player_b.move
    puts 'Your turn, ' + your_name
    new_player_a.move
    new_player_b.move
    puts 'Your turn, ' + your_name
    new_player_a.move
    new_player_b.move
end
