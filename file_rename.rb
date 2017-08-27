# 指定の拡張子のファイル名を一括変換
# ファイル名に連番をつける

# コマンドライン引数
# 拡張子
ext = ARGV[0]
# 新しいファイル名
new_name = ARGV[1]

# 指定の拡張子を取得する(配列）
target = Dir.glob("*."+ext)

# フォルダに指定のファイルがあるか確認する
if target.size < 1
    puts "指定のファイルがありません" 
    exit    
end

# 新しいファイル名をチェックする
unless new_name !~ /[\?\\\/\*\<\>\"\;\:.|]/
    puts "ファイル名に使えない文字が入っています。"
    exit
end

# ファイル名を変更する
target.size.times do |i|
    File.rename(target[i], new_name+i.to_s+"."+ext)
end

puts "完了しました。"