//
//  DetailVC.swift
//  504Words
//
//  Created by MAC os on 2/1/21.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var head: UILabel!
    @IBOutlet weak var first: UILabel!
    @IBOutlet weak var second: UILabel!
    @IBOutlet weak var third: UILabel!
    @IBOutlet weak var forth: UILabel!
    @IBOutlet weak var fifth: UILabel!
    @IBOutlet weak var sixth: UILabel!
    
    var word = [String]()
    var WordsNMeaning = [String:String]()

    
    var test:[String:[String]] = [
        "abandon": ["ترک کردن – رها کردن – نا تمام گذاشتن"," leave – desert","We have to abandon the car and walk rest of the way.","ما مجبوریم ماشین را رها کنیم و ادامه راه را پیاده برویم.","The game had to be abandoned due to bad weather.","بازی باید بخاطر هوای نا مساعد نا تمام بماند."],
        "keen":[" تیز – شدید – مشتاق – حساس","eager (مشتاق) – sharp (تیز)","John was very eager to help.","جان خیلی مشتاق بود تا کمک کند.","The man had a keen knife in his hand.","جان خیلی مشتاق بود تا کمک کند."],
       
        "jealous":["حسود – حسادت","envious","She is jealous of my success.","او به موفقیت من حسادت میکند.","",""],
       
        "tact":["تدبیر – ملاحظه – کیاست","tactfulness (کاردانی) – diplomacy (سیاست)","He is known for his tact.","او بخاطر تدبیرش معروف است.","With great tact, Sara made her son to apologize.","با تدبیر و کیاست عالی، سارا پسرش را مجبور به معذرت خواهی کرد."],
        "oath":["سوگند – قسم – ناسزا","swear","You must not break your oath.","شما نباید سوگند خود را بشکنید.","He was shouting oaths when they led him away.","او داشت ناسزاهایی را فریاد میزد وقتی که آنها اورا کنار گذاشتند."],
        "vacant":["خالی – اشغال نشده","unoccupied – empty","The seat next to me is vacant.","صندلی کنار من خالی است.","Is there a vacant room here?","آیا اینجا اتاق خالی وجود دارد؟"],
        "hardship":["سختی – دشواری","hardness – difficulty","We have to endure the hardships of life.","ما مجبوریم تا سختیهای زندگی را تحمل کنیم.","People suffered many hardships during that long winter.","مردم در طول آن زمستان طولانی از دشواری های زیادی رنج بردند."],
        "gallant":["شجاع – با شکوه – دلاور – نجیب زاده و شجاع","heroic","Many gallant knights entered the contest to win the princess.","شواله های شجاع زیادی به رقابت پرداختند تا شاهدخت را از آن خود کنند.","Eddy is so gallant that he always gives up his subway seat to a woman.","ادی آنقدر نجیب است که همیشه در مترو صندلی خود را به یک خانم میدهد."],
        "data":["اطلاعات – داده ها","facts – information","This data is collected from seven countries.","این اطلاعات از هفت کشور جمع آوری شده است.","These data show that the most of the illnesses are the result of bad eating habits."," این داده ها نشان میدهند که بیشتر بیماریها نتیجه ی عادات غذایی بد است."],
        "unaccustomed":["عادت نکرده – خو نگرفته – نا آشنا (به)","unadopted – unadjusted","He was unaccustomed to hard work.","او به کار سخت عادت نکرده بود.","I am unaccustomed to being told what to do.","من عادت ندارم به اینکه به من بگویند چکار کن و چکار نکن."],
        "bachelor":["مرد مجرد – عزب","not married","The Crown prince was japan’s the most eligible bachelor.","شاهزاده کراون تنها مجرد شایسته ژاپن بود.","",""],
        "qualify":["واجد شرایط بودن – نائل شدن – مجاز شدن","modify","These training course will qualify you for a better job.","این دوره های تمرینی شما را برای یک شغل بهتر واجد شرایط خواهند کرد.","This test qualifies you to drive heavy vehicles.","این تست شما را مجاز به رانندگی وسایل نقلیه سنگین میکند."],
        "corpse":["جسد، لاشه، پیکر","dead body","The corpse wasn’t recognizable.","جسد قابل شناسایی نبود.","The corpse was laid in the vacant coffin.","جسد در داخل تابوت خالی قرار داده شد."],
        "conceal":["مخفی کردن – پنهان کردن – کتمان کردن","hide","Loris could not conceal his love for Gloria.","لولیر نتوانست عشقش را به گلوریا مخفی کند.","The money was so cleverly concealed that we were forced to abandon our search for it.","پول چنان زیرکانه مخفی شده بود که ما مجبور شدیم جست و جوی آن را رها کنیم."],
        "dismal":["دلگیر – غم انگیز – گرفته – بی روح","gloomy- miserable – cheerless","When the weather is so dismal, I sometimes stay in bed all day.","هنگامی که هوا گرفته و دلگیر است، گاهی اوقات تمام طول روز را در تخت میمانم.","I am unaccustomed to this dismal climate.","من به این آب و هوای بی روح و دلگیر عادت نکرده ام."],
        "frigid":["بسیار سرد – منجمد – رفتار سرد","freezing – frosty – very cold","There was a frigid atmosphere in the room.","فضای بسیار سردی بر اتاق حاکم بود.","The jealous girl treated in a frigid manner with her friends.","دختر با دوستانش به سردی رفتار کرد."],
        "inhabit":["ساکن بودن – زندگی کردن (در)","live in","Eskimos inhabit the frigid part of Alaska.","اسکیموها در بخش بسیار سرد آلاسکا ساکن هستند.","Several hundred species of birds inhabit the island.","چند صد نوع پرنده در جزیره زندگی میکنند."],
        "numb":["بی حس – کرخت","insensitive – unfeeling","The left side of my face was still numb an hour after the surgery.","سمت راست صورتم تا یک ساعت بعد از جراحی هنوز بی حس بود.","It was so cold that my fingers became numb.","چنان سرد بود که انگشتانم بی حس شدند."],
        "peril":["خطر – به خطر انداختن"," danger – risk – engangerment","There is great peril in trying to climb the mountain.","در بالا رفتن از کوه خطر بزرگی وجود دارد.","The natives abandoned the hunter when he described the peril that lay ahead of them.","افراد بومی شکارچی را ترک کردند وقتی که او گفت چه خطری بر آنها سایه افکنده است."],
        "recline":[" تکیه دادن – لم دادن – دراز کشیدن","lean back – lie down","Richard likes to recline in front of the television set.","ریچارد دوست دارد که جلوی تلویزیون دراز بکشد.","My dog’s greatest pleasure is to recline by the warm fireplace.","بزرگترین لذت سگ من این است که کنار شومینه لم بدهد."],
        "shriek":["جیغ – جیغ کشیدن"," scream – yell – shrill","Mike shrieked when she discovered the corpse.","مایک وقتی جسد را پیدا کرد جیغ کشید.","Sara fled from the room with a loud shriek.","سارا با یک جیغ بلند از اتاق فرار کرد."],
        "sinister":[" شرور – خبیث – شیطان صفت – شیطانی","evil – wicked – dishonest","I was frightened by the sinister shadow at the bottom of the stairs.","من بخاطر سایه شیطانی در پایین پله ها وحشت کرده بودم.","There is something sinister about Mr. Brown.","یک چیز شیطانی در مورد آقای براون وجود دارد."],
        "tempt‎":["وسوسه کردن – اغوا کردن – تحریک و دعوت (به)","invite","A banana can tempt me to break my diet.","یک موز میتواند مرا وسوسه کند تا رژیم غذایی ام را بشکنم.","Don’t tempt thieves by leaving valuable things visible.","دزدان را با قرار دادن اشیاء ارزشمند در معرض دید، وسوسه نکنید."],
        "wager":["شرط بستن – شرط بندی","bet – stake","After winning the wager, Jim treated everyone to free drinks.","بعد از برنده شدن در شرط بندی، جیم همه را با نوشیدنی مهمان کرد.","He wagered $50 on the game.","او پنجاه دلار بر روی بازی شرط بندی کرد."],
        "typical":["عادی، معمولی","usual – normal – regular","On a typical day, we receive about fifty letters.","در یک روز عادی حدود پنجاه نامه دریافت میکنیم.","The sinister character in the movie wore a typical costume.","شخصیت شرور در فیلم یک لباس عادی پوشیده بود."],
        "minimum":[" حداقل – کمترین","at least","The class needs a minimum of ten students to continue.","کلاس حداقل به ده دانش آموز نیاز دارد تا ادامه پیدا کند.","Studies show that adults need a minimum of six hours sleep.","مطالعات نشان میدهند که افراد بزرگسال حداقل به شش ساعت خواب نیاز دارند."],
        "scarce":["کمیاب – نادر – نایاب – کم","scant – rare","Houses that are older than one hundred years are scarce.","خانه هایی که بیش از صد سال عمر داشته باشند کم یاب اند.","Because there is little moisture in the desert, trees are scarce.","بخاطر اینکه رطوبت کمی در صحرا وجود دارد، درختان کم هستند."],
        "annual":["سالیانه – سالانه – سالی یک بار – سالنامه"," yearly – once a year","The annual meeting is in July.","نشست سالانه در ماه جولای است.","The publishers of the encyclopedia put out a book each year called an annual.","مولفان دانشنامه هر ساله کتابی را منتشر میکنند که سالنامه نامیده میشود."],
        "persuade":[" متقاعد کردن – مجاب کردن","convince – satisfy","Can you persuade him to give up his bachelor days and get married?","آیا میتوانی اورا متقاعد کنی تا دست از مجردی بردارد و ازدواج کند؟","No one could persuade the captain to leave the sinking ship.","هیچ کس نتوانست کاپیتان را راضی کند تا کشتی در حال غرق شدن را ترک کند."],
        "essential":["لازم – ضروری – اساسی","necessary – critical – required – very important","It is essential that we follow the road map.","ضروری است که ما نقشه جاده را دنبال کنیم.","The essential items for baking a cake are flour and sugar.","مواد لازم برای پختن کیک آرد و شکر میباشند."],
        "blend":["مخلوط – مخلوط کردن – قاطی کردن – ترکیب شدن","mix – mixture – combine","The colors of the rainbow blend into one another.","رنگهای رنگین کمان با هم ترکیب شدند.","A good blend of fine products will result in delicious food.","یک مخلوط خوب از محصولات خوب منجر به یک غذای لذیذ خواهد شد."],
        "visible":["مرئی – قابل رویت – آشکار"," observable – seeable","The ship was barely visible through the dense fog.","کشتی از میان مه غلیظ به زحمت قابل رویت بود.","Before the stars are visible, the sky has to become quite dark.","قبل از اینکه ستاره ها آشکار شوند، آسمان باید نسبتا تاریک شود."],
        "expensive":[" گران – پربها – بهادار – هزینه بردار"," costly – high-priced","Because diamonds are scarce they are expensive.","الماسها بخاطر کمیاب بودن گران هستند.","Ellen’s expensive dress created a great deal of excitement at the party.","لباس گران الن هیجان زیادی در مهمانی به پا کرد."],
        "talent":[" استعداد – قریحه","faculty – geniu","Jimmy’s talent was noted when she was in first grade.","استعداد جیمی وقتی که کلاس اول بود جلب توجه کرد.","Hard work can often make up for a lack of talent.","سخت کوشی اغلب میتواند نداشتن استعداد را جبران کند."],
        "devise":["ابداع کردن – تدبیر کردن – طرح کردن","invent – think out – plan","I want to devise a method for keeping my toes from becoming numb while I am ice skating.","میخواهم روشی ابداع کنم برای جلوگیری از بی حس شدن انگشتانم درحالی که دارم اسکی میکنم.","If we could devise a plan for using the abandoned building, we could save thousands of dollars.","اگر بتوانیم نقشه ای برای استفاده از ساختمان متروکه طرح کنیم، میتوانیم هزاران دلار پس انداز کنیم."],
        "wholesale":["عمده فروشی – کلان فروشی – گسترده","","Many people were angered by the wholesale slaughter of birds.","افراد زیادی به خاطر کشتن گسترده پرندگان خشمگین بودند.","By buying my goods wholesale I can save ten thousand dollars a year.","با عمده فروشی محصولاتم میتوانم هر سال ده زار دلار پس انداز کنم."],
        "vapor":["بخار – مه -دود – دود و بخار","fog – moist","Warm air holds more water vapor than cold air.","هوای گرم بخار آب بیشتری را نسبت به هوای سرد در خود نگه میدارد.","He has gathered data on the amount of vapor rising from the swamp.","او اطلاعاتی درباره مقدار بخاری که از باتلاق بلند میشود جمع کرده است."],
        "eliminate":["حذف کردن – از قلم انداختن – از میان برداشتن – از شر چیزی راحت شدن"," remove – omit – get rid of","This virus can never be entirely eliminated from the body.","این ویروس هرگز نمیتواند ب طور کامل از بدن حذف شود.","She hired an assassin to eliminate her rival.","او یک قاتل اجیر کرد تا رقیبش را از میان بردارد."],
        "villain":["آدم شرور – آدم بد – ناکس","devil – sinister","The villain concealed the corpse in the cellar.","آن آدم شرور جنازه را در زیر زمین مخفی کرد.","When the villain fell down the well, everyone lived happily ever after.","وقتی که آن ناکس در چاه افتاد، بعد از آن همه با شادی و خوشحالی زندگی کردند."],
        "dense":[" غلیظ – متراکم – انبوه – پرپشت"," thick – compact – crowded","We couldn’t row because of the dense weeds in the lake.","بخاطر انبوه علفها در دریاچه نتوانستیم پارو بزنیم.","Either side of the river is dense, impenetrable jungle.","در هر دو طرف رودخانه جنگلی انبوه و غیر قابل نفوذ است."],
        "utilize":["به کار بردن – به کار گرفتن – استفاده کردن"," use – apply","No one seems willing to utilize this vacant house.","به نظر کسی مشتاق به استفاده از این خانه خالی نیست.","Does your mother utilize leftovers in her cooking?","آیا مادرت از پس مانده غذاها در آشپزی اش استفاده میکند؟"],
        "humid":["نمناک – نمدار – مطوب"," damp – moggy – moist","Most people believe that ocean air is quite humid.","اکثر مردم بر این باورند که هوای اقیانوس کاملا مرطوب است.","New York people usually complain in the summer of the humid air.","مردم نیویورک معمولا در تابستان از هوای مرطوب شکایت دارند."],
        "theory":[" نظریه – فرضیه – تئوری","hypothesis – supposition","Einstein’s theory is really too difficult for the average person to understand.","درک کردن نظریه انیشتین برای یک شخص عادی واقعا دشوار است.","My uncle has a theory about the effect of weather on baseball players.","عموی من نظریه ای درباره تاثیر آب و هوا بر بازیکنان بیسبال دارد."],
        "descend":["پایین آمدن – نزول کردن – فرود آمدن","fall – decline","If we let the air out of a balloon, it will have to descend.","اگر به هوای دخل بالون اجازه خارج شدن بدهیم، پایین خواهد آمد.","The pilot, thinking his plane was in peril, descended quickly.","خلبان که فکر میکرد هواپیمایش در خطر است، سریعا فرود آمد."],
        "circulate":["دور زدن – پخش کردن – پراکنده کردن – چرخ زدن","broadcast – spread","A fan may circulate the air in summer, but it doesn’t cool it.","پنکه شاید هوا را در تابستان پخش کند، اما آن را خنک نمیکند.","Hot water circulates through the pipes in the building and makes the rooms warm.","آب داغ در درون لوله های ساختمان میگردد و اتاقها را گرم میکند."],
        "enormous":[" عظیم – کلان – هنگفت – بسیار بزرگ – بسیار زیاد","huge – giant – massive – vast","The enormous crab moved across the ocean floor in search of food.","خرچنگ بزرگ در کف اقاینوس در جست و جوی غذا حرکت کرد.","Public hangings once drew enormous crowds.","اعدام های در ملا عام جمعیت بسیار زیادی را جمع میکرد."],
        "predict":["پیشگویی کردن – پیش بینی کردن","forecast – foretell – prophesy","Who can predict the champion of the league this year?","چه کسی میتواند قهرمان امسال لیگ را پیش بینی کند؟","Laura thought she could predict what I would do, but she was wrong.","لورا فکر کرد که میتواند پیش بینی کند که من چه کار میخواستم بکنم، اما او شتباه میکرد."],
        "vanish":["ناپدید شدن – غیب شدن – از میان رفتن – زایل شدن","disappear – evaporate","Even in California the sun sometimes vanishes behind a cloud.","حتی در کالیفرنیا هم خورشید بعضی اوقات در پشت ابر پنهان میشود."," If you give him a week without a job, all his money will vanish.","اگر او را یک هفته بدون شغل بگذارید تمام پولهایش غیب خواهد شد (تمام خواهد شد)."],
        "tradition":["رسم – سنت – عرف","custom – convention","The father tried to persuade his son that the tradition of marriage was important.","پدر سعی کرد تا پسرش را متقاعد کند که ازدواج رسم و سنت مهمی است.","All religions have different beliefs and traditions.","تمامی مذهب ها باورها و رسومات مختلفی دارند."],
        "rural":["روستایی – روستانشین","pastoral","Rural areas are not densely populated.","مناطق روستایی جمعیت انبوهی ندارند.","The rural life is much more peaceful than the city one.","زندگی روستایی آرام تر از زندگی شهری است."],
        "burden":["بار – محموله – فشار و بار روحی و روانی","load","I don’t like being a burden on other people.","دوست ندارم باری بر روی دوش بقیه باشم.","Ricky carried the burden by using the elevator.","ریکی محموله را با استفاده از آسانسور حمل کرد."],
        "campus":["محوطه دانشگاه یا مدرسه – پردیس","","I decided to go to Penn State because it has a beautiful campus.","من تصمیم گرفتم که به “پِن استِیت” بروم چون محوطه زیبایی دارد.","The campus is designed to utilize all of the college’s buildings.","محوطه طوری طراحی شده است تا از تمامی ساختمان های دانشکده استفاده شود."],
        "majority":[" اکثریت – بیشینه","generality","The majority of people prefer to pay wholesale prices for meat.","اکثر مردم ترجیح میدهند تا قیمت گوشت را به صورت قیمت عمده پرداخت کنند.","In the majority of cases this disease is fatal.","در اکثر موارد، این بیماری کشنده است."],
        "assemble":["جور کردن – فراهم آوردن – گرد آوردن – جمع کردن","collect – gather – get together","All the people who had assembled for the picnic vanished when the rain began to fall.","تمامی افرادی که برای پیکنیک گرد آمده بودند، با شروع بارش باران ناپدید شدند.","We need to assemble a list of songs for the concert.","ما باید لیستی از آهنگها را برای کنسرت فراهم کنیم."],
        "explore":["کاوش کردن – جست و جو کردن – گشتن – وارسی کردن – بررسی کردن","investigate – probe – check int – examine","Our lawyer explored the essential reasons for the crime.","وکیل ما دلایل ضروری برای جنایت را مورد بررسی قرار داد.","Sara wanted to know if all of the methods for solving the problem had been explored.","سارا خواس تا بداند که تمامی روشها برای حل مسئله بررسی شده اند."],
        "topic":["موضوع – عنوان – سرفصل – مقوله","subject – matter","Predicting the weather is our favorite topic of conversation.","پیش بینی آب و هوا موضوع مورد علاقه صحبت ماست.","Valerie only discussed topics that she knew well.","والری فقط درباره موضوعاتی که خوب بلد بود صحبت کرد."],
        "debate":["مباحثه – مناظره – جر و بحث","discussion","The debate between the two candidates was canseled.","مناظره بین دو نامزد انتخاباتی لغو شد.","Debate in the U.S. Senate lasted for five days.","مناظره در سنای آمریکا پنج روز طول کشید."],
        "evade":["شانه خالی کردن – طفره رفتن – اجتناب کردن – فرار کردن از","avoid – escape – get around","In order to evade the police dragnet, Henry grew a beard.","هنری به منظور فرار کردن از دام پلیس ریش گذاشت.","The prisoner evaded questioning by pretending to be sick.","زندانی با تظاهر به مریضی از بازجویی طفره رفت."],
        "probe":["بررسی کردن – کاوش کردن","investigate – research","The lawyer probed the man’s mind to see if he was innocent or not.","وکیل ذهن مرد را بررسی کرد تا ببیند بیگناه است یا نه.","After probing the scientist’s theory, we proved it was correct.","بعد از بررسی نظریه ی دانشمند، ثابت کردیم که که آن درست بود."],
        "reform":[" اصلاح کردن – سامان دادن – احیا کردن – ترمیم کردن","regenerate – rehabilitate – make better","Billy reformed when he saw that breaking the law was hurting people other than himself.","بیلی وقتی دید که قانون شکنی بجز خودش به افراد دیگر آسیب میزند اصلاح شد.","The laws need to reformed.","قوانین نیاز به سامان دادن دارند."],
                                            ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground()
          for (key, value) in test {
            if key == word[0] {
                head.text = key
                first.text = value[0]
                second.text = value[1]
                third.text = value[2]
                forth.text = value[3]
                fifth.text = value[4]
                sixth.text = value[5]
            }
          
        }
     }
    
 
    func setGradientBackground() {
        let colorTop =  UIColor(red: 43/255.0, green: 88/255.0, blue: 118/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 78/255.0, green: 68/255.0, blue: 118/255.0, alpha: 1.0).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
        
       self.view.layer.insertSublayer(gradientLayer, at:0)
    }
}
