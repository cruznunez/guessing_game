def ask_user()
    puts "WELCOME TO THE ULTIMATE GUESSING GAME. PREPARE YOURSELF."
    puts*2
    print "Guess an integer between 1 and 100: "
    guess = Integer(gets) rescue nil
    return guess
end

def calc_result(correct, guess, tried)
    if tries <= 4
        if guess == nil
            puts "I'm sorry, but that's not a number. You lose one guess."
        elsif tried.include?(guess)
            puts "You alright? Same guess twice?"
        elsif guess > correct
            puts "Too much."
            tried[tries] = guess
        elsif guess < correct
            puts "Kinda small."
            tried[tries] = guess
        else
            puts "You guessed correctly. Nice!"
            break
        end
    else
        puts
        puts
        puts "You guessed 5 times and still coulnd't get it right."
        puts
        puts
        puts "GAME OVER"
    end
end

def calc_rand()
    correct = rand(1..100)
    return correct
end

def main
    correct = calc_rand
    guess = ask_user
    tried = []
    for tries in (0..5)
        break if calc_result(correct, guess, tried)
    end
end

main
