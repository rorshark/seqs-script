require_relative './core'

class FileWriter
  def self.run(input_file:, words_file:, seqs_file:)
    Seqencer.run(input_file.each_line.lazy) do |word, seq|
      words_file.puts word
      seqs_file.puts seq
    end
  ensure
    dict_file.close
    words_file.close
    seqs_file.close
  end
end
