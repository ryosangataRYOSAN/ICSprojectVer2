0 1 VALUE_EVENT_SET|tenki		VALUE_GET|tenki
1 0 VALUE_EVENT_GET|tenki|0 		<eps>
1 2 VALUE_EVENT_GET|tenki|1 		VALUE_SET|tenki|0

# tenki_yoho_start

2   3 <eps> 					SYNTH_START|mei|mei_voice_normal|現在の東京の天気は曇時々雨です。
3   4 SYNTH_EVENT_STOP|mei		SYNTH_START|mei|mei_voice_normal|明日の東京の天気は晴時々曇です。
4   5 SYNTH_EVENT_STOP|mei		SYNTH_START|mei|mei_voice_normal|明日の東京の最高気温は10度です。
5   6 SYNTH_EVENT_STOP|mei 		SYNTH_START|mei|mei_voice_normal|最低気温は2度です。
6   0 SYNTH_EVENT_STOP|mei 		<eps>

# tenki_yoho_end


