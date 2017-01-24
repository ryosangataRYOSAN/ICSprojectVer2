# ----------------------------------------------------------------- #
#           MMDAgent "Sample Script"                                #
#           released by MMDAgent Project Team                       #
#           http://www.mmdagent.jp/                                 #
# ----------------------------------------------------------------- #
#                                                                   #
#  Copyright (c) 2009-2015  Nagoya Institute of Technology          #
#                           Department of Computer Science          #
#                                                                   #
# Some rights reserved.                                             #
#                                                                   #
# This work is licensed under the Creative Commons Attribution 3.0  #
# license.                                                          #
#                                                                   #
# You are free:                                                     #
#  * to Share - to copy, distribute and transmit the work           #
#  * to Remix - to adapt the work                                   #
# Under the following conditions:                                   #
#  * Attribution - You must attribute the work in the manner        #
#    specified by the author or licensor (but not in any way that   #
#    suggests that they endorse you or your use of the work).       #
# With the understanding that:                                      #
#  * Waiver - Any of the above conditions can be waived if you get  #
#    permission from the copyright holder.                          #
#  * Public Domain - Where the work or any of its elements is in    #
#    the public domain under applicable law, that status is in no   #
#    way affected by the license.                                   #
#  * Other Rights - In no way are any of the following rights       #
#    affected by the license:                                       #
#     - Your fair dealing or fair use rights, or other applicable   #
#       copyright exceptions and limitations;                       #
#     - The author's moral rights;                                  #
#     - Rights other persons may have either in the work itself or  #
#       in how the work is used, such as publicity or privacy       #
#       rights.                                                     #
#  * Notice - For any reuse or distribution, you must make clear to #
#    others the license terms of this work. The best way to do this #
#    is with a link to this web page.                               #
#                                                                   #
# See http://creativecommons.org/ for details.                      #
# ----------------------------------------------------------------- #

# 1st field: state before transition
# 2nd field: state after transition
# 3rd field: event (input message)
# 4th field: command (output message)
#
# Model
# MODEL_ADD|(model alias)|(model file name)|(x position),(y position),(z position)|(x rotation),(y rotation),(z rotation)|(ON or OFF for cartoon)|(parent model alias)|(parent bone name)
# MODEL_CHANGE|(model alias)|(model file name)
# MODEL_DELETE|(model alias)
# MODEL_EVENT_ADD|(model alias)
# MODEL_EVENT_CHANGE|(model alias)
# MODEL_EVENT_DELETE|(model alias)
#
# Motion
# MOTION_ADD|(model alias)|(motion alias)|(motion file name)|(FULL or PART)|(ONCE or LOOP)|(ON or OFF for smooth)|(ON or OFF for repos)
# MOTION_ACCELERATE|(model alias)|(motion alias)|(speed)|(duration)|(specified time for end)
# MOTION_CHANGE|(model alias)|(motion alias)|(motion file name)
# MOTION_DELETE|(mpdel alias)|(motion alias)
# MOTION_EVENT_ADD|(model alias)|(motion alias)
# MOTION_EVENT_ACCELERATE|(model alias)|(motion alias)
# MOTION_EVENT_CHANGE|(model alias)|(motion alias)
# MOTION_EVENT_DELETE|(model alias)|(motion alias)
#
# Move and Rotate
# MOVE_START|(model alias)|(x position),(y position),(z position)|(GLOBAL or LOCAL position)|(move speed)
# MOVE_STOP|(model alias)
# MOVE_EVENT_START|(model alias)
# MOVE_EVENT_STOP|(model alias)
# TURN_START|(model alias)|(x position),(y position),(z position)|(GLOBAL or LOCAL position)|(rotation speed)
# TURN_STOP|(model alias)
# TURN_EVENT_START|(model alias)
# TURN_EVENT_STOP|(model alias)
# ROTATE_START|(model alias)|(x rotation),(y rotaion),(z rotation)|(GLOBAL or LOCAL rotation)|(rotation speed)
# ROTATE_STOP|(model alias)
# ROTATE_EVENT_START|(model alias)
# ROTATE_EVENT_STOP|(model alias)
#
# Sound
# SOUND_START|(sound alias)|(sound file name)
# SOUND_STOP|(sound alias)
# SOUND_EVENT_START|(sound alias)
# SOUND_EVENT_STOP|(sound alias)
#
# Stage
# STAGE|(stage file name)
# STAGE|(bitmap file name for floor),(bitmap file name for background)
#
# Light
# LIGHTCOLOR|(red),(green),(blue)
# LIGHTDIRECTION|(x position),(y position),(z position)
#
# Camera
# CAMERA|(x position),(y position),(z position)|(x rotation),(y rotation),(z rotation)|(distance)|(fovy)|(time)
# CAMERA|(motion file name)
#
# Speech recognition
# RECOG_EVENT_START
# RECOG_EVENT_STOP|(word sequence)
# RECOG_MODIFY|GAIN|(ratio)
# RECOG_MODIFY|USERDICT_SET|(dictionary file name)
# RECOG_MODIFY|USERDICT_UNSET
#
# Speech synthesis
# SYNTH_START|(model alias)|(voice alias)|(synthesized text)
# SYNTH_STOP|(model alias)
# SYNTH_EVENT_START|(model alias)
# SYNTH_EVENT_STOP|(model alias)
# LIPSYNC_START|(model alias)|(phoneme and millisecond pair sequence)
# LIPSYNC_STOP|(model alias)
# LIPSYNC_EVENT_START|(model alias)
# LIPSYNC_EVENT_STOP|(model alias)
#
# Variable
# VALUE_SET|(variable alias)|(value)
# VALUE_SET|(variable alias)|(minimum value for random)|(maximum value for random)
# VALUE_UNSET|(variable alias)
# VALUE_EVAL|(variable alias)|(EQ or NE or LE or LT or GE or GT for evaluation)|(value)
# VALUE_EVENT_SET|(variable alias)
# VALUE_EVENT_UNSET|(variable alias)
# VALUE_EVENT_EVAL|(variable alias)|(EQ or NE or LE or LT or GE or GT for evaluation)|(value)|(TRUE or FALSE)
# TIMER_START|(count down alias)|(value)
# TIMER_STOP|(count down alias)
# TIMER_EVENT_START|(count down alias)
# TIMER_EVENT_STOP|(count down alias)
#
# Plugin
# PLUGIN_ENABLE|(plugin name)
# PLUGIN_DISABLE|(plugin name)
# PLUGIN_EVENT_ENABLE|(plugin name)
# PLUGIN_EVENT_DISABLE|(plugin name)
#
# Other events
# DRAGANDDROP|(file name)
# KEY|(key name)
#
# Other commands
# EXECUTE|(file name)
# KEY_POST|(window class name)|(key name)|(ON or OFF for shift-key)|(ON or OFF for ctrl-key)|(On or OFF for alt-key)

# 0011-0020 Initialization

0    11   <eps>                               MODEL_ADD|bootscreen|Accessory\bootscreen\bootscreen.pmd|0.0,12.85,17.6|0.0,0.0,0.0|OFF
11   12   MODEL_EVENT_ADD|bootscreen          MODEL_ADD|mei|Model\mei\mei.pmd|-8.0,0.0,-14.0
#11   12   <eps>           		      MODEL_ADD|menu|Accessory\menu\menu.pmd|4.0,0.5,0.0|0.0,0.0,0.0|ON|mei
12   13   <eps>                               MOTION_ADD|menu|rotate|Motion\menu_rotation\menu_rotation.vmd|FULL|LOOP|OFF|OFF
13   14   <eps>                               STAGE|Stage\building2\floor.bmp,Stage\building2\background.bmp
14   15   <eps>                               MOTION_ADD|mei|base|Motion\mei_wait\mei_wait.vmd|FULL|LOOP|ON|OFF
15   16   <eps>                               TIMER_START|bootscreen|1.5
16   2    TIMER_EVENT_STOP|bootscreen         MODEL_DELETE|bootscreen

# 0021-0030 Idle behavior

2    21   <eps>                               TIMER_START|idle1|20
21   22   TIMER_EVENT_START|idle1             TIMER_START|idle2|40
22   23   TIMER_EVENT_START|idle2             TIMER_START|idle3|60
23   1    TIMER_EVENT_START|idle3             VALUE_SET|random|0|100
1    1    RECOG_EVENT_START                   MOTION_ADD|mei|listen|Expression\mei_listen\mei_listen.vmd|PART|ONCE
1    1    TIMER_EVENT_STOP|idle1              MOTION_ADD|mei|idle|Motion\mei_idle\mei_idle_boredom.vmd|PART|ONCE
1    1    TIMER_EVENT_STOP|idle2              MOTION_ADD|mei|idle|Motion\mei_idle\mei_idle_touch_clothes.vmd|PART|ONCE
1    2    TIMER_EVENT_STOP|idle3              MOTION_ADD|mei|idle|Motion\mei_idle\mei_idle_think.vmd|PART|ONCE

# 0031-0040 Hello

1    31   RECOG_EVENT_STOP|こんにちは         SYNTH_START|mei|mei_voice_normal|こんにちは。
1    31   RECOG_EVENT_STOP|こんにちわ         SYNTH_START|mei|mei_voice_normal|こんにちは。
31   32   <eps>                               MOTION_ADD|mei|action|Motion\mei_greeting\mei_greeting.vmd|PART|ONCE
32   2    SYNTH_EVENT_STOP|mei                <eps>



# 0041-0050 Self introduction

1    41   RECOG_EVENT_STOP|自己紹介           SYNTH_START|mei|mei_voice_normal|ひーちゃんと言います。
1    41   RECOG_EVENT_STOP|あなた,誰          SYNTH_START|mei|mei_voice_normal|ひーちゃんと言います。
1    41   RECOG_EVENT_STOP|君,誰              SYNTH_START|mei|mei_voice_normal|ひーちゃんと言います。
41   42   <eps>                               MOTION_ADD|mei|action|Motion\mei_self_introduction\mei_self_introduction.vmd|PART|ONCE
42   43   SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|よろしくお願いします。
43   2    SYNTH_EVENT_STOP|mei                <eps>

# 0051-0060 Thank you

1    51   RECOG_EVENT_STOP|ありがと           SYNTH_START|mei|mei_voice_angry|どういたしまして。
1    51   RECOG_EVENT_STOP|ありがとう         SYNTH_START|mei|mei_voice_angry|どういたしまして。
1    51   RECOG_EVENT_STOP|有難う             SYNTH_START|mei|mei_voice_normal|どういたしまして。
1    51   RECOG_EVENT_STOP|有り難う           SYNTH_START|mei|mei_voice_normal|どういたしまして。
51   52   <eps>                               MOTION_ADD|mei|expression|Expression\mei_happiness\mei_happiness.vmd|PART|ONCE
52   53   SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_happy|いつでも、話しかけてくださいね。
53   54   <eps>                               MOTION_CHANGE|mei|base|Motion\mei_guide\mei_guide_happy.vmd
54   2    SYNTH_EVENT_STOP|mei                MOTION_CHANGE|mei|base|Motion\mei_wait\mei_wait.vmd

# 0061-0070 Positive comments

1    61   RECOG_EVENT_STOP|可愛い             VALUE_EVAL|random|LE|80
1    61   RECOG_EVENT_STOP|かわいい           VALUE_EVAL|random|LE|80
1    61   RECOG_EVENT_STOP|綺麗               VALUE_EVAL|random|LE|80
1    61   RECOG_EVENT_STOP|きれい             VALUE_EVAL|random|LE|80
61   62   VALUE_EVENT_EVAL|random|LE|80|TRUE  SYNTH_START|mei|mei_voice_bashful|ありがとう。
61   62   VALUE_EVENT_EVAL|random|LE|80|FALSE SYNTH_START|mei|mei_voice_bashful|ありがとう。
62   63   <eps>                               MOTION_ADD|mei|expression|Expression\mei_bashfulness\mei_bashfulness.vmd|PART|ONCE
63   2    SYNTH_EVENT_STOP|mei                <eps>

# daytime

1   71  KEY|/		          	            SYNTH_START|mei|mei_voice_normal|少々お待ちください。
1   71  RECOG_EVENT_STOP|日付               SYNTH_START|mei|mei_voice_normal|少々お待ちください。
71  72  SYNTH_EVENT_STOP|mei                EXECUTE|daytime.exe
72  73  <eps>				                TIMER_START|wait|5
73  74  TIMER_EVENT_STOP|wait               FST_RELOAD|MMDAgent_Example.fst-daytime.fst
74 75  <eps>				                TIMER_START|wait|3
75  2   TIMER_EVENT_STOP|wait				VALUE_SET|daytime|1

# tenki

1    75  KEY|\		                        SYNTH_START|mei|mei_voice_normal|少々お待ちください。
1    75  RECOG_EVENT_STOP|天気予報          SYNTH_START|mei|mei_voice_normal|少々お待ちください。
75   76  SYNTH_EVENT_STOP|mei               EXECUTE|tenki.exe
76   77  <eps>				    			TIMER_START|wait|5
77   78  TIMER_EVENT_STOP|wait              FST_RELOAD|MMDAgent_Example.fst-tenki.fst
78   79  <eps>				    			TIMER_START|wait|3
79   2    TIMER_EVENT_STOP|wait		     	VALUE_SET|tenki|1

# 0091-0100 Bye

1    91   RECOG_EVENT_STOP|バイバイ           SYNTH_START|mei|mei_voice_normal|さようなら。
1    91   RECOG_EVENT_STOP|さようなら         SYNTH_START|mei|mei_voice_normal|さようなら。
1    91   RECOG_EVENT_STOP|さよなら           SYNTH_START|mei|mei_voice_normal|さようなら。
91   92   <eps>                               MOTION_ADD|mei|action|Motion\mei_bye\mei_bye.vmd|PART|ONCE
92   2    SYNTH_EVENT_STOP|mei                <eps>

# 0101-0110 Browsing

1    101  RECOG_EVENT_STOP|ホームページ       EXECUTE|http://www.tmu.ac.jp/
1    101  RECOG_EVENT_STOP|ＭＭＤＡｇｅｎｔ   EXECUTE|http://www.tmu.ac.jp/
101  102  <eps>                               SYNTH_START|mei|mei_voice_normal|首都大学東京の、ホームページを表示します。
102  2    SYNTH_EVENT_STOP|mei                <eps>

# 0111-0120 Screen

1    111  RECOG_EVENT_STOP|フルスクリーン     KEY_POST|MMDAgent|F|OFF
111  112  <eps>                               SYNTH_START|mei|mei_voice_normal|スクリーンの設定を、変更しました。
112  2    SYNTH_EVENT_STOP|mei                <eps>

# 1001-1200 研究室

#1    1001  KEY|  		               SYNTH_START|mei|mei_voice_normal|研究室の紹介ですね。
1    1001  RECOG_EVENT_STOP|研究,室            SYNTH_START|mei|mei_voice_normal|研究室の紹介ですね。
1    1001  RECOG_EVENT_STOP|研究               SYNTH_START|mei|mei_voice_normal|研究室の紹介ですね。
1    1001  RECOG_EVENT_STOP|研究,室,紹介       SYNTH_START|mei|mei_voice_normal|研究室の紹介ですね。
1001 1002  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|情報通信システムコースの研究室は、通信システム分野、情報システム分野、メディア情報処理分野、の３つに分かれています。
1002 1003  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|通信システム分野は、阿保研、田川研、大久保研、柴田研、があります。
1003 1004  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|情報システム分野は、石川研、福本研、三浦研、片山研、小町研、があります。
1004 1005  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|メディア情報処理分野は、貴家研、高間研、山口研、西川研、があります。
1005 2     SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|知りたい研究室の先生の名前をおっしゃってください。

# 1011-1020 阿保研

#1    1011  KEY|     	 	               MOTION_ADD|mei|action|Motion\mei_point\mei_point_lef_top.vmd|PART|ONCE
1    1011  RECOG_EVENT_STOP|あぼ,研究室        MOTION_ADD|mei|action|Motion\mei_point\mei_point_lef_top.vmd|PART|ONCE
1    1011  RECOG_EVENT_STOP|あぼ               MOTION_ADD|mei|action|Motion\mei_point\mei_point_lef_top.vmd|PART|ONCE
1011 1012  <eps>			       MODEL_ADD|abo|Image\professors\abo.pmd|4.0,4.0,2.5|0.0,0.0,0.0|ON|mei
1012 1013  <eps>			       SYNTH_START|mei|mei_voice_normal|阿保研究室は電波や光を利用した遠隔環境情報計測及びその情報を伝送するシステムの研究をしています。
1013 2     SYNTH_EVENT_STOP|mei                MODEL_DELETE|abo

# 1021-1030 田川研

#1    1021  KEY|      	 	               MOTION_ADD|mei|action|Motion\mei_point\mei_point_lef_top.vmd|PART|ONCE
1    1021  RECOG_EVENT_STOP|田川               MOTION_ADD|mei|action|Motion\mei_point\mei_point_lef_top.vmd|PART|ONCE
1    1021  RECOG_EVENT_STOP|田川,研究室        MOTION_ADD|mei|action|Motion\mei_point\mei_point_lef_top.vmd|PART|ONCE
1021 1022  <eps>			       MODEL_ADD|tagawa|Image\professors\tagawa.pmd|4.0,4.0,2.5|0.0,0.0,0.0|ON|mei
1022 1023  <eps>			       SYNTH_START|mei|mei_voice_normal|田川研究室はコンピュータビジョン、画像応用技術、超音波信号処理の研究をしています。
1023 2     SYNTH_EVENT_STOP|mei                MODEL_DELETE|tagawa

# 1031-1040 大久保研

#1    1031  KEY|      	 	               MOTION_ADD|mei|action|Motion\mei_point\mei_point_lef_top.vmd|PART|ONCE
1    1031  RECOG_EVENT_STOP|大久保             MOTION_ADD|mei|action|Motion\mei_point\mei_point_lef_top.vmd|PART|ONCE
1    1031  RECOG_EVENT_STOP|大久保,研究室      MOTION_ADD|mei|action|Motion\mei_point\mei_point_lef_top.vmd|PART|ONCE
1031 1032  <eps>			       MODEL_ADD|okubo|Image\professors\okubo.pmd|4.0,4.0,2.5|0.0,0.0,0.0|ON|mei
1032 1033  <eps>			       SYNTH_START|mei|mei_voice_normal|大久保研究室は信号解析、数値シミュレーション、電磁界計測の研究をしています。
1033 2     SYNTH_EVENT_STOP|mei                MODEL_DELETE|okubo

# 1041-1050 柴田研

#1    1041  KEY|      	 	               MOTION_ADD|mei|action|Motion\mei_point\mei_point_lef_top.vmd|PART|ONCE
1    1041  RECOG_EVENT_STOP|柴田               MOTION_ADD|mei|action|Motion\mei_point\mei_point_lef_top.vmd|PART|ONCE
1    1041  RECOG_EVENT_STOP|柴田,研究室        MOTION_ADD|mei|action|Motion\mei_point\mei_point_lef_top.vmd|PART|ONCE
1041 1042  <eps>			       MODEL_ADD|shibata|Image\professors\shibata.pmd|4.0,4.0,2.5|0.0,0.0,0.0|ON|mei
1042 1043  <eps>			       SYNTH_START|mei|mei_voice_normal|柴田研究室は地球・都市環境問題に役立つリモートセンシングシステムの研究をしています。
1043 2     SYNTH_EVENT_STOP|mei                MODEL_DELETE|shibata


# 1051-1060 石川研

#1    1051  KEY|      	 	               MOTION_ADD|mei|action|Motion\mei_point\mei_point_lef_top.vmd|PART|ONCE
1    1051  RECOG_EVENT_STOP|石川               MOTION_ADD|mei|action|Motion\mei_point\mei_point_lef_top.vmd|PART|ONCE
1    1051  RECOG_EVENT_STOP|石川,研究室        MOTION_ADD|mei|action|Motion\mei_point\mei_point_lef_top.vmd|PART|ONCE
1051 1052  <eps>			       MODEL_ADD|ishikawa|Image\professors\ishikawa.pmd|4.0,4.0,2.5|0.0,0.0,0.0|ON|mei
1052 1053  <eps>			       SYNTH_START|mei|mei_voice_normal|石川研究室はソーシャルメディアや実世界との相互作用から生まれる大量データを有機的、効率的に解析し、新しい価値を発見する技術の研究をしています。
1053 2     SYNTH_EVENT_STOP|mei                MODEL_DELETE|ishikawa

# 1061-1070 福本研

#1    1061  KEY|      	 	               MOTION_ADD|mei|action|Motion\mei_point\mei_point_lef_top.vmd|PART|ONCE
1    1061  RECOG_EVENT_STOP|福本               MOTION_ADD|mei|action|Motion\mei_point\mei_point_lef_top.vmd|PART|ONCE
1    1061  RECOG_EVENT_STOP|福本,研究室        MOTION_ADD|mei|action|Motion\mei_point\mei_point_lef_top.vmd|PART|ONCE
1061 1062  <eps>			       MODEL_ADD|fukumoto|Image\professors\fukumoto.pmd|4.0,4.0,2.5|0.0,0.0,0.0|ON|mei
1062 1063  <eps>			       SYNTH_START|mei|mei_voice_normal|福本研究室は自己回復能力をもつVLSIの構成・評価に関する研究,並列・分散システムの障害回復機能を実現するアルゴリズム・プロトコルの研究をしています。
1063 2     SYNTH_EVENT_STOP|mei                MODEL_DELETE|fukumoto

# 1071-1080 三浦研

#1    1071  KEY|      	 	               MOTION_ADD|mei|action|Motion\mei_point\mei_point_lef_top.vmd|PART|ONCE
1    1071  RECOG_EVENT_STOP|三浦               MOTION_ADD|mei|action|Motion\mei_point\mei_point_lef_top.vmd|PART|ONCE
1071 1072  <eps>			       MODEL_ADD|miura|Image\professors\miura.pmd|4.0,4.0,2.5|0.0,0.0,0.0|ON|mei
1072 1073  <eps>			       SYNTH_START|mei|mei_voice_normal|三浦研究室は高信頼性VLSIの設計に関する研究 、VLSIの故障モデル化と効率テストに関する研究をしています。
1073 2     SYNTH_EVENT_STOP|mei                MODEL_DELETE|miura

# 1081-1090 片山研

#1    1081  KEY|      	 	               MOTION_ADD|mei|action|Motion\mei_point\mei_point_lef_top.vmd|PART|ONCE
1    1081  RECOG_EVENT_STOP|片山               MOTION_ADD|mei|action|Motion\mei_point\mei_point_lef_top.vmd|PART|ONCE
1081 1082  <eps>			       MODEL_ADD|katayama|Image\professors\katayama.pmd|4.0,4.0,2.5|0.0,0.0,0.0|ON|mei
1082 1083  <eps>			       SYNTH_START|mei|mei_voice_normal|片山研究室は数値的・組合せ的方法による大規模データの効率的な検索技術の開発をしています。
1083 2     SYNTH_EVENT_STOP|mei                MODEL_DELETE|katayama

# 1091-1100小町研

#1    1091  KEY|      	 	               MOTION_ADD|mei|action|Motion\mei_point\mei_point_lef_top.vmd|PART|ONCE
1    1091  RECOG_EVENT_STOP|小町               MOTION_ADD|mei|action|Motion\mei_point\mei_point_lef_top.vmd|PART|ONCE
1091 1092  <eps>			       MODEL_ADD|komachi|Image\professors\komachi.pmd|4.0,4.0,2.5|0.0,0.0,0.0|ON|mei
1092 1093  <eps>			       SYNTH_START|mei|mei_voice_normal|小町研究室は自然言語処理、ウェブマイニング、言語学習支援の研究をしています。
1093 2     SYNTH_EVENT_STOP|mei                MODEL_DELETE|komachi

# 1101-1110 貴家研


#1    1101  KEY|      	 	               MOTION_ADD|mei|action|Motion\mei_point\mei_point_lef_top.vmd|PART|ONCE
1    1101  RECOG_EVENT_STOP|貴家               MOTION_ADD|mei|action|Motion\mei_point\mei_point_lef_top.vmd|PART|ONCE
1    1101  RECOG_EVENT_STOP|貴家,研究室        MOTION_ADD|mei|action|Motion\mei_point\mei_point_lef_top.vmd|PART|ONCE
1101 1102  <eps>			       MODEL_ADD|kiya|Image\professors\kiya.pmd|4.0,4.0,2.5|0.0,0.0,0.0|ON|mei
1102 1103  <eps>			       SYNTH_START|mei|mei_voice_normal|きや研究室はハリウッドを中心に、編集・配信を含めて映画のすべての処理をディジタル技術により行う研究が進められています。
1103 2     SYNTH_EVENT_STOP|mei                MODEL_DELETE|kiya


# 1111-1120 山口研


#1    1111  KEY|     	 	               MOTION_ADD|mei|action|Motion\mei_point\mei_point_lef_top.vmd|PART|ONCE
1    1111  RECOG_EVENT_STOP|山口               MOTION_ADD|mei|action|Motion\mei_point\mei_point_lef_top.vmd|PART|ONCE
1    1111  RECOG_EVENT_STOP|山口,研            MOTION_ADD|mei|action|Motion\mei_point\mei_point_lef_top.vmd|PART|ONCE
1111 1112  <eps>			       MODEL_ADD|yamaguchi|Image\professors\yamaguchi.pmd|4.0,4.0,2.5|0.0,0.0,0.0|ON|mei
1112 1113  <eps>			       SYNTH_START|mei|mei_voice_normal|山口研究室は、人との親和性の高い機能を実現する、メディアシステムを構築するための基盤となる、知能情報処理技術に関する研究をしています。
1113 2     SYNTH_EVENT_STOP|mei                MODEL_DELETE|yamaguchi

# 1121-1130 高間研


#1    1121  KEY|      	 	               MOTION_ADD|mei|action|Motion\mei_point\mei_point_lef_top.vmd|PART|ONCE
1    1121  RECOG_EVENT_STOP|高間               MOTION_ADD|mei|action|Motion\mei_point\mei_point_lef_top.vmd|PART|ONCE
1    1121  RECOG_EVENT_STOP|高間,研            MOTION_ADD|mei|action|Motion\mei_point\mei_point_lef_top.vmd|PART|ONCE
1121 1122  <eps>			       MODEL_ADD|takama|Image\professors\takama.pmd|4.0,4.0,2.5|0.0,0.0,0.0|ON|mei
1122 1123  <eps>			       SYNTH_START|mei|mei_voice_normal|高間研究室はWebに代表される情報環境・情報リソースを活用し、我々の知的活動・創造的活動を支援するための知識処理システムについて研究しています。
1123 2     SYNTH_EVENT_STOP|mei                MODEL_DELETE|takama

# 1131-1140 西川研


#1    1131  KEY|     	 	               MOTION_ADD|mei|action|Motion\mei_point\mei_point_lef_top.vmd|PART|ONCE
1    1131  RECOG_EVENT_STOP|西川               MOTION_ADD|mei|action|Motion\mei_point\mei_point_lef_top.vmd|PART|ONCE
1    1131  RECOG_EVENT_STOP|西川,研究室        MOTION_ADD|mei|action|Motion\mei_point\mei_point_lef_top.vmd|PART|ONCE
1131 1132  <eps>			       MODEL_ADD|nishikawa|Image\professors\nishikawa.pmd|4.0,4.0,2.5|0.0,0.0,0.0|ON|mei
1132 1133  <eps>			       SYNTH_START|mei|mei_voice_normal|西川研究室はメディア情報配信に特化したインターネットプロトコルの設計などを通して、効率のよい配信方法を研究しています。
1133 2     SYNTH_EVENT_STOP|mei                MODEL_DELETE|nishikawa



# 1201-1300連絡バス

#1    1201  KEY|			       SYNTH_START|mei|mei_voice_normal|日野キャンパスの連絡バスについてですね。
1    1201  RECOG_EVENT_STOP|バス               SYNTH_START|mei|mei_voice_normal|日野キャンパスの連絡バスについてですね。
1    1201  RECOG_EVENT_STOP|ばす               SYNTH_START|mei|mei_voice_normal|日野キャンパスの連絡バスについてですね。
1    1201  RECOG_EVENT_STOP|連絡バス           SYNTH_START|mei|mei_voice_normal|日野キャンパスの連絡バスについてですね。
1201 2     SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|連絡バスの説明が知りたいかたは、説明、バス停の場所が知りたいかたは、バス停、出発予定時刻が知りたいかたは、時刻、とおっしゃってください。


# 1202-1210連絡バスの説明

#1    1203  KEY|			       SYNTH_START|mei|mei_voice_normal|連絡バスについての説明ですね。
1    1203  RECOG_EVENT_STOP|説明               SYNTH_START|mei|mei_voice_normal|連絡バスについての説明ですね。
1    1203  RECOG_EVENT_STOP|せつめい           SYNTH_START|mei|mei_voice_normal|連絡バスについての説明ですね。
1203 1204  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|連絡バスは、南大沢キャンパスと、日野キャンパスおよび、りえんと多摩平を結んで、主に授業日に運行しております。所要時間は３０分から４０分です。
1204 1205  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|運賃は無料で、乗車時に学生のかたは、学生証を、教職員のかたは、職員証を、乗務員に提示してください。
1205 2     SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|引き続き、バス停の場所が知りたいかたは、バス停、出発予定時刻が知りたいかたは、時刻、終了するかたは、終了、とおっしゃってください。

# 1211-1220バス停の場所

#1    1211  KEY|			       SYNTH_START|mei|mei_voice_normal|バス停の場所についてですね。
1    1211  RECOG_EVENT_STOP|バス停             SYNTH_START|mei|mei_voice_normal|バス停の場所についてですね。
1    1211  RECOG_EVENT_STOP|バスてい           SYNTH_START|mei|mei_voice_normal|バス停の場所についてですね。
1211 1212  SYNTH_EVENT_STOP|mei                MOTION_ADD|mei|action|Motion\mei_point\mei_point_lef_top.vmd|PART|ONCE
1212 1213  <eps>      		 	       MODEL_ADD|minami|Image\bus\minami.pmd|8.0,6.0,2.5|0.0,0.0,0.0|ON|mei
1213 1214  <eps>                               SYNTH_START|mei|mei_voice_normal|南大沢キャンパス,東は、南大沢キャンパス構内、９から１０号館間の北側道路部分に設置してあります。
1214 1215  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|南大沢キャンパス,西は、６号館地下駐車場入口に設置してあります。
1215 1216  SYNTH_EVENT_STOP|mei                MODEL_DELETE|minami
1216 1217  MODEL_EVENT_DELETE|minami	       MOTION_ADD|mei|action|Motion\mei_point\mei_point_lef_top.vmd|PART|ONCE
1217 1218  <eps>		               MODEL_ADD|hino|Image\bus\hino.pmd|8.0,6.0,2.5|0.0,0.0,0.0|ON|mei
1218 1219  <eps>                               SYNTH_START|mei|mei_voice_normal|日野キャンパスは、２号館前の掲示板の前に設置してあります。
1219 1220  SYNTH_EVENT_STOP|mei                MODEL_DELETE|hino
1220 1221  MODEL_EVENT_DELETE|hino             MOTION_ADD|mei|action|Motion\mei_point\mei_point_lef_top.vmd|PART|ONCE
1221 1222  <eps>			       MODEL_ADD|riento|Image\bus\riento.pmd|8.0,6.0,2.5|0.0,0.0,0.0|ON|mei
1222 1223  <eps>                               SYNTH_START|mei|mei_voice_normal|りえんと多摩平は、日野キャンパスの南側道路上に設置してあります。
1223 2     SYNTH_EVENT_STOP|mei                MODEL_DELETE|riento


# 1231-1290出発予定時刻

#1    1231  KEY|			       SYNTH_START|mei|mei_voice_normal|出発予定時刻についてですね。
1    1231  RECOG_EVENT_STOP|時刻   	       SYNTH_START|mei|mei_voice_normal|出発予定時刻についてですね。
1    1231  RECOG_EVENT_STOP|じこく   	       SYNTH_START|mei|mei_voice_normal|出発予定時刻についてですね。
1231 1232  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|ご乗車するバス停はどこですか？南大沢キャンパス,東からご乗車される場合は、東、南大沢キャンパス,西からご乗車さえる場合は、西、日野キャンパスからご乗車される場合は、日野、りえんと多摩平からご乗車される場合は、りえんと、とおっしゃってください。


#1232 1233  KEY|		   	       SYNTH_START|mei|mei_voice_normal|南大沢キャンパス,東、からのご乗車ですね。
1232 1233  RECOG_EVENT_STOP|東   	       SYNTH_START|mei|mei_voice_normal|南大沢キャンパス,東、からのご乗車ですね。
1232 1233  RECOG_EVENT_STOP|ひがし             SYNTH_START|mei|mei_voice_normal|南大沢キャンパス,東、からのご乗車ですね。
1233 1234  SYNTH_EVENT_STOP|mei 	       SYNTH_START|mei|mei_voice_normal|今は何時代ですか？２４時間表記で数字を教えてください。
#1234 1235  KEY|		   	       SYNTH_START|mei|mei_voice_normal|7時代ですと、45分発のバスがあります。その次は8時40分発になります。
1234 1235  RECOG_EVENT_STOP|7   	       SYNTH_START|mei|mei_voice_normal|7時代ですと、45分発のバスがあります。その次は8時40分発になります。
1234 1235  RECOG_EVENT_STOP|8 	  	       SYNTH_START|mei|mei_voice_normal|8時代ですと、40分発のバスがあります。その次は9時20分発になります。
1234 1235  RECOG_EVENT_STOP|9   	       SYNTH_START|mei|mei_voice_normal|9時代ですと、20分と50分発のバスがあります。その次は10時30分発になります。
1234 1235  RECOG_EVENT_STOP|10  	       SYNTH_START|mei|mei_voice_normal|10時代ですと、30分発のバスがあります。その次は12時20分発になります。
1234 1235  RECOG_EVENT_STOP|12  	       SYNTH_START|mei|mei_voice_normal|12時代ですと、20分発のバスがあります。その次は13時発になります。
1234 1235  RECOG_EVENT_STOP|13  	       SYNTH_START|mei|mei_voice_normal|13時代ですと、00分と50分発のバスがあります。その次は14時40分発になります。
1234 1235  RECOG_EVENT_STOP|14   	       SYNTH_START|mei|mei_voice_normal|14時代ですと、40分発のバスがあります。その次は15時30分発になります。
1234 1235  RECOG_EVENT_STOP|15  	       SYNTH_START|mei|mei_voice_normal|15時代ですと、30分と55分発のバスがあります。その次は17時発になります。
1234 1235  RECOG_EVENT_STOP|17  	       SYNTH_START|mei|mei_voice_normal|17時代ですと、00分と30分発のバスがあります。その次は18時40分発になります。
1234 1235  RECOG_EVENT_STOP|18  	       SYNTH_START|mei|mei_voice_normal|18時代ですと、40分発のバスがあります。これが最終便となります。
1235 2     SYNTH_EVENT_STOP|mei		       <eps>



#1232 1236  KEY|		   	       SYNTH_START|mei|mei_voice_normal|南大沢キャンパス,西、からのご乗車ですね。
1232 1236  RECOG_EVENT_STOP|西   	       SYNTH_START|mei|mei_voice_normal|南大沢キャンパス,西、からのご乗車ですね。
1232 1236  RECOG_EVENT_STOP|にし               SYNTH_START|mei|mei_voice_normal|南大沢キャンパス,西、からのご乗車ですね。
1236 1237  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|今は何時代ですか？２４時間表記で数字を教えてください。
1237 1238  RECOG_EVENT_STOP|6    	       SYNTH_START|mei|mei_voice_normal|この時間帯にバスはありません。次のバスは7時47分発になります。
1237 1238  RECOG_EVENT_STOP|7   	       SYNTH_START|mei|mei_voice_normal|7時代ですと、47分発のバスがあります。その次は8時42分発になります。
1237 1238  RECOG_EVENT_STOP|8 	  	       SYNTH_START|mei|mei_voice_normal|8時代ですと、42分発のバスがあります。その次は9時22分発になります。
1237 1238  RECOG_EVENT_STOP|9   	       SYNTH_START|mei|mei_voice_normal|9時代ですと、22分と52分発のバスがあります。その次は10時32分発になります。
1237 1238  RECOG_EVENT_STOP|10  	       SYNTH_START|mei|mei_voice_normal|10時代ですと、32分発のバスがあります。その次は12時22分発になります。
1237 1238  RECOG_EVENT_STOP|11    	       SYNTH_START|mei|mei_voice_normal|この時間帯にバスはありません。次のバスは12時22分発になります。
1237 1238  RECOG_EVENT_STOP|12  	       SYNTH_START|mei|mei_voice_normal|12時代ですと、22分発のバスがあります。その次は13時2分発になります。
1237 1238  RECOG_EVENT_STOP|13  	       SYNTH_START|mei|mei_voice_normal|13時代ですと、2分と52分発のバスがあります。その次は14時42分発になります。
1237 1238  RECOG_EVENT_STOP|14   	       SYNTH_START|mei|mei_voice_normal|14時代ですと、42分発のバスがあります。その次は15時32分発になります。
1237 1238  RECOG_EVENT_STOP|15  	       SYNTH_START|mei|mei_voice_normal|15時代ですと、32分と57分発のバスがあります。その次は17時2分発になります。
1237 1238  RECOG_EVENT_STOP|16    	       SYNTH_START|mei|mei_voice_normal|この時間帯にバスはありません。次のバスは17時2分になります。
1237 1238  RECOG_EVENT_STOP|17  	       SYNTH_START|mei|mei_voice_normal|17時代ですと、2分と32分発のバスがあります。その次は18時42分発になります。
1237 1238  RECOG_EVENT_STOP|18  	       SYNTH_START|mei|mei_voice_normal|18時代ですと、42分発のバスがあります。これが最終便となります。
1237 1238  RECOG_EVENT_STOP|19    	       SYNTH_START|mei|mei_voice_normal|この時間帯にバスはありません。今日の連絡バスは終了いたしました。
1237 1238  RECOG_EVENT_STOP|20    	       SYNTH_START|mei|mei_voice_normal|この時間帯にバスはありません。今日の連絡バスは終了いたしました。
1237 1238  RECOG_EVENT_STOP|21    	       SYNTH_START|mei|mei_voice_normal|この時間帯にバスはありません。今日の連絡バスは終了いたしました。
1238 2     SYNTH_EVENT_STOP|mei		       <eps>






#1232 1239  KEY|		   	       SYNTH_START|mei|mei_voice_normal|日野キャンパス、からのご乗車ですね。
1232 1239  RECOG_EVENT_STOP|日野  	       SYNTH_START|mei|mei_voice_normal|日野キャンパス、からのご乗車ですね。
1232 1239  RECOG_EVENT_STOP|ひの               SYNTH_START|mei|mei_voice_normal|日野キャンパス、からのご乗車ですね。
1239 1240  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|今は何時代ですか？２４時間表記で数字を教えてください。
1240 1241  RECOG_EVENT_STOP|6   	       SYNTH_START|mei|mei_voice_normal|この時間帯にバスはありません。次のバスは7時50分発になります。
1240 1241  RECOG_EVENT_STOP|7   	       SYNTH_START|mei|mei_voice_normal|7時代ですと、50分発のバスがあります。その次は8時40分発になります。
1240 1241  RECOG_EVENT_STOP|8 	  	       SYNTH_START|mei|mei_voice_normal|8時代ですと、40分発のバスがあります。その次は9時10分発になります。
1240 1241  RECOG_EVENT_STOP|9   	       SYNTH_START|mei|mei_voice_normal|9時代ですと、10分と50分発のバスがあります。その次は10時30分発になります。
1240 1241  RECOG_EVENT_STOP|10  	       SYNTH_START|mei|mei_voice_normal|10時代ですと、30分発のバスがあります。その次は12時20分発になります。
1240 1241  RECOG_EVENT_STOP|11   	       SYNTH_START|mei|mei_voice_normal|この時間帯にバスはありません。次のバスは12時20分発になります。
1240 1241  RECOG_EVENT_STOP|12  	       SYNTH_START|mei|mei_voice_normal|12時代ですと、20分発のバスがあります。その次は13時発になります。
1240 1241  RECOG_EVENT_STOP|13  	       SYNTH_START|mei|mei_voice_normal|13時代ですと、00分と50分発のバスがあります。その次は14時40分発になります。
1240 1241  RECOG_EVENT_STOP|14   	       SYNTH_START|mei|mei_voice_normal|14時代ですと、40分発のバスがあります。その次は15時20分発になります。
1240 1241  RECOG_EVENT_STOP|15  	       SYNTH_START|mei|mei_voice_normal|15時代ですと、20分発のバスがあります。その次は16時20分発になります。
1240 1241  RECOG_EVENT_STOP|16  	       SYNTH_START|mei|mei_voice_normal|16時代ですと、20分と30分発のバスがあります。その次は18時発になります。
1240 1241  RECOG_EVENT_STOP|17   	       SYNTH_START|mei|mei_voice_normal|この時間帯にバスはありません。次のバスは18時発になります。
1240 1241  RECOG_EVENT_STOP|18  	       SYNTH_START|mei|mei_voice_normal|18時代ですと、00分と10分と30分発のバスがあります。その次は19時20分発になります。
1240 1241  RECOG_EVENT_STOP|19  	       SYNTH_START|mei|mei_voice_normal|19時代ですと、20分発のバスがあります。これが最終便となります。
1240 1241  RECOG_EVENT_STOP|20   	       SYNTH_START|mei|mei_voice_normal|この時間帯にバスはありません。今日の連絡バスは終了いたしました。
1240 1241  RECOG_EVENT_STOP|21   	       SYNTH_START|mei|mei_voice_normal|この時間帯にバスはありません。今日の連絡バスは終了いたしました。
1241 2     SYNTH_EVENT_STOP|mei		       <eps>



#1232 1242  KEY|		   	       SYNTH_START|mei|mei_voice_normal|りえんと多摩平、からのご乗車ですね。
1232 1242  RECOG_EVENT_STOP|りえんと   	       SYNTH_START|mei|mei_voice_normal|りえんと多摩平、からのご乗車ですね。
1232 1242  RECOG_EVENT_STOP|りえん             SYNTH_START|mei|mei_voice_normal|りえんと多摩平、からのご乗車ですね。
1242 1243  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|今は何時代ですか？２４時間表記で数字を教えてください。
1243 1244  RECOG_EVENT_STOP|7   	       SYNTH_START|mei|mei_voice_normal|7時代ですと、50分発のバスがあります。その次は12時8分発になります。
1243 1244  RECOG_EVENT_STOP|8   	       SYNTH_START|mei|mei_voice_normal|この時間帯にバスはありません。次のバスは12時8分発になります。
1243 1244  RECOG_EVENT_STOP|9 	  	       SYNTH_START|mei|mei_voice_normal|この時間帯にバスはありません。次のバスは12時8分発になります。
1243 1244  RECOG_EVENT_STOP|10   	       SYNTH_START|mei|mei_voice_normal|この時間帯にバスはありません。次のバスは12時8分発になります。
1243 1244  RECOG_EVENT_STOP|11  	       SYNTH_START|mei|mei_voice_normal|この時間帯にバスはありません。次のバスは12時8分発になります。
1243 1244  RECOG_EVENT_STOP|12  	       SYNTH_START|mei|mei_voice_normal|12時代ですと、8分発のバスがあります。その次は18時18分発になります。
1243 1244  RECOG_EVENT_STOP|13  	       SYNTH_START|mei|mei_voice_normal|この時間帯にバスはありません。次のバスは18時18分発になります。
1243 1244  RECOG_EVENT_STOP|14  	       SYNTH_START|mei|mei_voice_normal|この時間帯にバスはありません。次のバスは18時18分発になります。
1243 1244  RECOG_EVENT_STOP|15  	       SYNTH_START|mei|mei_voice_normal|この時間帯にバスはありません。次のバスは18時18分発になります。
1243 1244  RECOG_EVENT_STOP|16   	       SYNTH_START|mei|mei_voice_normal|この時間帯にバスはありません。次のバスは18時18分発になります。
1243 1244  RECOG_EVENT_STOP|17  	       SYNTH_START|mei|mei_voice_normal|この時間帯にバスはありません。次のバスは18時18分発になります。
1243 1244  RECOG_EVENT_STOP|18  	       SYNTH_START|mei|mei_voice_normal|18時代ですと、18分発のバスがあります。その次は8時40分発になります。
1243 1244  RECOG_EVENT_STOP|19  	       SYNTH_START|mei|mei_voice_normal|19時代ですと、28分発のバスがあります。これが最終便となります。
1243 1244  RECOG_EVENT_STOP|20  	       SYNTH_START|mei|mei_voice_normal|この時間帯にバスはありません。今日の連絡バスは終了いたしました。
1243 1244  RECOG_EVENT_STOP|21  	       SYNTH_START|mei|mei_voice_normal|この時間帯にバスはありません。今日の連絡バスは終了いたしました。
1244 2     SYNTH_EVENT_STOP|mei		       <eps>



#サークル

1    1301  KEY|:			       SYNTH_START|mei|mei_voice_normal|日野キャンパスのクラブ、サークルの紹介ですね。
1    1301  RECOG_EVENT_STOP|サークル	       SYNTH_START|mei|mei_voice_normal|日野キャンパスのクラブ、サークルの紹介ですね。
1    1301  RECOG_EVENT_STOP|クラブ	       SYNTH_START|mei|mei_voice_normal|日野キャンパスのクラブ、サークルの紹介ですね。
1    1301  RECOG_EVENT_STOP|さーくる	       SYNTH_START|mei|mei_voice_normal|日野キャンパスのクラブ、サークルの紹介ですね。
1301 1302  SYNTH_EVENT_STOP|mei                MOTION_ADD|mei|action|Motion\mei_point\mei_point_lef_top.vmd|PART|ONCE
1302 1303  <eps>      		 	       MODEL_ADD|club1|Image\club\club1.pmd|8.0,4.0,2.5|0.0,0.0,0.0|ON|mei
1303 1304  <eps>                               SYNTH_START|mei|mei_voice_normal|自治会等は、首都大クラブ委員会、の１団体があります。
1304 1305  SYNTH_EVENT_STOP|mei                MODEL_DELETE|club1
1305 1306  MODEL_EVENT_DELETE|club1	       MOTION_ADD|mei|action|Motion\mei_point\mei_point_lef_top.vmd|PART|ONCE
1306 1307  <eps>		               MODEL_ADD|club2|Image\club\club2.pmd|8.0,4.0,2.5|0.0,0.0,0.0|ON|mei
1307 1308  <eps>                               SYNTH_START|mei|mei_voice_normal|体育系クラブは、航空部、サイクリング部、フットサル部、の３団体あります。
1308 1309  SYNTH_EVENT_STOP|mei                MODEL_DELETE|club2
1309 1310  MODEL_EVENT_DELETE|club2	       MOTION_ADD|mei|action|Motion\mei_point\mei_point_lef_top.vmd|PART|ONCE
1310 1311  <eps>		               MODEL_ADD|club3|Image\club\club3.pmd|10.0,2.0,2.5|0.0,0.0,0.0|ON|mei
1311 1312  <eps>                               SYNTH_START|mei|mei_voice_normal|体育系サークルは、こちらの１３団体があります。
1312 1313  SYNTH_EVENT_STOP|mei                MODEL_DELETE|club3
1313 1314  MODEL_EVENT_DELETE|club3	       MOTION_ADD|mei|action|Motion\mei_point\mei_point_lef_top.vmd|PART|ONCE
1314 1315  <eps>		               MODEL_ADD|club4|Image\club\club4.pmd|8.0,4.0,2.5|0.0,0.0,0.0|ON|mei
1315 1316  <eps>                               SYNTH_START|mei|mei_voice_normal|文化系クラブは、こちらの５団体があります。
1316 1317  SYNTH_EVENT_STOP|mei                MODEL_DELETE|club4
1317 1318  MODEL_EVENT_DELETE|club4	       MOTION_ADD|mei|action|Motion\mei_point\mei_point_lef_top.vmd|PART|ONCE
1318 1319  <eps>		               MODEL_ADD|club5|Image\club\club5.pmd|10.0,2.0,2.5|0.0,0.0,0.0|ON|mei
1319 1320  <eps>                               SYNTH_START|mei|mei_voice_normal|文化系サークルは、こちらの１３団体があります。
1320 1321  SYNTH_EVENT_STOP|mei                MODEL_DELETE|club5
1321 2     MODEL_EVENT_DELETE|club5	       <eps>


#遊び


1    1350  KEY|				       SYNTH_START|mei|mei_voice_normal|日野キャンパス周辺の遊べる施設ですね。
1    1350  RECOG_EVENT_STOP|遊び	       SYNTH_START|mei|mei_voice_normal|日野キャンパス周辺の遊べる施設ですね。
1    1350  RECOG_EVENT_STOP|レジャー	       SYNTH_START|mei|mei_voice_normal|日野キャンパス周辺の遊べる施設ですね。
1    1350  RECOG_EVENT_STOP|あそび	       SYNTH_START|mei|mei_voice_normal|日野キャンパス周辺の遊べる施設ですね。
1350 1351  SYNTH_EVENT_STOP|mei                MOTION_ADD|mei|action|Motion\mei_point\mei_point_lef_top.vmd|PART|ONCE
1351 1352  <eps>      		 	       MODEL_ADD|game|Image\play\game.pmd|8.0,6.0,2.5|0.0,0.0,0.0|ON|mei
1352 1353  <eps>                               SYNTH_START|mei|mei_voice_normal|正門を出て、左に直進し、３番目の信号を左に曲がり、少し進むと左手に、ドラマ八王子高倉店というゲームセンターがあります。
1353 1354  SYNTH_EVENT_STOP|mei		       SYNTH_START|mei|mei_voice_normal|ドラマ八王子高倉店では、アーケードゲームのほか、ダーツやビリヤードも遊べますよ。私もよく遊んでます。
1354 1355  SYNTH_EVENT_STOP|mei                MODEL_DELETE|game
1355 1356  <eps>			       MOTION_ADD|mei|action|Motion\mei_point\mei_point_lef_top.vmd|PART|ONCE
1356 1357  <eps>      		 	       MODEL_ADD|tsutaya|Image\play\tsutaya.pmd|8.0,6.0,2.5|0.0,0.0,0.0|ON|mei
1357 1358  <eps>                               SYNTH_START|mei|mei_voice_normal|その他には、正門を出て、左に直進し、３番目の信号を通り過ぎると、左手にツタヤがあります。
1358 1359  SYNTH_EVENT_STOP|mei		       SYNTH_START|mei|mei_voice_normal|１階には書店もあるので、本を読んだり、CDやDVDが借りれますよ。
1359 2     SYNTH_EVENT_STOP|mei                MODEL_DELETE|tsutaya


#アクセス


1    1400  KEY|a			       SYNTH_START|mei|mei_voice_normal|日野キャンパスへのアクセスですね。
1    1400  RECOG_EVENT_STOP|アクセス	       SYNTH_START|mei|mei_voice_normal|日野キャンパスへのアクセスですね。
1    1400  RECOG_EVENT_STOP|行き方	       SYNTH_START|mei|mei_voice_normal|日野キャンパスへのアクセスですね。
1    1400  RECOG_EVENT_STOP|経路	       SYNTH_START|mei|mei_voice_normal|日野キャンパスへのアクセスですね。
1400 2     SYNTH_EVENT_STOP|mei		       SYNTH_START|mei|mei_voice_normal|首都大学東京日野キャンパスは、ＪＲ中央線豊田駅（北口）から徒歩で約20分。または京王バス「平山工業団地循環」に乗車し、「旭が丘中央公園」下車後、徒歩約5分です。


#日常会話

1    1410  KEY|b			       SYNTH_START|mei|mei_voice_normal|方言ですか...関西弁ならなんとか。。
1    1410  RECOG_EVENT_STOP|方言  	       SYNTH_START|mei|mei_voice_normal|方言ですか...関西弁ならなんとか。。
1410 2     SYNTH_EVENT_STOP|mei	 	       SYNTH_START|mei|mei_voice_normal|今日は、日野キャン来てくれてありがとう。また遊びにきてやーー。。どうです、できてますか？




#0121-0240 1号館


1    121  RECOG_EVENT_STOP|一,号館  	        SYNTH_START|mei|mei_voice_normal|１号館の案内をします。
121  122  SYNTH_EVENT_STOP|mei			SYNTH_START|mei|mei_voice_normal|１号館は、正門から道なりにまっすぐ進んで、２号館を過ぎると、左手にあります。
122  123  SYNTH_EVENT_STOP|mei			SYNTH_START|mei|mei_voice_normal|学生課に御用のかたはこちらへどうぞ。
123  2	  SYNTH_EVENT_STOP|mei			<eps>


#0241-0260 2号館

1       241	KEY|2				SYNTH_START|mei|mei_voice_normal|２号館の案内をします。
1       241	RECOG_EVENT_STOP|二,号館	SYNTH_START|mei|mei_voice_normal|２号館の案内をします。
1       241	RECOG_EVENT_STOP|大講義室	SYNTH_START|mei|mei_voice_normal|大講義室は、２号館の２階にあります。
1       241	RECOG_EVENT_STOP|山口		SYNTH_START|mei|mei_voice_normal|山口研究室は、２号館の６階にあります。
1       241	RECOG_EVENT_STOP|きや		SYNTH_START|mei|mei_voice_normal|きや研究室は、２号館の６階にあります。
1       241	RECOG_EVENT_STOP|西川		SYNTH_START|mei|mei_voice_normal|西川研究室は、２号館の６階にあります。
1       241	RECOG_EVENT_STOP|小町		SYNTH_START|mei|mei_voice_normal|小町研究室は、２号館の６階にあります。
1       241	RECOG_EVENT_STOP|石川		SYNTH_START|mei|mei_voice_normal|石川研究室は、２号館の６階にあります。
1       241	RECOG_EVENT_STOP|福本		SYNTH_START|mei|mei_voice_normal|福本研究室は、２号館の６階にあります。
1       241	RECOG_EVENT_STOP|キャル室	SYNTH_START|mei|mei_voice_normal|キャル室は、２号館の５階にあります。
241     242     SYNTH_EVENT_STOP|mei		SYNTH_START|mei|mei_voice_normal|２号館は、正門から道なりにまっすぐ進むとすぐに見えますよ。
242     243     SYNTH_EVENT_STOP|mei		SYNTH_START|mei|mei_voice_normal|地下１階には、図書館があります。
243     2	SYNTH_EVENT_STOP|mei		<eps>

#0261-0280 3号館

1       261  KEY|3				SYNTH_START|mei|mei_voice_normal|３号館の案内をします。
1       261	RECOG_EVENT_STOP|三,号館  	SYNTH_START|mei|mei_voice_normal|３号館の案内をします。
261  262  SYNTH_EVENT_STOP|mei			SYNTH_START|mei|mei_voice_normal|３号館は、正門から道なりにまっすぐ進んで、１号館を超え、４号館の右手にある建物です。
262  263  SYNTH_EVENT_STOP|mei			SYNTH_START|mei|mei_voice_normal|本館では、実験や研究が盛んに行われています。
263  2  SYNTH_EVENT_STOP|mei			<eps>



#0281-0300 4号館

1       281  KEY|4				SYNTH_START|mei|mei_voice_normal|４号館の案内をしますね。
1       281	RECOG_EVENT_STOP|四,号館  	SYNTH_START|mei|mei_voice_normal|４号館の案内をしますね。
281  282  SYNTH_EVENT_STOP|mei			SYNTH_START|mei|mei_voice_normal|４号館は、正門から道なりにまっすぐ進んで、１号館を超えると正面にあります。
282  283  SYNTH_EVENT_STOP|mei			SYNTH_START|mei|mei_voice_normal|本館では、実験や研究が盛んに行われています。
283  2	SYNTH_EVENT_STOP|mei			<eps>

#0301-0320 5号館

1       301  KEY|5				SYNTH_START|mei|mei_voice_normal|５号館の案内をしますね。
1       301  RECOG_EVENT_STOP|五,号館  		SYNTH_START|mei|mei_voice_normal|５号館の案内をしますね。
301  302  SYNTH_EVENT_STOP|mei			SYNTH_START|mei|mei_voice_normal|５号館は、正門から道なりにまっすぐ進んで、１号館を超え、４号館の奥にある建物です。
302  303  SYNTH_EVENT_STOP|mei			SYNTH_START|mei|mei_voice_normal|本館では、実験や研究が盛んに行われています。屋上にはベンチもあって居心地が良いですよ。
303  2	SYNTH_EVENT_STOP|mei			<eps>

#0321-0340 大学会館

1       321  RECOG_EVENT_STOP|大学,会館		SYNTH_START|mei|mei_voice_normal|大学会館の案内をしますね。
1       321  RECOG_EVENT_STOP|食堂		SYNTH_START|mei|mei_voice_normal|学生食堂の案内をしますね。
1       321  RECOG_EVENT_STOP|学生,食堂		SYNTH_START|mei|mei_voice_normal|学生食堂の案内をしますね。
1       321  RECOG_EVENT_STOP|購買		SYNTH_START|mei|mei_voice_normal|購買の案内をしますね。
321  322  SYNTH_EVENT_STOP|mei			SYNTH_START|mei|mei_voice_normal|大学会館は、正門から入って左手の自転車置き場を超え、芝生を道なりにまっすぐ進んでいくと、左手にあります。
322  323  SYNTH_EVENT_STOP|mei			SYNTH_START|mei|mei_voice_normal|１階には、学生食堂や購買があります。
323  2	SYNTH_EVENT_STOP|mei			<eps>


#0341-0360 体育館

1       341  RECOG_EVENT_STOP|体育館		SYNTH_START|mei|mei_voice_normal|体育館の案内をしますね。
341  342  SYNTH_EVENT_STOP|mei			SYNTH_START|mei|mei_voice_normal|体育館は、正門を入って左手にある建物です。
342  2	SYNTH_EVENT_STOP|mei			<eps>



#0361-0380 首都大学東京

1       361  KEY|z				SYNTH_START|mei|mei_voice_normal|首都大学東京は、都市教養学部、都市環境学部、システムデザイン学部、健康福祉学部の４つの学部からなる大学です。
1       361  RECOG_EVENT_STOP|しゅとだい	SYNTH_START|mei|mei_voice_normal|首都大学東京は、都市教養学部、都市環境学部、システムデザイン学部、健康福祉学部の４つの学部からなる大学です。
1       361  RECOG_EVENT_STOP|首都,大    	SYNTH_START|mei|mei_voice_normal|首都大学東京は、都市教養学部、都市環境学部、システムデザイン学部、健康福祉学部の４つの学部からなる大学です。
1       361  RECOG_EVENT_STOP|首都,大学,東京	SYNTH_START|mei|mei_voice_normal|首都大学東京は、都市教養学部、都市環境学部、システムデザイン学部、健康福祉学部の４つの学部からなる大学です。
361  362  SYNTH_EVENT_STOP|mei			SYNTH_START|mei|mei_voice_normal|どの学部について紹介いたしますか？

362  363  RECOG_EVENT_STOP|都市教養		SYNTH_START|mei|mei_voice_normal|都市教養学部には、人文社会系,法学系,経営学系,理工学系,都市政策コースの５つの学系,コースがあります。
363  364  SYNTH_EVENT_STOP|mei			MOTION_ADD|mei|action|Motion\mei_point\mei_point_lef_top.vmd|PART|ONCE
364  365  <eps>      		 	        MODEL_ADD|minami2|Image\campas\minami.pmd|4.0,5.0,2.5|0.0,0.0,0.0|ON|mei
365  366  <eps>					SYNTH_START|mei|mei_voice_normal|キャンパスは、南大沢キャンパスです。
366  2    SYNTH_EVENT_STOP|mei                  MODEL_DELETE|minami2	

362  367  RECOG_EVENT_STOP|都市,環境		SYNTH_START|mei|mei_voice_normal|都市環境学部には、地理環境コース,都市基盤環境コース,建築都市コース,分子応用化学コース,自然・文化ツーリズムコースの５つのコースがあります。
367  368  SYNTH_EVENT_STOP|mei			MOTION_ADD|mei|action|Motion\mei_point\mei_point_lef_top.vmd|PART|ONCE
368  369  <eps>      		 	        MODEL_ADD|minami2|Image\campas\minami.pmd|4.0,5.0,2.5|0.0,0.0,0.0|ON|mei
369  370  <eps>					SYNTH_START|mei|mei_voice_normal|キャンパスは、南大沢キャンパスです。
370  2    SYNTH_EVENT_STOP|mei                  MODEL_DELETE|minami2	


362  371  KEY|t					SYNTH_START|mei|mei_voice_normal|システムデザイン学部には、知能機械システムコース,情報通信システムコース,航空宇宙システムコース,経営システムデザインコース,インダストリアルアートコースの５つのコースがあります。
362  371  RECOG_EVENT_STOP|システム,デザイン	SYNTH_START|mei|mei_voice_normal|システムデザイン学部には、知能機械システムコース,情報通信システムコース,航空宇宙システムコース,経営システムデザインコース,インダストリアルアートコースの５つのコースがあります。
371  372  SYNTH_EVENT_STOP|mei			MOTION_ADD|mei|action|Motion\mei_point\mei_point_lef_top.vmd|PART|ONCE
372  373  <eps>      		 	        MODEL_ADD|hino2|Image\campas\hino.pmd|4.0,5.0,2.5|0.0,0.0,0.0|ON|mei
373  374  <eps>					SYNTH_START|mei|mei_voice_normal|キャンパスは、日野キャンパスです。日野キャンパスの案内なら任せてくださいね。
374  2    SYNTH_EVENT_STOP|mei                  MODEL_DELETE|hino2	


362  376  RECOG_EVENT_STOP|健康,福祉		SYNTH_START|mei|mei_voice_normal|健康福祉学部には、看護学科,理学療法学科,作業療法学科,放射線学科の４つの学科があります。
376  377  SYNTH_EVENT_STOP|mei			MOTION_ADD|mei|action|Motion\mei_point\mei_point_lef_top.vmd|PART|ONCE
377  378  <eps>      		 	        MODEL_ADD|arakawa|Image\campas\arakawa.pmd|4.0,5.0,2.5|0.0,0.0,0.0|ON|mei
378  379  <eps>					SYNTH_START|mei|mei_voice_normal|キャンパスは、荒川キャンパスです。
379  2    SYNTH_EVENT_STOP|mei                  MODEL_DELETE|arakawa


#0381-0400 入試情報

1      381  RECOG_EVENT_STOP|入試,情報		SYNTH_START|mei|mei_voice_normal|平成29年度の首都大学東京の入試情報を説明します。
1      381  RECOG_EVENT_STOP|入試		SYNTH_START|mei|mei_voice_normal|平成29年度の首都大学東京の入試情報を説明します。
1      381  KEY|r				SYNTH_START|mei|mei_voice_normal|平成29年度の首都大学東京の入試情報を説明します。
381  382  SYNTH_EVENT_STOP|mei			SYNTH_START|mei|mei_voice_normal|前期日程、後期日程のどちらについて説明いたしますか？

382  383  KEY|x 				SYNTH_START|mei|mei_voice_normal|第一次選抜は、大学入試センター試験の成績により行います。選抜結果の発表日は、2月8日、水曜日です。
382  383  RECOG_EVENT_STOP|前期			SYNTH_START|mei|mei_voice_normal|第一次選抜は、大学入試センター試験の成績により行います。選抜結果の発表日は、2月8日、水曜日です。
382  383  RECOG_EVENT_STOP|前期,日程		SYNTH_START|mei|mei_voice_normal|第一次選抜は、大学入試センター試験の成績により行います。選抜結果の発表日は、2月8日、水曜日です。
383  384  SYNTH_EVENT_STOP|mei			SYNTH_START|mei|mei_voice_normal|第二次選抜では、第一次選抜の合格者に対して、第二次試験を行います。どの学部を受験しますか？

384  385  RECOG_EVENT_STOP|都市教養		SYNTH_START|mei|mei_voice_normal|学系はどこですか？
385  386  RECOG_EVENT_STOP|人文,社会		SYNTH_START|mei|mei_voice_normal|人文・社会系を受験する皆さんの、試験実施日は、2月25日、土曜日です。
385  386  RECOG_EVENT_STOP|法学			SYNTH_START|mei|mei_voice_normal|法学系を受験する皆さんの、試験実施日は、2月25日、土曜日です。
385  386  RECOG_EVENT_STOP|経営学		SYNTH_START|mei|mei_voice_normal|経営学系A区分を受験する皆さんの、試験実施日は、2月25日、土曜日です。また、経営学系B区分を受験する皆さんの、試験実施日は、2月26日、日曜日です。
385  386  RECOG_EVENT_STOP|理工学		SYNTH_START|mei|mei_voice_normal|理工学系を受験する皆さんの、試験実施日は、2月26日、日曜日です。
386  388  SYNTH_EVENT_STOP|mei			SYNTH_START|mei|mei_voice_normal|実施会場は、南大沢キャンパスです。

384  387  KEY|q					SYNTH_START|mei|mei_voice_normal|システムデザイン学部を受験する皆さんの、試験実施日は、2月26日、日曜日です。
384  387  RECOG_EVENT_STOP|都市環境		SYNTH_START|mei|mei_voice_normal|都市環境学部を受験する皆さんの、試験実施日は、2月26日、日曜日です。
384  387  RECOG_EVENT_STOP|システム,デザイン	SYNTH_START|mei|mei_voice_normal|システムデザイン学部を受験する皆さんの、試験実施日は、2月26日、日曜日です。
384  387  RECOG_EVENT_STOP|健康,福祉		SYNTH_START|mei|mei_voice_normal|健康福祉学部を受験する皆さんの、試験実施日は、2月26日、日曜日です。
387  388  SYNTH_EVENT_STOP|mei			SYNTH_START|mei|mei_voice_normal|実施会場は、南大沢キャンパスです。

388  393  SYNTH_EVENT_STOP|mei			SYNTH_START|mei|mei_voice_normal|最終合格者の発表日は、3月8日、水曜日です。

382  390  RECOG_EVENT_STOP|後期			SYNTH_START|mei|mei_voice_normal|第一次選抜は、大学入試センター試験の成績により行います。第一次選抜結果の発表日は、2月8日、水曜日です。
382  390  RECOG_EVENT_STOP|後期,日程		SYNTH_START|mei|mei_voice_normal|第一次選抜は、大学入試センター試験の成績により行います。第一次選抜結果の発表日は、2月8日、水曜日です。
390  391  SYNTH_EVENT_STOP|mei			SYNTH_START|mei|mei_voice_normal|第二次選抜では、第一次選抜の合格者に対し、第二次選抜を行います。

391  392  SYNTH_EVENT_STOP|mei			SYNTH_START|mei|mei_voice_normal|第二次試験の試験実施日は、3月12日、日曜日です。実施会場は、南大沢キャンパスです。
392  393  SYNTH_EVENT_STOP|mei			SYNTH_START|mei|mei_voice_normal|最終合格者の発表日は、3月22日、水曜日です。

393  394  SYNTH_EVENT_STOP|mei			SYNTH_START|mei|mei_voice_normal|受験生の皆さん、応援しています！頑張ってくださいね！
394  2	SYNTH_EVENT_STOP|mei			<eps>

#0401-0410 オープンキャンパス

1      401  RECOG_EVENT_STOP|オープン,キャンパス  SYNTH_START|mei|mei_voice_normal|平成28年度の首都大学東京のオープンキャンパスについて説明します。
1      401  RECOG_EVENT_STOP|大学,説明会	SYNTH_START|mei|mei_voice_normal|平成28年度の首都大学東京の大学説明会について説明します。
1      401  KEY|7				SYNTH_START|mei|mei_voice_normal|平成28年度の首都大学東京の大学説明会について説明します。
401   402  SYNTH_EVENT_STOP|mei			SYNTH_START|mei|mei_voice_normal|大学説明会は、南大沢キャンパス、日野キャンパス、荒川キャンパスで行われます。どのキャンパスに行かれますか？

402  403  RECOG_EVENT_STOP|南大沢		SYNTH_START|mei|mei_voice_normal|南大沢キャンパスの大学説明会は、第一回は7月17日、日曜日に、第二回は、8月21日、日曜日に行われます。時間は、10時から、16時半までです。
402  403  RECOG_EVENT_STOP|日野			SYNTH_START|mei|mei_voice_normal|日野キャンパスの大学説明会は、7月30日、土曜日に行われます。時間は、10時から、17時までです。
402  403  RECOG_EVENT_STOP|荒川			SYNTH_START|mei|mei_voice_normal|荒川キャンパスの大学説明会は、8月8日、月曜日に行われます。時間は、10時から、16時までです。

403  404  SYNTH_EVENT_STOP|mei			SYNTH_START|mei|mei_voice_normal|大学説明会では、各学部や学科のガイダンス、施設見学や模擬授業も受けることができます。個別相談コーナーもありますので、ぜひお立ち寄りくださいね。
404  405  SYNTH_EVENT_STOP|mei			SYNTH_START|mei|mei_voice_normal|皆様のお越しを、心待ちにしています！
405  2	SYNTH_EVENT_STOP|mei			<eps>

#0501-0510 占い

1    501  KEY|u					VALUE_SET|x|0|3
1    501  RECOG_EVENT_STOP|今日,運勢		VALUE_SET|x|0|3
501  502  VALUE_EVENT_SET|x			VALUE_EVAL|x|LE|1
502  504  VALUE_EVENT_EVAL|x|LE|1|TRUE		SYNTH_START|mei|mei_voice_happy|今日の運勢は、良いですよ
502  503  VALUE_EVENT_EVAL|x|LE|1|FALSE		VALUE_EVAL|x|LE|2
503  504  VALUE_EVENT_EVAL|x|LE|2|TRUE		SYNTH_START|mei|mei_voice_sad|今日の運勢は、悪いですよ
503  504  VALUE_EVENT_EVAL|x|LE|2|FALSE		SYNTH_START|mei|mei_voice_normal|今日の運勢は、ふつうですよ
504  2    SYNTH_EVENT_STOP|mei			<eps>


#0601-0650 ご飯

1     601   RECOG_EVENT_STOP|ご飯	SYNTH_START|mei|mei_voice_normal|学内と学外、どちらでのお食事をご希望ですか？
1     601   RECOG_EVENT_STOP|食事	SYNTH_START|mei|mei_voice_normal|学内と学外、どちらでのお食事をご希望ですか？

601   602   RECOG_EVENT_STOP|学内	SYNTH_START|mei|mei_voice_normal|首都大の大学会館に食堂がありますよ。
602   603   SYNTH_EVENT_STOP|mei	SYNTH_START|mei|mei_voice_normal|丼、カレー、日替わりランチのどれがたべたいですか？

603   604   RECOG_EVENT_STOP|丼  	SYNTH_START|mei|mei_voice_normal|新鮮な鮮魚や食材を使用したお得な丼をご用意しています。その日に仕入れた新鮮食材によって変わるので、メニューは食堂で確認してくださいね。
604   610   <eps>   			SYNTH_START|mei|mei_voice_normal|その日に仕入れた新鮮食材によって変わるので、メニューは食堂で確認してくださいね。

603   610   RECOG_EVENT_STOP|カレー	SYNTH_START|mei|mei_voice_normal|今日のメニューは、ロースカツカレー、日替わりカレー、唐揚げカレー、コロッケカレー、カレーライスなどです。

603   610   RECOG_EVENT_STOP|日替わり   SYNTH_START|mei|mei_voice_normal|毎日4種類のランチをご用意しています。メニューは毎日変わるので、食堂で確認してみてください。
603   610   RECOG_EVENT_STOP|ランチ     SYNTH_START|mei|mei_voice_normal|毎日4種類のランチをご用意しています。メニューは毎日変わるので、食堂で確認してみてください。

610   611   SYNTH_EVENT_STOP|mei	SYNTH_START|mei|mei_voice_happy|おいしそうだなあ、私も食べたいです。では、いってらっしゃい！
611   2	    SYNTH_EVENT_STOP|mei	<eps>

601   620   RECOG_EVENT_STOP|学外	SYNTH_START|mei|mei_voice_normal|軽食、和食、洋食、中華、イタリアン、インド料理、どんな気分ですか？
620   621   RECOG_EVENT_STOP|和食	SYNTH_START|mei|mei_voice_normal|定食、寿司、うどん、ちゃんぽん、そば、どうしましょう？
621   622   RECOG_EVENT_STOP|定食	EXECUTE|http://genkina-shokutaku.com/
622   623   <eps>                       SYNTH_START|mei|mei_voice_normal|元気な食卓、八王子高倉町店がおすすめです。厳選野菜と、石垣島ハンバーグがとってもおいしいですよ。
623   2     SYNTH_EVENT_STOP|mei	<eps>

621   624   RECOG_EVENT_STOP|寿司	EXECUTE|http://www.choushimaru.co.jp/
624   625   <eps>                       SYNTH_START|mei|mei_voice_normal|すし銚子丸、日野店がおすすめです。
625   626   SYNTH_EVENT_STOP|mei	SYNTH_START|mei|mei_voice_bashful|私もお寿司、食べたいです。
626   2     SYNTH_EVENT_STOP|mei	<eps>

621   627   RECOG_EVENT_STOP|うどん	EXECUTE|http://www.marugame-seimen.com/
627   628   <eps>                       SYNTH_START|mei|mei_voice_normal|丸亀製麺、八王子高倉店がおすすめです。
628   629   SYNTH_EVENT_STOP|mei	SYNTH_START|mei|mei_voice_happy|私は、かまたまが好きです。
629   2	    SYNTH_EVENT_STOP|mei	<eps>

621   630   RECOG_EVENT_STOP|ちゃんぽん	EXECUTE|http://www.ringerhut.jp/
630   631   <eps>                       SYNTH_START|mei|mei_voice_normal|リンガーハット、八王子高倉店がおすすめです。
631   632   SYNTH_EVENT_STOP|mei	SYNTH_START|mei|mei_voice_normal|野菜がたくさん食べれますね！
632   2	    SYNTH_EVENT_STOP|mei	<eps>

621   633   RECOG_EVENT_STOP|そば	EXECUTE|https://tabelog.com/tokyo/A1329/A132903/13073947/
633   634   <eps>                       SYNTH_START|mei|mei_voice_normal|福佐屋、旭丘店がおすすめです。そば、いいですねえ。
634   2     SYNTH_EVENT_STOP|mei	<eps>

620   635   RECOG_EVENT_STOP|軽食	SYNTH_START|mei|mei_voice_normal|ファストフード、カフェ、どうしましょう？
635   636   RECOG_EVENT_STOP|ファスト,フード	EXECUTE|https://map.mcdonalds.co.jp/map/13512
636   637   <eps>                       SYNTH_START|mei|mei_voice_normal|マクドナルド、八王子高倉店がおすすめです。私はてりやきチキンが好きです。
637   2     SYNTH_EVENT_STOP|mei	<eps>

635   638   RECOG_EVENT_STOP|カフェ	EXECUTE|http://takakuramachi-coffee.co.jp/shop/hachioji/
638   639   <eps>                       SYNTH_START|mei|mei_voice_normal|高倉町コーヒー、八王子店がおすすめです。
639   640   SYNTH_EVENT_STOP|mei	SYNTH_START|mei|mei_voice_normal|座り心地の良いソファ席や椅子を備えたコーヒーショップです。落ち着いた雰囲気の中でリコッタパンケーキや拘りの珈琲を楽しめますよ。
640   2     SYNTH_EVENT_STOP|mei	<eps>

620   641   RECOG_EVENT_STOP|洋食	EXECUTE|http://www.yomenya-goemon.com/
641   642   <eps>                       SYNTH_START|mei|mei_voice_normal|五右衛門、日野旭丘店がおすすめです。ゆであげのスパゲッティをいただけます、季節に合わせたメニューがあるのもうれしいですね。
642   2     SYNTH_EVENT_STOP|mei	<eps>

620   643   RECOG_EVENT_STOP|中華	EXECUTE|http://r.gnavi.co.jp/gazd600/
643   644   <eps>                       SYNTH_START|mei|mei_voice_normal|スイトンポウ、高倉店がおすすめです。どうしても餃子が食べたくなること、ありますよね。
644   2     SYNTH_EVENT_STOP|mei	<eps>

620   645   RECOG_EVENT_STOP|イタリアン	EXECUTE|http://www.saizeriya.co.jp/restaurant/shop_detail.php?cd=0059
645   646   <eps>                       SYNTH_START|mei|mei_voice_normal|サイゼリア、八王子高倉店がおすすめです。お財布に優しい。ミラノ風ドリア、定番ですね。辛味チキンがおいしいので食べてください。
646   2     SYNTH_EVENT_STOP|mei	<eps>

620   647   RECOG_EVENT_STOP|インド	EXECUTE|http://himaraya2008.co.jp/
647   648   <eps>                       SYNTH_START|mei|mei_voice_normal|インドレストラン、デルコスがおすすめです。本場の料理人の店員さんが、とても優しいと評判です。リーズナブルで味が良いカレーが、人気の秘密なんです。
648   2	SYNTH_EVENT_STOP|mei	<eps>

#0651-0660 きのこの山

1   652   RECOG_EVENT_STOP|きのこ,山	<eps>
652   653   <eps>                       SYNTH_START|mei|mei_voice_normal|きのこの山はきのこの形をしたチョコレートのお菓子です。
653   654   SYNTH_EVENT_STOP|mei	SYNTH_START|mei|mei_voice_normal|似たようなお菓子には筍の形をした、たけのこの里があります。
654   2	SYNTH_EVENT_STOP|mei	<eps>

#0661-0700 なぞなぞ

1    661  RECOG_EVENT_STOP|なぞなぞ	VALUE_SET|x|0|10
1    661  RECOG_EVENT_STOP|ナゾ		VALUE_SET|x|0|10
661  662  VALUE_EVENT_SET|x		VALUE_EVAL|x|LE|1

662  663  VALUE_EVENT_EVAL|x|LE|1|TRUE	SYNTH_START|mei|mei_voice_normal|パンはパンでも食べられないパンはなんでしょう？
663  691  <eps>                           TIMER_START|idle11|30
691  690  TIMER_EVENT_STOP|idle11	SYNTH_START|mei|mei_voice_sad|制限時間切れです．なぞなぞを終了します．
691  690  RECOG_EVENT_STOP|フライパン	SYNTH_START|mei|mei_voice_happy|正解です!
691  690  RECOG_EVENT_STOP|答え		SYNTH_START|mei|mei_voice_happy|答えは．フライパン．です．
662  664  VALUE_EVENT_EVAL|x|LE|1|FALSE	VALUE_EVAL|x|LE|2

664  665  VALUE_EVENT_EVAL|x|LE|2|TRUE	SYNTH_START|mei|mei_voice_normal|いつも何かにチャレンジしている国はどこでしょう？
665  692  <eps>                       TIMER_START|idle12|30
692  690  TIMER_EVENT_STOP|idle12	SYNTH_START|mei|mei_voice_sad|制限時間切れです．なぞなぞを終了します．
692  690  RECOG_EVENT_STOP|朝鮮		SYNTH_START|mei|mei_voice_happy|正解です!
692  690  RECOG_EVENT_STOP|挑戦		SYNTH_START|mei|mei_voice_happy|答えは．朝鮮．です．
664  666  VALUE_EVENT_EVAL|x|LE|2|FALSE	VALUE_EVAL|x|LE|3

666  667  VALUE_EVENT_EVAL|x|LE|3|TRUE	SYNTH_START|mei|mei_voice_normal|おじいちゃんとする球技はなんでしょう？
667  693  <eps>				TIMER_START|idle13|30
693  690  TIMER_EVENT_STOP|idle13	SYNTH_START|mei|mei_voice_sad|制限時間切れです．なぞなぞを終了します．
693  690  RECOG_EVENT_STOP|ソフトボール	SYNTH_START|mei|mei_voice_happy|正解です!
693  690  RECOG_EVENT_STOP|ソフト,ボール	SYNTH_START|mei|mei_voice_happy|正解です!
693  690  RECOG_EVENT_STOP|答え		SYNTH_START|mei|mei_voice_happy|答えは．ソフトボール．です．
666  668  VALUE_EVENT_EVAL|x|LE|3|FALSE	VALUE_EVAL|x|LE|4

668  669  VALUE_EVENT_EVAL|x|LE|4|TRUE	SYNTH_START|mei|mei_voice_normal|たくさんこぼしても減らないものはなんでしょう？
669  694  <eps>				TIMER_START|idle14|30
694  690  TIMER_EVENT_STOP|idle14	SYNTH_START|mei|mei_voice_sad|制限時間切れです．なぞなぞを終了します．
694  690  RECOG_EVENT_STOP|愚痴		SYNTH_START|mei|mei_voice_happy|正解です!
694  690  RECOG_EVENT_STOP|答え		SYNTH_START|mei|mei_voice_happy|答えは．ぐち．です．
668  670  VALUE_EVENT_EVAL|x|LE|4|FALSE	VALUE_EVAL|x|LE|5

670  671  VALUE_EVENT_EVAL|x|LE|5|TRUE	SYNTH_START|mei|mei_voice_normal|自分でぐるぐる回る本はどんな本でしょう？
671  695  <eps>				TIMER_START|idle5|30
695  690  TIMER_EVENT_STOP|idle5	SYNTH_START|mei|mei_voice_sad|制限時間切れです．なぞなぞを終了します．
695  690  RECOG_EVENT_STOP|辞典		SYNTH_START|mei|mei_voice_happy|正解です!
695  690  RECOG_EVENT_STOP|答え		SYNTH_START|mei|mei_voice_happy|答えは．辞典．です．
670  672  VALUE_EVENT_EVAL|x|LE|5|FALSE   VALUE_EVAL|x|LE|6

672  673  VALUE_EVENT_EVAL|x|LE|6|TRUE	SYNTH_START|mei|mei_voice_normal|三角なのに四角なものとはなんでしょう？
673  696  <eps>				TIMER_START|idle6|30
696  690  TIMER_EVENT_STOP|idle6	SYNTH_START|mei|mei_voice_sad|制限時間切れです．なぞなぞを終了します．
696  690  RECOG_EVENT_STOP|口		SYNTH_START|mei|mei_voice_happy|正解です!
696  690  RECOG_EVENT_STOP|答え		SYNTH_START|mei|mei_voice_happy|答えは．くち．です．
672  674  VALUE_EVENT_EVAL|x|LE|6|FALSE	VALUE_EVAL|x|LE|7

674  675  VALUE_EVENT_EVAL|x|LE|7|TRUE	SYNTH_START|mei|mei_voice_normal|毎年4月に新しくなる遊び道具はなんでしょう？
675  697  <eps>				TIMER_START|idle7|30
697  690  TIMER_EVENT_STOP|idle7	SYNTH_START|mei|mei_voice_sad|制限時間切れです．なぞなぞを終了します．
697  690  RECOG_EVENT_STOP|年度		SYNTH_START|mei|mei_voice_happy|正解です!
697  690  RECOG_EVENT_STOP|面倒		SYNTH_START|mei|mei_voice_happy|正解です!
697  690  RECOG_EVENT_STOP|答え		SYNTH_START|mei|mei_voice_happy|答えは．ねんど．です．
674  676  VALUE_EVENT_EVAL|x|LE|7|FALSE	VALUE_EVAL|x|LE|8

676  677  VALUE_EVENT_EVAL|x|LE|8|TRUE	SYNTH_START|mei|mei_voice_normal|歯を磨くことが嫌いな野菜はなんでしょう？
677  698  <eps>				TIMER_START|idle8|30
698  690  TIMER_EVENT_STOP|idle8	SYNTH_START|mei|mei_voice_sad|制限時間切れです．なぞなぞを終了します．
698  690  RECOG_EVENT_STOP|白菜		SYNTH_START|mei|mei_voice_happy|正解です!
698  690  RECOG_EVENT_STOP|答え		SYNTH_START|mei|mei_voice_happy|答えは．白菜．です．
676  678  VALUE_EVENT_EVAL|x|LE|8|FALSE	VALUE_EVAL|x|LE|9

678  679  VALUE_EVENT_EVAL|x|LE|9|TRUE	SYNTH_START|mei|mei_voice_normal|通るときにはしまって，通らない時にはあいているものはなんでしょう？
679  699  <eps>				TIMER_START|idle9|30
699  690  TIMER_EVENT_STOP|idle9	SYNTH_START|mei|mei_voice_sad|制限時間切れです．なぞなぞを終了します．
699  690  RECOG_EVENT_STOP|踏切		SYNTH_START|mei|mei_voice_happy|正解です!
699  690  RECOG_EVENT_STOP|答え		SYNTH_START|mei|mei_voice_happy|答えは．踏切．です．
678  680  VALUE_EVENT_EVAL|x|LE|9|FALSE	<eps>

680  681  <eps>				SYNTH_START|mei|mei_voice_normal|外は人，なかはくま，どんな食べ物？
681  700  <eps>				TIMER_START|idle10|30
700  690  TIMER_EVENT_STOP|idle10	SYNTH_START|mei|mei_voice_sad|制限時間切れです．なぞなぞを終了します．
700  690  RECOG_EVENT_STOP|肉まん	SYNTH_START|mei|mei_voice_happy|正解です!
700  690  RECOG_EVENT_STOP|に，くま，ん	SYNTH_START|mei|mei_voice_happy|正解です!
700  690  RECOG_EVENT_STOP|答え		SYNTH_START|mei|mei_voice_happy|答えは．にくまん．です．

690  2    SYNTH_EVENT_STOP|mei	<eps>

1    800  RECOG_EVENT_STOP|たけのこ	SYNTH_START|mei|mei_voice_happy|たけのこの里は好きではありません。
800  2    SYNTH_EVENT_STOP|mei	<eps>