# John Redmond
# 05/14/2012

def randomize(list)
  random_index = rand 0..list.size-1
  list[random_index]
end

def get_user_input
  guess = gets
  guess[0]
end

def current_status(random_word, user_guesses) 
  replacements = random_word.split(//) - user_guesses
  return random_word if replacements.empty?
  random_word.gsub /#{replacements}/, "*"
end

MAX_TRIES = 5
user_guesses = []
words = File.read("words.txt").split
random_word = randomize(words).downcase
tries_remaining = MAX_TRIES

loop do 
  puts "Choose a letter, you have #{tries_remaining} tries remaining: "
  puts current_status(random_word, user_guesses)
  letter_guessed = get_user_input
  if random_word.include? letter_guessed
    puts "correct"
    user_guesses << letter_guessed
  else
    tries_remaining = tries_remaining - 1
    puts "Letter not found, you have #{tries_remaining} tries remaining"
  end

  if tries_remaining == 0
    puts "the word was #{random_word}"
    puts "you did not guess the word"
    exit
  end
  if current_status(random_word, user_guesses) == random_word
    puts "The word was #{random_word}"
    puts "congrats you guessed the world correctly, the hangman goes hungry today!"
    exit
  end
end
