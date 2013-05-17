require 'yaml'

module LoremIpsumGenerator
  class << self
    def generate paragraph_count, profanity_percent, static_start
      return "You sent some fucking weird parameters. Try again, dipshit." if paragraph_count < 1

      output = []

      if static_start
        output << make_paragraph(rand(5)+6, profanity_percent, true)
        paragraph_count -= 1
      end

      (paragraph_count).times do
        output << make_paragraph(rand(7)+6, profanity_percent)
      end

      output.join "\n\n"
    end

    private

    def make_paragraph sentence_count, profanity_percent, first=false
      if first
        output = ["Lorem fucking ipsum, bitch."]
        sentence_count -= 1
      else
        output = []
      end

      sentence_count.times do
        output << make_sentence(rand(11)+5, profanity_percent)
      end

      output.join " "
    end

    def make_sentence word_count, profanity_percent
      comma_place = word_count > 8 ? random_comma_place(word_count) : nil
      output = []

      word_count.times do |place|
        profanity = rand(100) < profanity_percent
        word = ""

        while output.include? word
          word = profanity ? random_profane_word_group : random_latin_word
        end

        output << word

        case place
        when comma_place
          output << ","
        when word_count-1
          output << "."
        end
      end

      output.map! do |e|
        e.is_a?(Array) ? e.sample : e
      end

      output.join(" ").gsub(" .", ".").gsub(" ,", ",").strip.capitalize
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

    def random_profane_word_group
      profane_words.sample
    end
  end
end