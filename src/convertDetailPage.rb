require "erb"
require 'json'
require './src/detailPageTemplage'

IMPORT_JSON_FILE = "example.json"

# Build template data class.
class Photo
  def initialize( id, nickName, fileName)
    @id = id
    @nickName = nickName
    @fileName = fileName
  end

  # Support templating of member data.
  def get_binding
    binding
  end
end

# Import json.
def importJson
  File.open("./src/#{IMPORT_JSON_FILE}") do |file|
    return JSON.load(file)
  end
end

rhtml = ERB.new(template)

# Set up html data and Write HTML.
html = ""
imageList = importJson()["data"]
imageList.each do |data, index|
  instance = Photo.new(data['id'], data['nickName'], data['fileName'])
  html += rhtml.result(instance.get_binding)
  File.open("entrie#{data['id']}", "w") do |file|
    file.puts html
  end
end

