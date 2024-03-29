require "pstore" # https://github.com/ruby/pstore

STORE_NAME = "tendable.pstore"
store = PStore.new(STORE_NAME)

QUESTIONS = {
  "q1" => "Can you code in Ruby?",
  "q2" => "Can you code in JavaScript?",
  "q3" => "Can you code in Swift?",
  "q4" => "Can you code in Java?",
  "q5" => "Can you code in C#?"
}.freeze

@total_yes_count = 0
# TODO: FULLY IMPLEMENT
def do_prompt
  yes_count = 0
  questions_asked = 0
  # Ask each question and get an answer from the user's input.
  QUESTIONS.each_key do |question_key|
    questions_asked = questions_asked + 1
    print QUESTIONS[question_key] # Printing current question for user
    ans = gets.chomp.downcase # converting current user input to lower case to handle case insensitively 
    if ans == 'y' || ans == 'yes' # comparing entered value
      yes_count = yes_count + 1; # Increasing value by 1 if user says yes
    end
    puts "Current Rating => #{get_ratings(yes_count, questions_asked)} \n \n" # Printing current rating by calculating ratings
  end
  @total_yes_count = yes_count
end

def get_ratings (yes_count, questions_asked)
  (100 * yes_count)/questions_asked
end

def do_report
  puts "Overall Ratings: #{get_ratings(@total_yes_count, QUESTIONS.length)}" # Printing in total ratings
end

do_prompt
do_report
