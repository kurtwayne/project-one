# Define RandomData as a module to keep things organized and reusable
module RandomData

  def self.random_name
     first_name = random_word.capitalize
     last_name = random_word.capitalize
     "#{first_name} #{last_name}"
   end

   def self.random_email
     "#{random_word}@#{random_word}.#{random_word}"
   end

# Create 4-6 random sentences and append them to sentences. We call join
# (continued) combine each sentence into a paragraph.
  def random_paragraph
    sentences = []
    rand(4..6).times do
    sentences << random_sentence
  end

  sentences.join("")
end

# Used to place random words into a sentence
def random_sentence
  strings = []
  rand(3..8).times do
    strings << random_word
  end
# Joins the strings in the sentences and capitalizes and adds period at end.
  sentence = strings.join("")
  sentence.capitalize << "."
end

# Creates random words for the sentences.  We call shuffle! on letters in
# place. If we were to call shuffle without the bang (!), then shuffle would
# return an array rather than shuffle in place. We join the zeroth through
#nth item in letters. The nth item is the result of rand(3..8) which returns
# a random number greater than or equal to three and less than eight.

  def random_word
    letters = ('a'..'z').to_a
    letters.shuffle!
    letters[0, rand(3..8)].join
  end
end
