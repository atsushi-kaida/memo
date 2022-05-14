require "csv"

puts "1(新規でメモを作成) 2(既存のメモを編集する) 3(既存のメモに追加する) 4(メモの内容を確認する)"
puts "半角数字で入力してください" 
memo_type = gets.chomp
 
if memo_type.to_i == 1
  puts "作成したいファイル名を拡張子を除いて入力してください"
  file_name = gets.chomp
  
  puts "メモしたい内容を記入してください"
  puts "Enterで改行できます"
  puts "完了したらCtrl+Dを押します"
  
  memo_contents = readlines
  memo_contents.each do |content|
    content.chomp!
  end
  
  CSV.open(file_name+'.csv','w') do |memo|
    memo << memo_contents
  end



elsif memo_type.to_i == 2
  puts "編集したいファイル名を拡張子を除いて入力してください"
  file_name = gets.chomp
  
  i = 1
  memo_contents = CSV.read(file_name+'.csv')
  
  memo_contents.each do |row|
  	row.each do |content|
  		puts i.to_s + ": " + content
  		i += 1
  	end
  end
  
  puts "編集したい番号を入力してください"
  content_number = gets.to_i
  
  puts "編集したい内容を入力してください"
  new_content = gets.chomp!
  
  puts memo_contents[0][content_number-1] + " → " + new_content
  
  memo_contents[0][content_number-1] = new_content
  CSV.open(file_name+'.csv','w') do |content|
    content << memo_contents[0]
  end
  
  
  
elsif memo_type.to_i == 3
  puts "追記したいファイル名を拡張子を除いて入力してください"
  file_name = gets.chomp
  
  puts "追記したい内容を入力してください"
  new_content = gets.chomp!
  
  memo_contents = CSV.read(file_name+'.csv')
  memo_contents[0].append(new_content)
  p memo_contents[0]
  CSV.open(file_name+'.csv','w') do |content|
    content << memo_contents[0]
  end
  
  
  
elsif memo_type.to_i == 4
	puts "確認したいファイル名を拡張子を除いて入力してください"
  file_name = gets.chomp
  p CSV.read(file_name+'.csv')[0]
  
end