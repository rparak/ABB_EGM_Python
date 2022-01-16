MODULE Module1
    ! ## =========================================================================== ## 
    ! MIT License
    ! Copyright (c) 2021 Roman Parak
    ! Permission is hereby granted, free of charge, to any person obtaining a copy
    ! of this software and associated documentation files (the "Software"), to deal
    ! in the Software without restriction, including without limitation the rights
    ! to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    ! copies of the Software, and to permit persons to whom the Software is
    ! furnished to do so, subject to the following conditions:
    ! The above copyright notice and this permission notice shall be included in all
    ! copies or substantial portions of the Software.
    ! THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    ! IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    ! FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    ! AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    ! LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    ! OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
    ! SOFTWARE.
    ! ## =========================================================================== ## 
    ! Author   : Roman Parak
    ! Email    : Roman.Parak@outlook.com
    ! Github   : https://github.com/rparak
    ! File Name: T_ROB1/Module1.mod
    ! ## =========================================================================== ## 
    
    ! Targets
    CONST robtarget Target_10:=[[450,0,750],[0.227989146,-0.565814373,0.774691577,0.166517282],[-1,1,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_20:=[[450.673200019,2.107908887,740.247895004],[0.221935885,-0.567098394,0.775814982,0.165090848],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_30:=[[451.341814618,4.202476204,730.492605608],[0.215873394,-0.568358831,0.776906123,0.163657548],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_40:=[[452.001149821,6.270043742,720.730926368],[0.209801925,-0.569595632,0.777964954,0.162217442],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_50:=[[452.646285288,8.296292396,710.959650588],[0.203721731,-0.570808744,0.778991432,0.16077059],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_60:=[[453.27194664,10.265869913,701.175533883],[0.197633065,-0.571998118,0.779985514,0.159317052],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_70:=[[453.872349805,12.161935748,691.375342262],[0.19153618,-0.573163704,0.780947158,0.157856888],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_80:=[[454.441014781,13.965617272,681.55585344],[0.18543133,-0.574305453,0.781876324,0.15639016],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_90:=[[454.970524777,15.655305255,671.713945232],[0.179318767,-0.575423319,0.782772974,0.154916927],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_100:=[[455.452211546,17.205733055,661.84673731],[0.173198748,-0.576517254,0.783637071,0.153437252],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_110:=[[455.87573477,18.586745826,651.951777931],[0.167071525,-0.577587214,0.784468578,0.151951196],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_120:=[[456.22849509,19.761579397,642.027547108],[0.160937355,-0.578633153,0.785267461,0.150458821],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_130:=[[456.494816042,20.684461716,632.074145396],[0.154796491,-0.579655028,0.786033687,0.148960188],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_140:=[[456.654763571,21.297144564,622.094774431],[0.14864919,-0.580652797,0.786767224,0.147455361],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_150:=[[456.682438827,21.523882328,612.098251122],[0.142495707,-0.581626418,0.787468041,0.145944401],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_160:=[[456.543496511,21.264113686,602.103982994],[0.136336298,-0.58257585,0.788136109,0.144427372],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_170:=[[456.191658285,20.382142563,592.151506191],[0.130171219,-0.583501055,0.788771401,0.142904337],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_180:=[[455.564357157,18.694149333,582.319097113],[0.124000727,-0.584401993,0.78937389,0.141375358],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_190:=[[454.579444853,15.958066705,572.758750871],[0.117825077,-0.585278628,0.789943551,0.1398405],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_200:=[[453.140655049,11.888715261,563.752039798],[0.111644528,-0.586130923,0.79048036,0.138299826],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_210:=[[451.169604614,6.250571561,555.75573265],[0.105459335,-0.586958841,0.790984295,0.136753401],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_220:=[[448.671723925,-0.948510552,549.315832593],[0.099269757,-0.58776235,0.791455335,0.135201289],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_230:=[[445.788731736,-9.320604749,544.704121886],[0.093076051,-0.588541415,0.79189346,0.133643554],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_240:=[[442.726014446,-18.330693451,541.660352094],[0.086878473,-0.589296004,0.792298653,0.132080261],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_250:=[[439.612290638,-27.645831198,539.804711236],[0.080677283,-0.590026086,0.792670896,0.130511475],[-1,0,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_260:=[[436.512337375,-37.100220982,538.826420818],[0.074472737,-0.59073163,0.793010173,0.128937262],[-1,0,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_270:=[[433.458081139,-46.615378425,538.499865568],[0.068265095,-0.591412607,0.793316472,0.127357686],[-1,0,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_280:=[[430.465958497,-56.155016652,538.664273624],[0.062054613,-0.592068989,0.793589778,0.125772814],[-1,0,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_290:=[[427.545253922,-65.703309685,539.20315127],[0.055841551,-0.592700749,0.793830081,0.124182711],[-1,0,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_300:=[[424.702054807,-75.254633997,540.029587429],[0.049626166,-0.593307859,0.794037371,0.122587444],[-1,0,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_310:=[[421.94120102,-84.808620331,541.076513767],[0.043408718,-0.593890295,0.794211639,0.120987079],[-1,0,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_320:=[[419.267346327,-94.367574391,542.290265955],[0.037189464,-0.594448033,0.794352878,0.119381682],[-1,0,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_330:=[[416.685453537,-103.935606306,543.626303179],[0.030968664,-0.594981049,0.794461081,0.117771321],[-1,0,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_340:=[[414.201350679,-113.517473032,545.04611453],[0.024746575,-0.595489322,0.794536245,0.116156061],[-1,0,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_350:=[[411.821999317,-123.118511032,546.515018114],[0.018523458,-0.595972829,0.794578366,0.114535971],[-1,0,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_360:=[[409.555869484,-132.74436815,548.000387396],[0.01229957,-0.596431552,0.794587443,0.112911118],[-1,0,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_370:=[[407.413354299,-142.400873329,549.470130952],[0.006075171,-0.59686547,0.794563474,0.111281569],[-1,0,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_380:=[[405.407317461,-152.093804398,550.891227198],[0.000149481,0.597274567,-0.794506462,-0.109647393],[-1,0,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_390:=[[403.55373159,-161.828993084,552.228230494],[0.006374127,0.597658824,-0.794416409,-0.108008656],[-1,0,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_400:=[[401.872727954,-171.611523643,553.441412325],[0.012598507,0.598018226,-0.794293318,-0.106365427],[-1,0,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_410:=[[400.389854271,-181.44543723,554.484561063],[0.018822364,0.598352759,-0.794137194,-0.104717775],[-1,0,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_420:=[[399.137958737,-191.332480972,555.301993015],[0.025045438,0.598662407,-0.793948044,-0.103065768],[-1,0,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_430:=[[398.159817764,-201.269953052,555.824498015],[0.03126747,0.598947158,-0.793725875,-0.101409475],[-1,0,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_440:=[[397.511798401,-211.246611211,555.96378894],[0.037488202,0.599207001,-0.793470698,-0.099748964],[-1,0,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_450:=[[397.268707628,-221.235044051,555.605189375],[0.043707375,0.599441924,-0.793182522,-0.098084305],[-1,0,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_460:=[[397.529330922,-231.177281679,554.599243015],[0.04992473,0.599651918,-0.79286136,-0.096415567],[-1,-1,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_470:=[[398.419729322,-240.959460359,552.756401448],[0.056140009,0.599836974,-0.792507225,-0.09474282],[-1,-1,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_480:=[[400.085096812,-250.373862328,549.858052393],[0.062352954,0.599997085,-0.792120131,-0.093066132],[-1,-1,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_490:=[[402.628411939,-259.113615059,545.746494614],[0.068563305,0.600132243,-0.791700096,-0.091385574],[-1,-1,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_500:=[[405.993131368,-266.917540837,540.497725462],[0.074770805,0.600242443,-0.791247135,-0.089701215],[-1,-1,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_510:=[[410.031212818,-273.646887318,534.315131987],[0.080975195,0.60032768,-0.790761269,-0.088013126],[-1,-1,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_520:=[[414.572027622,-279.290337606,527.430736462],[0.087176218,0.600387952,-0.790242516,-0.086321377],[-1,-1,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_530:=[[419.464156767,-283.923847011,520.048290659],[0.093373615,0.600423254,-0.7896909,-0.084626038],[-1,-1,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_540:=[[424.591089537,-287.660461676,512.322732899],[0.099567129,0.600433587,-0.789106442,-0.082927179],[-1,-1,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_550:=[[429.869396536,-290.617059968,504.363458253],[0.105756503,0.600418949,-0.788489168,-0.081224872],[-1,-1,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_560:=[[435.240979837,-292.899026755,496.24533026],[0.111941478,0.600379342,-0.787839102,-0.079519187],[-1,-1,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_570:=[[440.665515378,-294.595753946,488.019149657],[0.118121798,0.600314766,-0.787156272,-0.077810194],[-1,-1,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_580:=[[446.114653127,-295.780991924,479.719586456],[0.124297205,0.600225224,-0.786440706,-0.076097966],[-1,-1,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_590:=[[451.568049835,-296.514918098,471.370539434],[0.130467444,0.600110721,-0.785692434,-0.074382573],[-1,-1,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_600:=[[457.010709962,-296.846482712,462.988690766],[0.136632256,0.599971261,-0.784911487,-0.072664087],[-1,-1,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_610:=[[462.431196743,-296.815524897,454.585874252],[0.142791386,0.599806849,-0.784097898,-0.070942579],[-1,-1,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_620:=[[467.820464493,-296.454526743,446.170592269],[0.148944578,0.599617493,-0.7832517,-0.06921812],[-1,-1,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_630:=[[473.171047747,-295.790005977,437.749052504],[0.155091576,0.599403201,-0.782372929,-0.067490783],[-1,-1,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_640:=[[478.47650266,-294.843603047,429.32586054],[0.161232124,0.59916398,-0.781461621,-0.06576064],[-1,-1,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_650:=[[483.730988656,-293.632924629,420.904524307],[0.167365967,0.598899843,-0.780517814,-0.064027761],[-1,-1,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_660:=[[488.928985299,-292.17218563,412.48776298],[0.173492849,0.598610798,-0.779541547,-0.062292219],[-1,-1,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_670:=[[494.065036422,-290.472704144,404.077780532],[0.179612516,0.598296859,-0.778532861,-0.060554087],[-1,-1,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_680:=[[499.133560148,-288.543267668,395.676432914],[0.185724714,0.597958038,-0.777491798,-0.058813437],[-1,-1,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_690:=[[504.128657476,-286.390406133,387.285388827],[0.191829188,0.597594349,-0.7764184,-0.057070341],[-1,-1,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_700:=[[509.043935121,-284.018580005,378.906250352],[0.197925684,0.597205808,-0.775312714,-0.055324871],[-1,-1,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_710:=[[513.87231576,-281.430298594,370.540667891],[0.204013949,0.596792431,-0.774174784,-0.053577101],[-1,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_720:=[[518.605825465,-278.626174642,362.190455476],[0.210093729,0.596354235,-0.773004659,-0.051827102],[-1,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_730:=[[523.23534464,-275.604917284,353.857715254],[0.216164773,0.595891238,-0.771802386,-0.050074948],[-1,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_740:=[[527.75030235,-272.36326366,345.544987049],[0.222226826,0.595403459,-0.770568016,-0.048320712],[-1,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_750:=[[532.138291035,-268.895844572,337.255437712],[0.228279638,0.594890919,-0.7693016,-0.046564466],[-1,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_760:=[[536.384569264,-265.194976153,328.993112431],[0.234322956,0.594353639,-0.76800319,-0.044806284],[-1,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_770:=[[540.471406279,-261.250366321,320.763281748],[0.240356529,0.593791642,-0.766672842,-0.043046238],[-1,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_780:=[[544.377204191,-257.048719324,312.572930937],[0.246380106,0.59320495,-0.765310609,-0.041284402],[-1,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_790:=[[548.075291584,-252.573233377,304.431492092],[0.252393437,0.592593588,-0.763916549,-0.039520849],[-1,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_800:=[[551.532550224,-247.803141149,296.351908194],[0.258396272,0.591957582,-0.76249072,-0.037755652],[-1,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_810:=[[554.716294426,-242.719029353,288.35194953],[0.264388361,0.591296958,-0.761033181,-0.035988886],[-1,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_820:=[[557.599231498,-237.307360813,280.453598605],[0.270369454,0.590611743,-0.759543992,-0.034220623],[-1,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_830:=[[560.153361127,-231.557389109,272.682301956],[0.276339303,0.589901967,-0.758023216,-0.032450936],[-1,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_840:=[[562.350326261,-225.461959113,265.066849408],[0.282297661,0.589167657,-0.756470916,-0.0306799],[-1,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_850:=[[564.162504805,-219.018663935,257.638979536],[0.288244278,0.588408846,-0.754887155,-0.028907588],[-1,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_860:=[[565.564385642,-212.230937241,250.432586047],[0.294178908,0.587625565,-0.753272001,-0.027134074],[-1,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_870:=[[566.534141301,-205.108863025,243.482455513],[0.300101303,0.586817845,-0.751625521,-0.025359431],[-1,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_880:=[[567.055207935,-197.669583356,236.82267063],[0.306011218,0.585985721,-0.749947782,-0.023583734],[-1,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_890:=[[567.117660585,-189.937016732,230.484704888],[0.311908407,0.585129228,-0.748238855,-0.021807056],[-1,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_900:=[[566.719116715,-181.940913772,224.495555931],[0.317792625,0.584248401,-0.746498811,-0.020029471],[-1,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_910:=[[565.864992888,-173.715307266,218.876177372],[0.323663626,0.583343276,-0.744727721,-0.018251054],[-1,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_920:=[[564.568061307,-165.296604706,213.640474972],[0.329521167,0.582413891,-0.74292566,-0.016471877],[-1,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_930:=[[562.847386191,-156.721545724,208.79494977],[0.335365004,0.581460286,-0.741092703,-0.014692015],[-1,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_940:=[[560.726857353,-148.025427981,204.339049848],[0.341194894,0.580482499,-0.739228926,-0.012911542],[-1,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_950:=[[558.233566093,-139.240724758,200.266031616],[0.347010595,0.579480571,-0.737334406,-0.011130532],[-1,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_960:=[[555.396255587,-130.396214807,196.564145053],[0.352811864,0.578454544,-0.735409222,-0.009349059],[-1,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_970:=[[552.243989111,-121.516555902,193.217912596],[0.358598461,0.577404461,-0.733453455,-0.007567198],[-1,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_980:=[[548.80514168,-112.622304488,190.209374843],[0.364370145,0.576330364,-0.731467185,-0.005785022],[-1,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_990:=[[545.106672197,-103.730116487,187.519140845],[0.370126675,0.5752323,-0.729450495,-0.004002605],[-1,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_1000:=[[541.173705443,-94.853200093,185.127264572],[0.375867813,0.574110313,-0.727403469,-0.002220021],[-1,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_1010:=[[537.029300577,-86.001753451,183.013881688],[0.38159332,0.572964451,-0.725326192,-0.000437346],[-1,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_1020:=[[532.694394704,-77.183449419,181.159670927],[0.387302957,0.57179476,-0.723218751,0.001345348],[-1,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_1030:=[[528.187854444,-68.403887116,179.546156866],[0.392996487,0.57060129,-0.721081233,0.003127986],[-1,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_1040:=[[523.526576957,-59.666960425,178.155885123],[0.398673673,0.56938409,-0.718913727,0.004910493],[-1,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_1050:=[[518.725664326,-50.975241306,176.972520091],[0.404334279,0.568143211,-0.716716324,0.006692797],[-1,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_1060:=[[513.798573729,-42.330230551,175.980864848],[0.409978071,0.566878705,-0.714489114,0.008474822],[-1,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_1070:=[[508.757294717,-33.732606513,175.166846366],[0.415604812,0.565590623,-0.71223219,0.010256495],[-1,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_1080:=[[503.612493002,-25.182382977,174.517468001],[0.421214269,0.56427902,-0.709945646,0.012037741],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_1090:=[[498.373690525,-16.679110347,174.020752792],[0.426806209,0.562943949,-0.707629577,0.013818487],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_1100:=[[493.049380324,-8.221957969,173.665670045],[0.4323804,0.561585468,-0.70528408,0.015598658],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_1110:=[[487.647155276,0.190180747,173.442063441],[0.437936609,0.560203631,-0.702909252,0.01737818],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_1120:=[[482.173823045,8.558604842,173.340578454],[0.443474605,0.558798497,-0.700505192,0.019156979],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_1130:=[[476.635480259,16.884781007,173.352591969],[0.448994158,0.557370125,-0.698072,0.020934982],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_1140:=[[471.03762816,25.170250402,173.470146694],[0.454495039,0.555918572,-0.695609776,0.022712114],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_1150:=[[465.385224051,33.416627764,173.685889138],[0.459977018,0.5544439,-0.693118624,0.024488302],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_1160:=[[459.682755025,41.625560467,173.993012844],[0.465439868,0.552946171,-0.690598647,0.026263471],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_1170:=[[453.934291768,49.798711684,174.385206411],[0.470883362,0.551425445,-0.68804995,0.028037548],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_1180:=[[448.143525332,57.937762083,174.856607263],[0.476307272,0.549881788,-0.685472638,0.029810459],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_1190:=[[442.313836258,66.044361084,175.401756831],[0.481711375,0.548315262,-0.68286682,0.031582131],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_1200:=[[436.448311132,74.120148127,176.015563128],[0.487095444,0.546725933,-0.680232603,0.033352488],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_1210:=[[430.549781376,82.166738087,176.693265259],[0.492459256,0.545113868,-0.677570096,0.035121459],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_1220:=[[424.620856969,90.185710472,177.430401035],[0.497802588,0.543479132,-0.674879411,0.036888969],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_1230:=[[418.6639294,98.178636895,178.222781134],[0.503125218,0.541821794,-0.67216066,0.038654945],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_1240:=[[412.681231285,106.14702915,179.06645843],[0.508426924,0.540141924,-0.669413955,0.040419314],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_1250:=[[406.674827539,114.09237716,179.95770804],[0.513707486,0.53843959,-0.666639411,0.042182002],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_1260:=[[400.646641157,122.016137704,180.893004999],[0.518966684,0.536714864,-0.663837144,0.043942935],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_1270:=[[394.598468633,129.919735105,181.869004912],[0.5242043,0.534967818,-0.661007269,0.045702041],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_1280:=[[388.531998829,137.804555639,182.882525456],[0.529420115,0.533198523,-0.658149904,0.047459246],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_1290:=[[382.448802328,145.671978652,183.93053417],[0.534613913,0.531407055,-0.655265169,0.049214477],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_1300:=[[376.350381606,153.523327319,185.010127149],[0.539785478,0.529593486,-0.652353182,0.050967662],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_1310:=[[370.238150584,161.359909869,186.118520589],[0.544934595,0.527757893,-0.649414066,0.052718727],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_1320:=[[364.113452865,169.183009381,187.25303681],[0.550061049,0.525900352,-0.646447943,0.0544676],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_1330:=[[357.97756987,176.993885774,188.411092726],[0.555164628,0.524020939,-0.643454936,0.056214208],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_1340:=[[351.831733758,184.793770875,189.590188078],[0.560245118,0.522119735,-0.640435168,0.057958478],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_1350:=[[345.677109102,192.583902356,190.787900303],[0.56530231,0.520196816,-0.637388767,0.059700337],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_1360:=[[339.514843558,200.365469549,192.001866611],[0.570335992,0.518252264,-0.634315859,0.061439714],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_1370:=[[333.346037715,208.139661227,193.229782072],[0.575345955,0.51628616,-0.631216571,0.063176535],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_1380:=[[327.171762392,215.907652678,194.46938898],[0.580331991,0.514298584,-0.628091032,0.064910729],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_1390:=[[320.99306369,223.670607954,195.718468876],[0.585293893,0.51228962,-0.624939372,0.066642224],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_1400:=[[314.810969267,231.429680249,196.974834585],[0.590231453,0.510259351,-0.621761723,0.068370947],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_1410:=[[308.626485948,239.186022889,198.236324234],[0.595144468,0.508207861,-0.618558216,0.070096827],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_1420:=[[302.44061813,246.940774032,199.500791193],[0.600032732,0.506135237,-0.615328986,0.071819792],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    
    ! Identifier for the EGM correction
    LOCAL VAR egmident egm_id;
    ! EGM pose frames
    LOCAL CONST pose egm_correction_frame := [[0, 0, 0], [1, 0, 0, 0]];
    LOCAL CONST pose egm_sensor_frame     := [[0, 0, 0], [1, 0, 0, 0]];
    ! The work object. Base Frame
    LOCAL PERS wobjdata egm_wobj := [FALSE, TRUE, "", [[0.0, 0.0, 0.0],[1.0, 0.0, 0.0, 0.0]], [[0.0, 0.0, 0.0],[1.0, 0.0, 0.0, 0.0]]];
    ! Limits for convergence
    ! Cartesian: +-1 mm
    LOCAL CONST egm_minmax egm_condition_cartesian := [-0.1, 0.1];
    ! Orientation: +-1 degrees
    LOCAL CONST egm_minmax egm_condition_orient := [-0.1, 0.1];
    
    ! Actual State {Main State-Machine)
    VAR num actual_state := 0;
    
    ! Initialization Parameters
    CONST num speed_tcp    := 100;
    CONST num speed_orient := 100;
    VAR speeddata speed_value := [speed_tcp,speed_orient,0,0];
    VAR zonedata zone_value   := z100;

    ! Description:                                                  !
    ! Externally Guided motion (EGM): Stream / Control - Main Cycle !
    PROC Main()
        ! Move to the starting position
        !MoveJ Target_10,speed_value,zone_value,tool0\WObj:=wobj0;
            
        ! EGM Stream Data (Position, Orientation)
        EGM_STREAM_DATA;
        
        ! EGM Cartesian / Joint Control
        !EGM_CARTESIAN_CONTROL;
        !EGM_JOINT_CONTROL;
    ENDPROC
    
    PROC EGM_STREAM_DATA()
        ! Description:                                                            !
        ! Simple movements with EGM Streaming Position \ Orientation - Main Cycle !
        
        TEST actual_state
            CASE 0:
                ! Register an EGM id
                EGMGetId egm_id;
                ! Setup the EGM communication
                EGMSetupUC ROB_1, egm_id, "default", "ROB_1";
                ! Start the EGM communication session
                EGMStreamStart egm_id \SampleRate:=4;
                actual_state := 1; 
            CASE 1:   
                ! Instructions for multiple movements
                Path_Experiment_Default speed_value, zone_value;
                Path_Experiment_Reverse speed_value, zone_value;
                actual_state := 2;
            CASE 2:
                ! Empty
        ENDTEST
    ENDPROC
    
    PROC EGM_CARTESIAN_CONTROL()
        ! Description:                                       !
        ! Externally Guided motion (EGM) - Cartesian Control !
    
        ! Register an EGM id
        EGMGetId egm_id;
            
        ! Setup the EGM communication
        EGMSetupUC ROB_1, egm_id, "default", "ROB_1", \Pose; 
            
        ! EGM While {Cartesian}
        WHILE TRUE DO
            ! Prepare for an EGM communication session
            EGMActPose egm_id, 
                       \WObj:=egm_wobj,
                       egm_correction_frame,
                       EGM_FRAME_BASE,
                       egm_sensor_frame,
                       EGM_FRAME_BASE
                       \X:=egm_condition_cartesian
                       \Y:=egm_condition_cartesian
                       \Z:=egm_condition_cartesian
                       \Rx:=egm_condition_orient
                       \Ry:=egm_condition_orient
                       \Rz:=egm_condition_orient
                       \LpFilter:=100
                       \SampleRate:=4
                       \MaxPosDeviation:=1000
                       \MaxSpeedDeviation:=1000;
                        
            ! Start the EGM communication session
            EGMRunPose egm_id, EGM_STOP_RAMP_DOWN, \X \Y \Z \Rx \Ry \Rz \CondTime:=0.1 \RampInTime:=0.1 \RampOutTime:=0.1 \PosCorrGain:=1.0;
            
            ! Release the EGM id
            !EGMReset egm_id;
            ! Wait 2 seconds {No data from EGM sensor}
            !WaitTime 2;
        ENDWHILE
        
        ERROR
        IF ERRNO = ERR_UDPUC_COMM THEN
            TPWrite "Communication timedout";
            TRYNEXT;
        ENDIF
    ENDPROC
    
    PROC EGM_JOINT_CONTROL()
        ! Description:                                   !
        ! Externally Guided motion (EGM) - Joint Control !
        
        ! Register an EGM id.
        EGMGetId egm_id;
            
        ! Setup the EGM communication.
        EGMSetupUC ROB_1, egm_id, "default", "ROB_1", \Joint; 

        WHILE TRUE DO
            ! Prepare for an EGM communication session.
            EGMActJoint egm_id,
                        \WObj:=egm_wobj,
                        \J1:=egm_condition_orient
                        \J2:=egm_condition_orient
                        \J3:=egm_condition_orient
                        \J4:=egm_condition_orient
                        \J5:=egm_condition_orient
                        \J6:=egm_condition_orient
                        \LpFilter:=100
                        \SampleRate:=4
                        \MaxPosDeviation:=1000
                        \MaxSpeedDeviation:=1000;
                        
            ! Start the EGM communication session.
            EGMRunJoint egm_id, EGM_STOP_RAMP_DOWN, \J1 \J2 \J3 \J4 \J5 \J6 \CondTime:=0.1 \RampInTime:=0.1 \RampOutTime:=0.1 \PosCorrGain:=1.0;

            ! Release the EGM id.
            !EGMReset egm_id;
            ! Wait 2 seconds {No data from EGM sensor}
            !WaitTime 2;
        ENDWHILE
        
        ERROR
        IF ERRNO = ERR_UDPUC_COMM THEN
            TPWrite "Communication timedout";
            TRYNEXT;
        ENDIF
    ENDPROC
    
    PROC Path_Experiment_Default(speeddata speed, zonedata zone)
        MoveJ Target_10,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_20,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_30,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_40,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_50,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_60,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_70,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_80,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_90,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_100,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_110,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_120,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_130,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_140,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_150,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_160,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_170,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_180,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_190,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_200,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_210,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_220,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_230,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_240,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_250,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_260,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_270,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_280,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_290,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_300,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_310,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_320,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_330,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_340,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_350,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_360,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_370,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_380,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_390,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_400,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_410,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_420,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_430,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_440,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_450,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_460,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_470,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_480,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_490,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_500,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_510,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_520,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_530,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_540,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_550,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_560,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_570,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_580,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_590,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_600,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_610,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_620,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_630,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_640,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_650,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_660,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_670,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_680,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_690,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_700,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_710,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_720,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_730,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_740,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_750,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_760,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_770,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_780,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_790,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_800,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_810,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_820,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_830,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_840,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_850,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_860,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_870,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_880,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_890,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_900,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_910,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_920,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_930,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_940,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_950,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_960,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_970,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_980,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_990,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_1000,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_1010,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_1020,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_1030,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_1040,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_1050,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_1060,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_1070,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_1080,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_1090,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_1100,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_1110,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_1120,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_1130,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_1140,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_1150,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_1160,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_1170,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_1180,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_1190,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_1200,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_1210,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_1220,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_1230,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_1240,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_1250,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_1260,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_1270,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_1280,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_1290,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_1300,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_1310,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_1320,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_1330,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_1340,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_1350,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_1360,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_1370,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_1380,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_1390,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_1400,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_1410,speed,zone,tool0\WObj:=wobj0;
        MoveJ Target_1420,speed,zone,tool0\WObj:=wobj0;
    ENDPROC
    
    PROC Path_Experiment_Reverse(speeddata speed, zonedata zone)
        MoveJ Target_1420,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_1410,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_1400,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_1390,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_1380,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_1370,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_1360,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_1350,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_1340,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_1330,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_1320,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_1310,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_1300,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_1290,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_1280,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_1270,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_1260,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_1250,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_1240,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_1230,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_1220,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_1210,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_1200,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_1190,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_1180,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_1170,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_1160,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_1150,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_1140,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_1130,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_1120,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_1110,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_1100,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_1090,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_1080,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_1070,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_1060,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_1050,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_1040,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_1030,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_1020,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_1010,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_1000,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_990,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_980,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_970,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_960,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_950,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_940,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_930,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_920,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_910,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_900,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_890,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_880,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_870,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_860,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_850,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_840,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_830,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_820,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_810,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_800,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_790,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_780,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_770,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_760,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_750,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_740,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_730,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_720,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_710,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_700,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_690,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_680,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_670,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_660,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_650,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_640,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_630,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_620,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_610,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_600,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_590,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_580,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_570,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_560,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_550,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_540,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_530,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_520,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_510,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_500,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_490,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_480,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_470,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_460,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_450,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_440,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_430,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_420,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_410,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_400,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_390,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_380,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_370,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_360,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_350,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_340,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_330,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_320,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_310,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_300,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_290,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_280,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_270,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_260,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_250,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_240,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_230,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_220,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_210,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_200,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_190,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_180,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_170,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_160,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_150,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_140,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_130,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_120,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_110,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_100,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_90,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_80,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_70,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_60,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_50,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_40,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_30,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_20,speed,z100,tool0\WObj:=wobj0;
        MoveJ Target_10,speed,z100,tool0\WObj:=wobj0;
    ENDPROC
ENDMODULE
