def ask_user()
    puts puts
    print "Guess an integer between 1 and 100: "
    guess = Integer(gets) rescue nil
    return guess
end

def calc_result(correct, guess, tries, tried)
    if guess == nil
        puts puts
        puts "I'm sorry, but that's not a number. You lose one guess."
    elsif tried.include?(guess)
        puts puts
        puts "You alright? Same guess twice?"
    elsif guess > correct
        puts puts
        puts "Too much."
        tried[tries] = guess
    elsif guess < correct
        puts puts
        puts "Kinda small."
        tried[tries] = guess
    elsif guess == correct
        puts puts
        puts "You guessed correctly. Nice!"
        exit
    end

    if tries == 4
        puts puts
        puts "You guessed 5 times and still coulnd't get it right."
        puts puts
        puts "The correct answer was #{correct}."
        puts puts
        puts "GAME OVER"
        exit
    end
    return tried
end

def calc_rand()
    correct = rand(1..100)
    return correct
end

def main
    puts "WELCOME TO THE ULTIMATE GUESSING GAME. PREPARE YOURSELF."
    correct = calc_rand
    tried = [nil]*5
    for tries in (0..4)
        guess = ask_user
        tried = calc_result(correct, guess, tries, tried)
    end
end

main
