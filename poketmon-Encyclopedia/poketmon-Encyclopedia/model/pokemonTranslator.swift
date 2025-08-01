//
//  PokemonTranslator.swift
//  PokedexApp
//
//  Created by 김동현 on 8/8/24.
//

import Foundation
// 포켓몬 영어 이름을 한국어로 변환해주는 enum
enum PokemonTranslator {
  // 영어 이름과 한국어 이름 매핑 테이블
  private static let koreanNames: [String: String] = [
    "bulbasaur": "이상해씨",
    "ivysaur": "이상해풀",
    "venusaur": "이상해꽃",
    "charmander": "파이리",
    "charmeleon": "리자드",
    "charizard": "리자몽",
    "squirtle": "꼬부기",
    "wartortle": "어니부기",
    "blastoise": "거북왕",
    "caterpie": "캐터피",
    "metapod": "단데기",
    "butterfree": "버터플",
    "weedle": "뿔충이",
    "kakuna": "딱충이",
    "beedrill": "독침붕",
    "pidgey": "구구",
    "pidgeotto": "피죤",
    "pidgeot": "피죤투",
    "rattata": "꼬렛",
    "raticate": "레트라",
    "spearow": "깨비참",
    "fearow": "깨비드릴조",
    "ekans": "아보",
    "arbok": "아보크",
    "pikachu": "피카츄",
    "raichu": "라이츄",
    "sandshrew": "모래두지",
    "sandslash": "고지",
    "nidoran♀": "니드런♀",
    "nidorina": "니드리나",
    "nidoqueen": "니드퀸",
    "nidoran♂": "니드런♂",
    "nidorino": "니드리노",
    "nidoking": "니드킹",
    "clefairy": "삐삐",
    "clefable": "픽시",
    "vulpix": "식스테일",
    "ninetales": "나인테일",
    "jigglypuff": "푸린",
    "wigglytuff": "푸크린",
    "zubat": "주뱃",
    "golbat": "골뱃",
    "oddish": "뚜벅쵸",
    "gloom": "냄새꼬",
    "vileplume": "라플레시아",
    "paras": "파라스",
    "parasect": "파라섹트",
    "venonat": "콘팡",
    "venomoth": "도나리",
    "diglett": "디그다",
    "dugtrio": "닥트리오",
    "meowth": "나옹",
    "persian": "페르시온",
    "psyduck": "고라파덕",
    "golduck": "골덕",
    "mankey": "망키",
    "primeape": "성원숭",
    "growlithe": "가디",
    "arcanine": "윈디",
    "poliwag": "발챙이",
    "poliwhirl": "슈륙챙이",
    "poliwrath": "강챙이",
    "abra": "캐이시",
    "kadabra": "윤겔라",
    "alakazam": "후딘",
    "machop": "알통몬",
    "machoke": "근육몬",
    "machamp": "괴력몬",
    "bellsprout": "모다피",
    "weepinbell": "우츠동",
    "victreebel": "우츠보트",
    "tentacool": "왕눈해",
    "tentacruel": "독파리",
    "geodude": "꼬마돌",
    "graveler": "데구리",
    "golem": "딱구리",
    "ponyta": "포니타",
    "rapidash": "날쌩마",
    "slowpoke": "야돈",
    "slowbro": "야도란",
    "magnemite": "코일",
    "magneton": "레어코일",
    "farfetch'd": "파오리",
    "doduo": "두두",
    "dodrio": "두트리오",
    "seel": "쥬쥬",
    "dewgong": "쥬레곤",
    "grimer": "질퍽이",
    "muk": "질뻐기",
    "shellder": "셀러",
    "cloyster": "파르셀",
    "gastly": "고오스",
    "haunter": "고우스트",
    "gengar": "팬텀",
    "onix": "롱스톤",
    "drowzee": "슬리프",
    "hypno": "슬리퍼",
    "krabby": "크랩",
    "kingler": "킹크랩",
    "voltorb": "찌리리공",
    "electrode": "붐볼",
    "exeggcute": "아라리",
    "exeggutor": "나시",
    "cubone": "탕구리",
    "marowak": "텅구리",
    "hitmonlee": "시라소몬",
    "hitmonchan": "홍수몬",
    "lickitung": "내루미",
    "koffing": "또가스",
    "weezing": "또도가스",
    "rhyhorn": "뿔카노",
    "rhydon": "코뿌리",
    "chansey": "럭키",
    "tangela": "덩쿠리",
    "kangaskhan": "캥카",
    "horsea": "쏘드라",
    "seadra": "시드라",
    "goldeen": "콘치",
    "seaking": "왕콘치",
    "staryu": "별가사리",
    "starmie": "아쿠스타",
    "mr. mime": "마임맨",
    "scyther": "스라크",
    "jynx": "루주라",
    "electabuzz": "에레브",
    "magmar": "마그마",
    "pinsir": "쁘사이저",
    "tauros": "켄타로스",
    "magikarp": "잉어킹",
    "gyarados": "갸라도스",
    "lapras": "라프라스",
    "ditto": "메타몽",
    "eevee": "이브이",
    "vaporeon": "샤미드",
    "jolteon": "쥬피썬더",
    "flareon": "부스터",
    "porygon": "폴리곤",
    "omanyte": "암나이트",
    "omastar": "암스타",
    "kabuto": "투구",
    "kabutops": "투구푸스",
    "aerodactyl": "프테라",
    "snorlax": "잠만보",
    "articuno": "프리져",
    "zapdos": "썬더",
    "moltres": "파이어",
    "dratini": "미뇽",
    "dragonair": "신뇽",
    "dragonite": "망나뇽",
    "mewtwo": "뮤츠",
    "mew": "뮤",
    "chikorita": "치코리타",
    "bayleef": "베이리프",
    "meganium": "메가니움",
    "cyndaquil": "브케인",
    "quilava": "마그케인",
    "typhlosion": "블레이범",
    "totodile": "리아코",
    "croconaw": "엘리게이",
    "feraligatr": "장크로다일",
    "sentret": "꼬리선",
    "furret": "다꼬리",
    "hoothoot": "부우부",
    "noctowl": "야부엉",
    "ledyba": "레디바",
    "ledian": "레디안",
    "spinarak": "페이검",
    "ariados": "아리아도스",
    "crobat": "크로뱃",
    "chinchou": "초라기",
    "lanturn": "랜턴",
    "pichu": "피츄",
    "cleffa": "삐",
    "igglybuff": "푸푸린",
    "togepi": "토게피",
    "togetic": "토게틱",
    "natu": "네이티",
    "xatu": "네이티오",
    "mareep": "메리프",
    "flaaffy": "보송송",
    "ampharos": "전룡",
    "bellossom": "아르코",
    "marill": "마릴",
    "azumarill": "마릴리",
    "sudowoodo": "꼬지모",
    "politoed": "왕구리",
    "hoppip": "통통코",
    "skiploom": "두코",
    "jumpluff": "솜솜코",
    "aipom": "에이팜",
    "sunkern": "해너츠",
    "sunflora": "해루미",
    "yanma": "왕자리",
    "wooper": "우파",
    "quagsire": "누오",
    "espeon": "에브이",
    "umbreon": "블래키",
    "murkrow": "니로우",
    "slowking": "야도킹",
    "misdreavus": "무우마",
    "unown": "안농",
    "wobbuffet": "마자용",
    "girafarig": "키링키",
    "pineco": "피콘",
    "forretress": "쏘콘",
    "dunsparce": "노고치",
    "gligar": "글라이거",
    "steelix": "강철톤",
    "snubbull": "블루",
    "granbull": "그랑블루",
    "qwilfish": "침바루",
    "scizor": "핫삼",
    "shuckle": "단단지",
    "heracross": "헤라크로스",
    "sneasel": "포푸니",
    "teddiursa": "깜지곰",
    "ursaring": "링곰",
    "slugma": "마그마그",
    "magcargo": "마그카르고",
    "swinub": "꾸꾸리",
    "piloswine": "메꾸리",
    "corsola": "코산호",
    "remoraid": "총어",
    "octillery": "대포무노",
    "delibird": "딜리버드",
    "mantine": "만타인",
    "skarmory": "무장조",
    "houndour": "델빌",
    "houndoom": "헬가",
    "kingdra": "킹드라",
    "phanpy": "코코리",
    "donphan": "코리갑",
    "porygon2": "폴리곤2",
    "stantler": "노라키",
    "smeargle": "루브도",
    "tyrogue": "배루키",
    "hitmontop": "카포에라",
    "smoochum": "뽀뽀라",
    "elekid": "에레키드",
    "magby": "마그비",
    "miltank": "밀탱크",
    "blissey": "해피너스",
    "raikou": "라이코",
    "entei": "앤테이",
    "suicune": "스이쿤",
    "larvitar": "애버라스",
    "pupitar": "데기라스",
    "tyranitar": "마기라스",
    "lugia": "루기아",
    "ho-oh": "칠색조",
    "celebi": "세레비",
    "treecko": "나무지기",
    "grovyle": "나무돌이",
    "sceptile": "나무킹",
    "torchic": "아차모",
    "combusken": "영치코",
    "blaziken": "번치코",
    "mudkip": "물짱이",
    "marshtomp": "늪짱이",
    "swampert": "대짱이",
    "poochyena": "포챠나",
    "mightyena": "그라에나",
    "zigzagoon": "지그제구리",
    "linoone": "직구리",
    "wurmple": "개무소",
    "silcoon": "실쿤",
    "beautifly": "뷰티플라이",
    "cascoon": "카스쿤",
    "dustox": "독케일",
    "lotad": "연꽃몬",
    "lombre": "로토스",
    "ludicolo": "로파파",
    "seedot": "도토링",
    "nuzleaf": "잎새코",
    "shiftry": "다탱구",
    "taillow": "테일로",
    "swellow": "스왈로",
    "wingull": "갈모매",
    "pelipper": "패리퍼",
    "ralts": "랄토스",
    "kirlia": "킬리아",
    "gardevoir": "가디안",
    "surskit": "비구술",
    "masquerain": "비나방",
    "shroomish": "버섯꼬",
    "breloom": "버섯모",
    "slakoth": "게을로",
    "vigoroth": "발바로",
    "slaking": "게을킹",
    "nincada": "토중몬",
    "ninjask": "아이스크",
    "shedinja": "껍질몬",
    "whismur": "소곤룡",
    "loudred": "노공룡",
    "exploud": "폭음룡",
    "makuhita": "마크탕",
    "hariyama": "하리뭉",
    "azurill": "루리리",
    "nosepass": "코코파스",
    "skitty": "에나비",
    "delcatty": "델케티",
    "sableye": "깜까미",
    "mawile": "입치트",
    "aron": "가보리",
    "lairon": "갱도라",
    "aggron": "보스로라",
    "meditite": "요가랑",
    "medicham": "요가램",
    "electrike": "썬더라이",
    "manectric": "썬더볼트",
    "plusle": "플러시",
    "minun": "마이농",
    "volbeat": "볼비트",
    "illumise": "네오비트",
    "roselia": "로젤리아",
    "gulpin": "꼴깍몬",
    "swalot": "꿀꺽몬",
    "carvanha": "샤프니아",
    "sharpedo": "샤크니아",
    "wailmer": "고래왕자",
    "wailord": "고래왕",
    "numel": "둔타",
    "camerupt": "폭타",
    "torkoal": "코터스",
    "spoink": "피그점프",
    "grumpig": "피그킹",
    "spinda": "얼루기",
    "trapinch": "톱치",
    "vibrava": "비브라바",
    "flygon": "플라이곤",
    "cacnea": "선인왕",
    "cacturne": "밤선인",
    "swablu": "파비코",
    "altaria": "파비코리",
    "zangoose": "쟝고",
    "seviper": "세비퍼",
    "lunatone": "루나톤",
    "solrock": "솔록",
    "barboach": "미꾸리",
    "whiscash": "메깅",
    "corphish": "가재군",
    "crawdaunt": "가재장군",
    "baltoy": "오뚝군",
    "claydol": "점토도리",
    "lileep": "릴링",
    "cradily": "릴리요",
    "anorith": "아노딥스",
    "armaldo": "아말도",
    "feebas": "빈티나",
    "milotic": "밀로틱",
    "castform": "캐스퐁",
    "kecleon": "켈리몬",
    "shuppet": "어둠대신",
    "banette": "다크펫",
    "duskull": "해골몽",
    "dusclops": "미라몽",
    "tropius": "트로피우스",
    "chimecho": "치렁",
    "absol": "앱솔",
    "wynaut": "마자",
    "snorunt": "눈꼬마",
    "glalie": "얼음귀신",
    "spheal": "대굴레오",
    "sealeo": "씨레오",
    "walrein": "씨카이저",
    "clamperl": "진주몽",
    "huntail": "헌테일",
    "gorebyss": "분홍장이",
    "relicanth": "시라칸",
    "luvdisc": "사랑동이",
    "bagon": "아공이",
    "shelgon": "쉘곤",
    "salamence": "보만다",
    "beldum": "메탕",
    "metang": "메탕구",
    "metagross": "메타그로스",
    "regirock": "레지락",
    "regice": "레지아이스",
    "registeel": "레지스틸",
    "latias": "라티아스",
    "latios": "라티오스",
    "kyogre": "가이오가",
    "groudon": "그란돈",
    "rayquaza": "레쿠쟈",
    "jirachi": "지라치",
    "deoxys": "테오키스",
    "turtwig": "모부기",
    "grotle": "수풀부기",
    "torterra": "토대부기",
    "chimchar": "불꽃숭이",
    "monferno": "파이숭이",
    "infernape": "초염몽",
    "piplup": "팽도리",
    "prinplup": "팽태자",
    "empoleon": "엠페르트",
    "starly": "찌르꼬",
    "staravia": "찌르버드",
    "staraptor": "찌르호크",
    "bidoof": "비버니",
    "bibarel": "비버통",
    "kricketot": "귀뚤뚜기",
    "kricketune": "귀뚤톡크",
    "shinx": "꼬링크",
    "luxio": "럭시오",
    "luxray": "렌트라",
    "budew": "꼬몽울",
    "roserade": "로즈레이드",
    "cranidos": "두개도스",
    "rampardos": "램펄드",
    "shieldon": "방패톱스",
    "bastiodon": "바리톱스",
    "burmy": "도롱충이",
    "wormadam": "도롱마담",
    "mothim": "나메일",
    "combee": "세꿀버리",
    "vespiquen": "비퀸",
    "pachirisu": "파치리스",
    "buizel": "브이젤",
    "floatzel": "플로젤",
    "cherubi": "체리버",
    "cherrim": "체리꼬",
    "shellos": "깝질무",
    "gastrodon": "트리토돈",
    "ambipom": "겟핸보숭",
    "drifloon": "흔들풍손",
    "drifblim": "둥실라이드",
    "buneary": "이어롤",
    "lopunny": "이어롭",
    "mismagius": "무우마직",
    "honchkrow": "돈크로우",
    "glameow": "나옹마",
    "purugly": "몬냥이",
    "chingling": "랑딸랑",
    "stunky": "스컹뿡",
    "skuntank": "스컹탱크",
    "bronzor": "동미러",
    "bronzong": "동탁군",
    "bonsly": "꼬지지",
    "mime jr.": "흉내내",
    "happiny": "핑복",
    "chatot": "페라페",
    "spiritomb": "화강돌",
    "gible": "딥상어동",
    "gabite": "한바이트",
    "garchomp": "한카리아스",
    "munchlax": "먹고자",
    "riolu": "리오르",
    "lucario": "루카리오",
    "hippopotas": "히포포타스",
    "hippowdon": "하마돈",
    "skorupi": "스콜피",
    "drapion": "드래피온",
    "croagunk": "삐딱구리",
    "toxicroak": "독개굴",
    "carnivine": "무스틈니",
    "finneon": "형광어",
    "lumineon": "네오라이트",
    "mantyke": "타만타",
    "snover": "눈쓰개",
    "abomasnow": "눈설왕",
    "weavile": "포푸니라",
    "magnezone": "자포코일",
    "lickilicky": "내룸벨트",
    "rhyperior": "거대코뿌리",
    "tangrowth": "덩쿠림보",
    "electivire": "에레키블",
    "magmortar": "마그마번",
    "togekiss": "토게키스",
    "yanmega": "메가자리",
    "leafeon": "리피아",
    "glaceon": "글레이시아",
    "gliscor": "글라이온",
    "mamoswine": "맘모꾸리",
    "porygon-z": "폴리곤Z",
    "gallade": "엘레이드",
    "probopass": "대코파스",
    "dusknoir": "야느와르몽",
    "froslass": "눈여아",
    "rotom": "로토무",
    "uxie": "유크시",
    "mesprit": "엠라이트",
    "azelf": "아그놈",
    "dialga": "디아루가",
    "palkia": "펄기아",
    "heatran": "히드런",
    "regigigas": "레지기가스",
    "giratina": "기라티나",
    "cresselia": "크레세리아",
    "phione": "피오네",
    "manaphy": "마나피",
    "darkrai": "다크라이",
    "shaymin": "쉐이미",
    "arceus": "아르세우스",
    "victini": "비크티니",
    "snivy": "주리비얀",
    "servine": "샤비",
    "serperior": "샤로다",
    "tepig": "뚜꾸리",
    "pignite": "챠오꿀",
    "emboar": "염무왕",
    "oshawott": "수댕이",
    "dewott": "쌍검자비",
    "samurott": "대검귀",
    "patrat": "보르쥐",
    "watchog": "보르그",
    "lillipup": "요테리",
    "herdier": "하데리어",
    "stoutland": "바랜드",
    "purrloin": "쌔비냥",
    "liepard": "레파르다스",
    "pansage": "야나프",
    "simisage": "야나키",
    "pansear": "바오프",
    "simisear": "바오키",
    "panpour": "앗차프",
    "simipour": "앗차키",
    "munna": "몽나",
    "musharna": "몽얌나",
    "pidove": "콩둘기",
    "tranquill": "유토브",
    "unfezant": "켄호로우",
    "blitzle": "줄뮤마",
    "zebstrika": "제브라이카",
    "roggenrola": "단굴",
    "boldore": "암트르",
    "gigalith": "기가이어스",
    "woobat": "또르박쥐",
    "swoobat": "맘박쥐",
    "drilbur": "두더류",
    "excadrill": "몰드류",
    "audino": "다부니",
    "timburr": "으랏차",
    "gurdurr": "토쇠골",
    "conkeldurr": "노보청",
    "tympole": "동챙이",
    "palpitoad": "두까비",
    "seismitoad": "두빅굴",
    "throh": "던지미",
    "sawk": "타격귀",
    "sewaddle": "두르보",
    "swadloon": "두르쿤",
    "leavanny": "모아머",
    "venipede": "마디네",
    "whirlipede": "휠구",
    "scolipede": "펜드라",
    "cottonee": "소미안",
    "whimsicott": "엘풍",
    "petilil": "치릴리",
    "lilligant": "드레디어",
    "basculin": "배쓰나이",
    "sandile": "깜눈크",
    "krokorok": "악비르",
    "krookodile": "악비아르",
    "darumaka": "달막화",
    "darmanitan": "불비달마",
    "maractus": "마라카치",
    "dwebble": "돌살이",
    "crustle": "암팰리스",
    "scraggy": "곤율랭",
    "scrafty": "곤율거니",
    "sigilyph": "심보러",
    "yamask": "데스마스",
    "cofagrigus": "데스니칸",
    "tirtouga": "프로토가",
    "carracosta": "늑골라",
    "archen": "아켄",
    "archeops": "아케오스",
    "trubbish": "깨봉이",
    "garbodor": "더스트나",
    "zorua": "조로아",
    "zoroark": "조로아크",
    "minccino": "치라미",
    "cinccino": "치라치노",
    "gothita": "고디탱",
    "gothorita": "고디보미",
    "gothitelle": "고디모아젤",
    "solosis": "유니란",
    "duosion": "듀란",
    "reuniclus": "란쿨루스",
    "ducklett": "꼬지보리",
    "swanna": "스완나",
    "vanillite": "바닐프티",
    "vanillish": "바닐리치",
    "vanilluxe": "배바닐라",
    "deerling": "사철록",
    "sawsbuck": "바라철록",
    "emolga": "에몽가",
    "karrablast": "딱정곤",
    "escavalier": "슈바르고",
    "foongus": "깜놀버슬",
    "amoonguss": "뽀록나",
    "frillish": "탱그릴",
    "jellicent": "탱탱겔",
    "alomomola": "맘복치",
    "joltik": "파쪼옥",
    "galvantula": "전툴라",
    "ferroseed": "철시드",
    "ferrothorn": "너트령",
    "klink": "기어르",
    "klang": "기기어르",
    "klinklang": "기기기어르",
    "tynamo": "저리어",
    "eelektrik": "저리릴",
    "eelektross": "저리더프",
    "elgyem": "리그레",
    "beheeyem": "벰크",
    "litwick": "불켜미",
    "lampent": "램프라",
    "chandelure": "샹델라",
    "axew": "터검니",
    "fraxure": "액슨도",
    "haxorus": "액스라이즈",
    "cubchoo": "코고미",
    "beartic": "툰베어",
    "cryogonal": "프리지오",
    "shelmet": "쪼마리",
    "accelgor": "어지리더",
    "stunfisk": "메더",
    "mienfoo": "비조푸",
    "mienshao": "비조도",
    "druddigon": "크리만",
    "golett": "골비람",
    "golurk": "골루그",
    "pawniard": "자망칼",
    "bisharp": "절각참",
    "bouffalant": "버프론",
    "rufflet": "수리둥보",
    "braviary": "워글",
    "vullaby": "벌차이",
    "mandibuzz": "버랜지나",
    "heatmor": "앤티골",
    "durant": "아이앤트",
    "deino": "모노두",
    "zweilous": "디헤드",
    "hydreigon": "삼삼드래",
    "larvesta": "활화르바",
    "volcarona": "불카모스",
    "cobalion": "코바르온",
    "terrakion": "테라키온",
    "virizion": "비리디온",
    "tornadus": "토네로스",
    "thundurus": "볼트로스",
    "reshiram": "레시라무",
    "zekrom": "제크로무",
    "landorus": "랜드로스",
    "kyurem": "큐레무",
    "keldeo": "케르디오",
    "meloetta": "메로엣타",
    "genesect": "게노세크트",
    "chespin": "도치마론",
    "quilladin": "도치보구",
    "chesnaught": "브리가론",
    "fennekin": "푸호꼬",
    "braixen": "테르나",
    "delphox": "마폭시",
    "froakie": "개구마르",
    "frogadier": "개굴반장",
    "greninja": "개굴닌자",
    "bunnelby": "파르빗",
    "diggersby": "파르토",
    "fletchling": "화살꼬빈",
    "fletchinder": "불화살빈",
    "talonflame": "파이어로",
    "scatterbug": "분이벌레",
    "spewpa": "분떠도리",
    "vivillon": "비비용",
    "litleo": "레오꼬",
    "pyroar": "화염레오",
    "flabébé": "플라베베",
    "floette": "플라엣테",
    "florges": "플라제스",
    "skiddo": "메이클",
    "gogoat": "고고트",
    "pancham": "판짱",
    "pangoro": "부란다",
    "furfrou": "트리미앙",
    "espurr": "냐스퍼",
    "meowstic": "냐오닉스",
    "honedge": "단칼빙",
    "doublade": "쌍검킬",
    "aegislash": "킬가르도",
    "spritzee": "슈쁘",
    "aromatisse": "프레프티르",
    "swirlix": "나룸퍼프",
    "slurpuff": "나루림",
    "inkay": "오케이징",
    "malamar": "칼라마네로",
    "binacle": "거북손손",
    "barbaracle": "거북손데스",
    "skrelp": "수레기",
    "dragalge": "드래캄",
    "clauncher": "완철포",
    "clawitzer": "블로스터",
    "helioptile": "목도리키텔",
    "heliolisk": "일레도리자드",
    "tyrunt": "티고라스",
    "tyrantrum": "견고라스",
    "amaura": "아마루스",
    "aurorus": "아마루르가",
    "sylveon": "님피아",
    "hawlucha": "루차불",
    "dedenne": "데덴네",
    "carbink": "멜리시",
    "goomy": "미끄메라",
    "sliggoo": "미끄네일",
    "goodra": "미끄래곤",
    "klefki": "클레피",
    "phantump": "나목령",
    "trevenant": "대로트",
    "pumpkaboo": "호바귀",
    "gourgeist": "펌킨인",
    "bergmite": "꽁어름",
    "avalugg": "크레베이스",
    "noibat": "음뱃",
    "noivern": "음번",
    "xerneas": "제르네아스",
    "yveltal": "이벨타르",
    "zygarde": "지가르데",
    "diancie": "디안시",
    "hoopa": "후파",
    "volcanion": "볼케니온",
    "rowlet": "나몰빼미",
    "dartrix": "빼미스로우",
    "decidueye": "모크나이퍼",
    "litten": "냐오불",
    "torracat": "냐오히트",
    "incineroar": "어흥염",
    "popplio": "누리공",
    "brionne": "키요공",
    "primarina": "누리레느",
    "pikipek": "콕코구리",
    "trumbeak": "크라파",
    "toucannon": "왕큰부리",
    "yungoos": "영구스",
    "gumshoos": "형사구스",
    "grubbin": "턱지충이",
    "charjabug": "전지충이",
    "vikavolt": "투구뿌논",
    "crabrawler": "오기지게",
    "crabominable": "모단단게",
    "oricorio": "춤추새",
    "cutiefly": "에블리",
    "ribombee": "에리본",
    "rockruff": "암멍이",
    "lycanroc": "루가루암",
    "wishiwashi": "약어리",
    "mareanie": "시마사리",
    "toxapex": "더시마사리",
    "mudbray": "머드나기",
    "mudsdale": "만마드",
    "dewpider": "물거미",
    "araquanid": "깨비물거미",
    "fomantis": "짜랑랑",
    "lurantis": "라란티스",
    "morelull": "자마슈",
    "shiinotic": "마셰이드",
    "salandit": "야도뇽",
    "salazzle": "염뉴트",
    "stufful": "포곰곰",
    "bewear": "이븐곰",
    "bounsweet": "달콤아",
    "steenee": "달무리나",
    "tsareena": "달코퀸",
    "comfey": "큐아링",
    "oranguru": "하랑우탄",
    "passimian": "내던숭이",
    "wimpod": "꼬시레",
    "golisopod": "갑주무사",
    "sandygast": "모래꿍",
    "palossand": "모래성이당",
    "pyukumuku": "해무기",
    "type: null": "타입:널",
    "silvally": "실버디",
    "minior": "메테노",
    "komala": "자말라",
    "turtonator": "폭거북스",
    "togedemaru": "토게데마루",
    "mimikyu": "따라큐",
    "bruxish": "치갈기",
    "drampa": "할비롱",
    "dhelmise": "타타륜",
    "jangmo-o": "짜랑꼬",
    "hakamo-o": "짜랑고우",
    "kommo-o": "짜랑고우거",
    "tapu koko": "카푸꼬꼬꼭",
    "tapu lele": "카푸나비나",
    "tapu bulu": "카푸브루루",
    "tapu fini": "카푸느지느",
    "cosmog": "코스모그",
    "cosmoem": "코스모움",
    "solgaleo": "솔가레오",
    "lunala": "루나아라",
    "nihilego": "텅비드",
    "buzzwole": "매시붕",
    "pheromosa": "페로코체",
    "xurkitree": "전수목",
    "celesteela": "철화구야",
    "kartana": "종이신도",
    "guzzlord": "악식킹",
    "necrozma": "네크로즈마",
    "magearna": "마기아나",
    "marshadow": "마샤도",
    "poipole": "베베놈",
    "naganadel": "아고용",
    "stakataka": "차곡차곡",
    "blacephalon": "두파팡",
    "zeraora": "제라오라",
    "meltan": "멜탄",
    "melmetal": "멜메탈",
    "grookey": "흥나숭",
    "thwackey": "채키몽",
    "rillaboom": "고릴타",
    "scorbunny": "염버니",
    "raboot": "래비풋",
    "cinderace": "에이스번",
    "sobble": "울머기",
    "drizzile": "누겔레온",
    "inteleon": "인텔리레온",
    "skwovet": "탐리스",
    "greedent": "요씽리스",
    "rookiedee": "파라꼬",
    "corvisquire": "파크로우",
    "corviknight": "아머까오",
    "blipbug": "두루지벌레",
    "dottler": "레돔벌레",
    "orbeetle": "이올브",
    "nickit": "훔처우",
    "thievul": "폭슬라이",
    "gossifleur": "꼬모카",
    "eldegoss": "백솜모카",
    "wooloo": "우르",
    "dubwool": "배우르",
    "chewtle": "깨물부기",
    "drednaw": "갈가부기",
    "yamper": "멍파치",
    "boltund": "펄스멍",
    "rolycoly": "탄동",
    "carkol": "탄차곤",
    "coalossal": "석탄산",
    "applin": "과사삭벌레",
    "flapple": "애프룡",
    "appletun": "단지래플",
    "silicobra": "모래뱀",
    "sandaconda": "사다이사",
    "cramorant": "윽우지",
    "arrokuda": "찌로꼬치",
    "barraskewda": "꼬치조",
    "toxel": "일레즌",
    "toxtricity": "스트린더",
    "sizzlipede": "태우지네",
    "centiskorch": "다태우지네",
    "clobbopus": "때때무노",
    "grapploct": "케오퍼스",
    "sinistea": "데인차",
    "polteageist": "포트데스",
    "hatenna": "몸지브림",
    "hattrem": "손지브림",
    "hatterene": "브리무음",
    "impidimp": "메롱꿍",
    "morgrem": "쏘겨모",
    "grimmsnarl": "오롱털",
    "obstagoon": "가로막구리",
    "perrserker": "나이킹",
    "cursola": "산호르곤",
    "sirfetch'd": "창파나이트",
    "mr. rime": "마임꽁꽁",
    "runerigus": "데스판",
    "milcery": "마빌크",
    "alcremie": "마휘핑",
    "falinks": "대여르",
    "pincurchin": "찌르성게",
    "snom": "누니머기",
    "frosmoth": "모스노우",
    "stonjourner": "돌헨진",
    "eiscue": "빙큐보",
    "indeedee": "에써르",
    "morpeko": "모르페코",
    "cufant": "끼리동",
    "copperajah": "대왕끼리동",
    "dracozolt": "파치래곤",
    "arctozolt": "파치르돈",
    "dracovish": "어래곤",
    "arctovish": "어치르돈",
    "duraludon": "두랄루돈",
    "dreepy": "드라꼰",
    "drakloak": "드래런치",
    "dragapult": "드래펄트",
    "zacian": "자시안",
    "zamazenta": "자마젠타",
    "eternatus": "무한다이노",
    "kubfu": "치고마",
    "urshifu": "우라오스",
    "zarude": "자루도",
    "regieleki": "레지에레키",
    "regidrago": "레지드래고",
    "glastrier": "블리자포스",
    "spectrier": "레이스포스",
    "calyrex": "버드렉스",
    "wyrdeer": "신비록",
    "kleavor": "사마자르",
    "ursaluna": "다투곰",
    "basculegion": "대쓰여너",
    "sneasler": "포푸니크",
    "overqwil": "장침바루",
    "enamorus": "러브로스",
    "sprigatito": "나오하",
    "floragato": "나로테",
    "meowscarada": "마스카나",
    "fuecoco": "뜨아거",
    "crocalor": "악뜨거",
    "skeledirge": "라우드본",
    "quaxly": "꾸왁스",
    "quaxwell": "아꾸왁",
    "quaquaval": "웨이니발",
    "lechonk": "맛보돈",
    "oinkologne": "퍼퓨돈",
    "tarountula": "타랜툴라",
    "spidops": "트래피더",
    "nymble": "콩알뚜기",
    "lokix": "엑스레그",
    "pawmi": "빠모",
    "pawmo": "빠모트",
    "pawmot": "빠르모트",
    "tandemaus": "두리쥐",
    "maushold": "파밀리쥐",
    "fidough": "쫀도기",
    "dachsbun": "바우첼",
    "smoliv": "미니브",
    "dolliv": "올리뇨",
    "arboliva": "올리르바",
    "squawkabilly": "시비꼬",
    "nacli": "베베솔트",
    "naclstack": "스태솔트",
    "garganacl": "콜로솔트",
    "charcadet": "카르본",
    "armarouge": "카디나르마",
    "ceruledge": "파라블레이즈",
    "tadbulb": "빈나두",
    "bellibolt": "찌리배리",
    "wattrel": "찌리비",
    "kilowattrel": "찌리비크",
    "maschiff": "오라티프",
    "mabosstiff": "마피티프",
    "shroodle": "땃쭈르",
    "grafaiai": "태깅구르",
    "bramblin": "그푸리",
    "brambleghast": "공푸리",
    "toedscool": "들눈해",
    "toedscruel": "육파리",
    "klawf": "절벼게",
    "capsakid": "캡싸이",
    "scovillain": "스코빌런",
    "rellor": "구르데",
    "rabsca": "베라카스",
    "flittle": "하느라기",
    "espathra": "클레스퍼트라",
    "tinkatink": "어리짱",
    "tinkatuff": "벼리짱",
    "tinkaton": "두드리짱",
    "wiglett": "바다그다",
    "wugtrio": "바닥트리오",
    "bombirdier": "떨구새",
    "finizen": "맨돌핀",
    "palafin": "돌핀맨",
    "varoom": "부르롱",
    "revavroom": "부르르룸",
    "cyclizar": "모토마",
    "orthworm": "꿈트렁",
    "glimmet": "초롱순",
    "glimmora": "킬라플로르",
    "greavard": "망망이",
    "houndstone": "묘두기",
    "flamigo": "꼬이밍고",
    "cetoddle": "터벅고래",
    "cetitan": "우락고래",
    "veluza": "가비루사",
    "dondozo": "어써러셔",
    "tatsugiri": "싸리용",
    "annihilape": "저승갓숭",
    "clodsire": "토오",
    "farigiraf": "키키링",
    "dudunsparce": "노고고치",
    "kingambit": "대도각참",
    "great tusk": "위대한엄니",
    "scream tail": "우렁찬꼬리",
    "brute bonnet": "사나운버섯",
    "flutter mane": "날개치는머리",
    "slither wing": "땅을기는날개",
    "sandy shocks": "모래털가죽",
    "iron treads": "무쇠바퀴",
    "iron bundle": "무쇠보따리",
    "iron hands": "무쇠손",
    "iron jugulis": "무쇠머리",
    "iron moth": "무쇠독나방",
    "iron thorns": "무쇠가시",
    "frigibax": "드니차",
    "arctibax": "드니꽁",
    "baxcalibur": "드닐레이브",
    "gimmighoul": "모으령",
    "gholdengo": "타부자고",
    "wo-chien": "총지엔",
    "chien-pao": "파오젠",
    "ting-lu": "딩루",
    "chi-yu": "위유이",
    "roaring moon": "고동치는달",
    "iron valiant": "무쇠무인",
    "koraidon": "코라이돈",
    "miraidon": "미라이돈",
    "walking wake": "굽이치는물결",
    "iron leaves": "무쇠잎새",
    "dipplin": "과미르",
    "poltchageist": "차데스",
    "sinistcha": "그우린차",
    "okidogi": "조타구",
    "munkidori": "이야후",
    "fezandipiti": "기로치",
    "ogerpon": "오거폰",
    "archaludon": "브리두라스",
    "hydrapple": "과미드라",
    "gouging fire": "꿰뚫는화염",
    "raging bolt": "날뛰는우레",
    "iron boulder": "무쇠암석",
    "iron crown": "무쇠감투",
    "terapagos": "테라파고스",
    "pecharunt": "복숭악동"
  ]
  
  // 영어 이름에 해당하는 한국어 이름을 반환, 없으면 영어 이름 그대로 반환
  static func getKoreanName(for englishName: String) -> String {
    return koreanNames[englishName.lowercased()] ?? englishName
  }
}

/* 사용 예시
 let pokemonName = "Pikachu"
 let koreanName = PokemonTranslator.getKoreanName(for: pokemonName)
 print("\(pokemonName)의 한국어 이름: \(koreanName)")
 */

func getkoreanTypeName(for typeName: String) -> String {
    guard let type = PokemonTypeName(rawValue: typeName.lowercased()) else {
        return "알 수 없는 타입"
    }
    return type.displayName
}
enum PokemonTypeName: String, CaseIterable, Codable {
    case normal
    case fire
    case water
    case electric
    case grass
    case ice
    case fighting
    case poison
    case ground
    case flying
    case psychic
    case bug
    case rock
    case ghost
    case dragon
    case dark
    case steel
    case fairy

    var displayName: String {
        switch self {
        case .normal: return "노말"
        case .fire: return "불꽃"
        case .water: return "물"
        case .electric: return "전기"
        case .grass: return "풀"
        case .ice: return "얼음"
        case .fighting: return "격투"
        case .poison: return "독"
        case .ground: return "땅"
        case .flying: return "비행"
        case .psychic: return "에스퍼"
        case .bug: return "벌레"
        case .rock: return "바위"
        case .ghost: return "고스트"
        case .dragon: return "드래곤"
        case .dark: return "어둠"
        case .steel: return "강철"
        case .fairy: return "페어리"
        }
    }
}
