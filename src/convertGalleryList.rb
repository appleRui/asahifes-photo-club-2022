require "erb"
require 'json'
require './src/galleryListTemplate'

IMPORT_JSON_FILE = "example.json"
EXPORT_FILE_NAME = "result.html"

# Build template data class.
class Photo
  def initialize( id, fileName)
    @id = id
    @fileName = fileName
  end

  # Support templating of member data.
  def get_binding
    binding
  end

end

# Create template.
template = %{
  <div class="col-md-4 text-center animate-box">
    <a class="work" style="cursor: default;">
      <div class="work-grid" style="background-image: url(<%= @fileName %>)">
        <div class="inner">
          <div class="desc"></div>
        </div>
      </div>
    </a>
  </div>
}.gsub(/^  /, '')

rhtml = ERB.new(template)

# Set up html data.
html = ""
Dir.glob("./assets/images/*").each_with_index do |filename, index|
  instance = Photo.new(index, filename)
  html += rhtml.result(instance.get_binding)
end

# Write HTML.
File.open(EXPORT_FILE_NAME, "w") do |file|
  file.puts html
end
