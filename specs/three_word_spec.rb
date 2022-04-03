require './models/three_word.rb'

describe ThreeWord do
  let(:expected) { ["this is a", 3] }

  context "Basic simple line with spaces" do
    let(:line) { ["this is a test a test is the a is a test this is a this is a"] }

    it "should be correct" do
      l = ThreeWord.new
      l.process_lines(line)

      expect(l.get_top_100.first).to eq expected
    end
  end

  context "multi line and tabbed example" do
    let(:line) { ["\tthis\ris a test a test is\r\t\nthis is a test a test this is a"] }

    it "should be correct" do
      l = ThreeWord.new
      l.process_lines(line)

      expect(l.get_top_100.first).to eq expected
    end
  end

  context "extra spaces" do
    let(:line) { ["this  is a test a test is this is    a test a test this is a"] }

    it "should be correct" do
      l = ThreeWord.new
      l.process_lines(line)

      expect(l.get_top_100.first).to eq expected
    end
  end
end
