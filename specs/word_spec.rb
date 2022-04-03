require './models/word.rb'

describe Word do
  let(:expected) { "hello" }

  context "case insensitive" do
    let(:word) { "Hello"}

    it "should be correct" do
      expect(Word.new(word).to_string).to eq expected
    end
  end

  context "different punctuation" do
    let(:word) { "hello!!?"}

    it "should be correct" do
      expect(Word.new(word).to_string).to eq expected
    end
  end

  context "apostrophes should be handled correctly" do
    context "simple contraction 1" do
      let(:word) { "isn't"}
      let(:expected) { "isn't" }
      it "should be correct" do
        expect(Word.new(word).to_string).to eq expected
      end
    end

    context "simple contraction 2" do
      let(:word) { "isn’t"}
      let(:expected) { "isn’t" }
      it "should be correct" do
        expect(Word.new(word).to_string).to eq expected
      end
    end

    context "contraction with single quote" do
      let(:word) { "'isn't'"}
      let(:expected) { "isn't" }
      it "should be correct" do
        expect(Word.new(word).to_string).to eq expected
      end
    end
  end

  context "hyphens" do
    context "hyphens that should be ignored" do
      let(:word) { "hello-" }

      it "should be correct" do
        expect(Word.new(word).to_string).to eq expected
      end
    end

    context "hyphens that should be counted" do
      let(:word) { "hello-world" }
      let(:expected) {"hello-world"}

      it "should be correct" do
        expect(Word.new(word).to_string).to eq expected
      end
    end
  end
end
