require 'json'
class Output
  attr_reader :content
  def initialize(content)
    @content = content
  end

  def write
    pretty_content = JSON.pretty_generate({"rentals" => content})
    File.open("data/output.json", "w") {|file| file.write(pretty_content)}
  end
end
