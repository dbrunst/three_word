require './models/three_word.rb'

describe ThreeWord do
  let(:expected) { "this is a" }

  context "Basic simple line with spaces" do
    let(:line) { "this is a test a test is the a is a test this is a this is a" }

    it "should be correct" do
      expect(ThreeWord.new.draft(line)).to eq expected
    end
  end

  context "multi line and tabbed example" do
    let(:line) { "\tthis\ris a test a test is\r\t\nthis is a test a test" }

    it "should be correct" do
      expect(ThreeWord.new.draft(line)).to eq expected
    end
  end

  context "extra spaces" do
    let(:line) { "this  is a test a test is this is    a test a test" }

    it "should be correct" do
      expect(ThreeWord.new.draft(line)).to eq expected
    end
  end

  context "case insensitive" do
    let(:line) { "This is a test this Is a test tHis is a test is this test is a "}

    it "should be correct" do
      expect(ThreeWord.new.draft(line)).to eq expected
    end
  end

  context "different punctuation" do
    let(:line) { "(this is a test) (this Is a!) is a test !! !! !!"}

    it "should be correct" do
      expect(ThreeWord.new.draft(line)).to eq expected
    end
  end

  context "contractions should be handled correctly" do
    let(:expected) {"this isn't a"}

    context "simple contraction" do
      let(:line) { "this isn't a test this isn't a is a test"}
      it "should be correct" do
        expect(ThreeWord.new.draft(line)).to eq expected
      end
    end

    context "contraction with single quote" do
      let(:line) { "this isn't 'a test this' isn't a is a test"}

      it "should be correct" do
        expect(ThreeWord.new.draft(line)).to eq expected
      end
    end
  end

  context "hyphens are continuations" do
    context "case insensitive" do
      let(:line) { "this is a test a test is- the— a is a test this is a this is a" }

      it "should be correct" do
        expect(ThreeWord.new.draft(line)).to eq expected
      end
    end
  end

  context "unicode is handled correctly" do
  end
end


# The program ignores punctuation, line endings, and is case insensitive
#   - `“I love\nsandwiches.”` should be treated the same as `"(I LOVE SANDWICHES!!)"`).
#   - Contractions shouldn't be changed into two words (eg. `can't` should not become `can t`).
#   - Hyphens on line-endings can be treated as continuations OR punctuation.
#   - Unicode may also be handled in any way you like (including replacing it with a space)
