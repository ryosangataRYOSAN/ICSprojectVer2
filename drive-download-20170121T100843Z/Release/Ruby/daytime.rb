require 'uri'
require 'date'
require 'kconv'
require 'fileutils'

Encoding.default_external = 'UTF-8'

date = Date.today
time = DateTime.now

wdays = ["日", "月", "火", "水", "木", "金", "土"]

ans_year = date.year.to_s + "年"
ans_date = date.month.to_s + "月" + date.day.to_s + "日"
ans_wday = wdays[date.wday] + "曜日"
ans_time = time.hour.to_s + "時" + time.min.to_s + "分" +time.sec.to_s + "秒"


#print(ans_year)
#print(ans_date)
#print(ans_time)
#print(ans_wday)

#begin

FST_TEXT = <<"EOS"
# daytime_start

# 日付
10  11  <eps>					SYNTH_START|mei|mei_voice_normal|今日は#{ans_year}#{ans_date}#{ans_wday}です

#時間
11  12  SYNTH_EVENT_STOP|mei	SYNTH_START|mei|mei_voice_normal|現在時刻は#{ans_time}です
12  0   SYNTH_EVENT_STOP|mei    <eps>

# daytime_end
EOS

 f = File.open("MMDAgent_Example.fst-daytime.fst")
 content = f.read().gsub(/# daytime_start.*# daytime_end/m, FST_TEXT.toutf8)
 File.open("MMDAgent_Example.fst-daytime.fst", "w") do |f| 
   f.write(content)
#rescue
# exit 1
end
