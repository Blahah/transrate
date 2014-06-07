#!/usr/bin/env  ruby

require 'helper'

class TestInline < Test::Unit::TestCase

  context 'transrate' do

    setup do
      filepath = File.join(File.dirname(__FILE__), 'data', 'assembly.fasta')
      @a = Transrate::Assembly.new(filepath)
      @seq1 = 'ATGCCCCTAGGGTAG'
    end

    should 'find longest orf in file' do
      orfs = []
      @a.assembly.each do |entry|
        l = @a.orf_length entry.seq
        orfs << l
      end
      assert_equal orfs.length, 4
      assert_equal orfs, [333, 370, 131, 84]
    end

    should 'find longest orf in sequence' do
      l = @a.orf_length(@seq1)
      assert_equal l, 4
    end

  end
end
