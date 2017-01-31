require 'net/http'
require 'uri'
require 'json'
require 'kconv'

Encoding.default_external = 'UTF-8'

uri = URI.parse('http://weather.livedoor.com/forecast/webservice/json/v1?city=130010')#APIでWebから天気情報を取得
json = Net::HTTP.get(uri)                                                             #JSONファイルを取得
result = JSON.parse(json)

=begin
print result['title'], "\n"
print result['link'], "\n"
print "予報の発表日時:#{result['publicTime']}", "\n"
result['forecasts'].each do |forecast| 
  print "--------------------"
  print "予報日:#{forecast['dateLabel']}", "\n"
  print "天気:#{forecast['telop']}", "\n"
  print "最低気温:#{forecast['temperature']['min']}", "\n"
  print "最高気温:#{forecast['temperature']['max']}", "\n"                        #コメント化はずすと表示される
end
=end

#begin

FST_TEXT = <<"EOS"
# tenki_yoho_start

2   3 <eps> 					SYNTH_START|mei|mei_voice_normal|現在の東京の天気は#{result['forecasts'][0]['telop']}です。
3   4 SYNTH_EVENT_STOP|mei		SYNTH_START|mei|mei_voice_normal|明日の東京の天気は#{result['forecasts'][1]['telop']}です。
4   5 SYNTH_EVENT_STOP|mei		SYNTH_START|mei|mei_voice_normal|明日の東京の最高気温は#{result['forecasts'][1]['temperature']['max']['celsius']}度です。
5   6 SYNTH_EVENT_STOP|mei 		SYNTH_START|mei|mei_voice_normal|最低気温は#{result['forecasts'][1]['temperature']['min']['celsius']}度です。
6   0 SYNTH_EVENT_STOP|mei 		<eps>

# tenki_yoho_end
EOS


  f = File.open("MMDAgent_Example.fst-tenki.fst")
  content = f.read().gsub(/# tenki_yoho_start.*# tenki_yoho_end\n/m, FST_TEXT.toutf8)   #サブFSTを上の内容に書き換える
  File.open("MMDAgent_Example.fst-tenki.fst", 'w') do |f|
    f.write(content)
  end
#rescue
 # exit 1
#end