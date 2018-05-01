require "pug-ruby"

task :gulp_build do
  Dir["/app/views/*.pug"].each do |filename|
    data = File.read(filename);
    contents = Pug.compile(data, filename: filename)
    File.write("./public/#{File.basename(filename, '.pug')}.html", contents)
  end
end
