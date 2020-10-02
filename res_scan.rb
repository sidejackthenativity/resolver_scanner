
filename = ARGV[0]
resolvers = Array.new

File.foreach(filename).with_index do |line, line_num|
  wasGood = system( "dig +short test.openresolver.com TXT @#{line}" )
  if wasGood
    resolvers.push("#{line}")
  end

end

resolvers.each do |i|
  puts i
end
