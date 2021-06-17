module Seqencer
  def self.run(dict, seq_length = 4)
    seq_counts = {}

    dict.each do |word|
      word = word.strip

      next if word.size < seq_length

      word.chars.each_cons(seq_length) do |cons|
        seq  = cons.join
        prev = seq_counts[seq]

        if prev
          _, count = prev
          seq_counts[seq] = [word, count + 1]
        else
          seq_counts[seq] = [word, 1]
        end
      end
    end

    seq_counts.each_pair do |(seq, (word, count))|
      next if count > 1

      yield(word, seq)
    end
  end
end
