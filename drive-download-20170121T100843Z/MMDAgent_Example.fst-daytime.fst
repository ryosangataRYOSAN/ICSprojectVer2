0   1   VALUE_EVENT_SET|daytime			VALUE_EVAL|daytime|EQ|1
1   10  VALUE_EVENT_EVAL|daytime|EQ|1|TRUE	<eps>
1   2   VALUE_EVENT_EVAL|daytime|EQ|1|FALSE	VALUE_EVAL|EQ|2
2   20  VALUE_EVENT_EVAL|daytime|EQ|2|TRUE	<eps>
2   3   VALUE_EVENT_EVAL|daytime|EQ|2|FALSE	VALUE_EVAL|EQ|3
3   30  VALUE_EVENT_EVAL|daytime|EQ|3|TRUE	<eps>
3   4   VALUE_EVENT_EVAL|daytime|EQ|3|FALSE	VALUE_EVAL|EQ|4
4   40  VALUE_EVENT_EVAL|daytime|EQ|4|TRUE	<eps>

 
 
 
# daytime_start

# 日付
10  11  <eps>					SYNTH_START|mei|mei_voice_normal|今日は2017年1月24日火曜日です

#時間
11  12  SYNTH_EVENT_STOP|mei	SYNTH_START|mei|mei_voice_normal|現在時刻は12時16分37秒です
12  0   SYNTH_EVENT_STOP|mei    <eps>

# daytime_end

































