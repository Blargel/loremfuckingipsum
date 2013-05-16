require 'yaml'

module LoremIpsumGenerator
  class << self
    def generate
       make_paragraph 8, true
    end

    private

    def make_paragraph sentence_count, first=false
      if first
        output = "Lorem fucking ipsum, bitch. "
        sentence_count -= 1
      else
        output = ""
      end

      sentence_count.times do
        output += make_sentence(rand(16)+5)
      end

      output
    end

    def make_sentence word_count
      comma_place = word_count > 8 ? nil : random_comma_place(word_count)
      output = ""

      word_count.times do |place|
        output += random_word
        case place
        when comma_place
          output += ", "
        when word_count-1
          output += ". "
        else
          output += " "
        end
      end

      output.capitalize
    end

    def random_word
      [true, false].sample ? random_latin_word : random_profane_word
    end

    def random_comma_place word_count
      rand(word_count-6)+3
    end

    def latin_words
      @latin_words ||= YAML.load_file "./config/latin.yml"
    end

    def random_latin_word
      latin_words.sample
    end

    def profane_words
      @profane_words ||= YAML.load_file "./config/profanity.yml"
    end

    def random_profane_word
      profane_words.sample
    end
  end
end