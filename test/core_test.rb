require 'minitest/autorun'

require_relative '../lib/core'

describe Seqencer do
  it 'counts N letters that appears in exactly one word' do
    dict = %w[
      arrows
      carrots
      give
      me
    ]

    words = []
    sequences = []

    Seqencer.run(dict) do |word, seq|
      words << word
      sequences << seq
    end

    _(words).must_equal(
      %w[
        arrows
        arrows
        carrots
        carrots
        carrots
        give
      ]
    )

    _(sequences).must_equal(
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
