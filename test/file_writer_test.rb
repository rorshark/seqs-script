require 'minitest/autorun'
require 'stringio'

require_relative '../lib/file_writer'

def read_lines_from_file(file)
  file.rewind
  file.readlines.map(&:strip)
end

describe FileWriter do
  it 'writes seqs and words to separate files' do
    input_file = StringIO.new
    words_file = StringIO.new
    seqs_file  = StringIO.new

    %w[
      arrows
      carrots
      give
      me
    ].each do |word|
      input_file.puts(word)
    end

    input_file.rewind

    FileWriter.run(
      input_file: input_file,
      words_file: words_file,
      seqs_file: seqs_file
    )

    words_results = read_lines_from_file(words_file)
    seqs_results  = read_lines_from_file(seqs_file)

    assert_equal(
      words_results,
      %w[
        arrows
        arrows
        carrots
        carrots
        carrots
        give
      ]
    )

    assert_equal(
      seqs_results,
      %w[
        rrow
        rows
        carr
        rrot
        rots
        give
      ]
    )
  end
end
