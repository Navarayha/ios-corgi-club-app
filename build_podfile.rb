require 'xcodeproj'

project = Xcodeproj::Project.open("./CorgiClubApp.xcodeproj")

pod_files = {}

Dir.glob("./Features/**/.Pods").each do |file|
  last3 = file.split("/").last(3)
  if last3[-2] == "Example"
    pod_files.store(last3[-3] + "ExampleApp", File.read(file))
  else
    pod_files.store(last3[-2], File.read(file))
  end
end

puts pod_files

out_file = File.new("./Podfile", "w")
out_file.puts "platform :ios, '13.0'\n\n"

project.targets.each do |target|
  puts "Target #{target} ------------ "
  if pod_files.include? target.display_name
    out_file.puts "target '#{target.display_name}' do"
    out_file.puts(pod_files.fetch(target.display_name))
    out_file.puts "end\n\n"
  end
end

out_file.close
