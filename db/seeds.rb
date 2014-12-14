require 'faker'

User.destroy_all

users = [
	{twitter_username: "katyperry", youtube_username: "PewDieDie", soundcloud_username: "skrillex"},
	{twitter_username: "justinbieber", youtube_username: "Smosh", soundcloud_username: "computerjay"},
	{twitter_username: "BarackObama", youtube_username: "judsonlaipply", soundcloud_username: "diplo"},
	{twitter_username: "taylorswift13", youtube_username: "Brookers", soundcloud_username: "dillon-francis"},
	{twitter_username: "ladygaga", youtube_username: "geriatric1927", soundcloud_username: "zeds-dead"},
	{twitter_username: "britneyspears", youtube_username: "lonelygirl15", soundcloud_username: "a-trak"},
	{twitter_username: "jtimberlake", youtube_username: "nigahiga", soundcloud_username: "dj-nobody"},
	{twitter_username: "rihanna", youtube_username: "Fred", soundcloud_username: "flosstradamus"},
	{twitter_username: "auria", youtube_username: "holasoygerman", soundcloud_username: "bondax"},
	{twitter_username: "Cristano", youtube_username: "JennaMarbles", soundcloud_username: "gypsy-mamba"},
	{twitter_username: "JLo", youtube_username: "machinima", soundcloud_username: "eli-mattern"},
	{twitter_username: "shakira", youtube_username: "ERB", soundcloud_username: "flux-pavilion"},
	{twitter_username: "KimKardashian", youtube_username: "TheFineBros", soundcloud_username: "know-wave"},
	{twitter_username: "Oprah", youtube_username: "RayWilliamJohnson", soundcloud_username: "steveaoki"},
	{twitter_username: "ddlovato", youtube_username: "skydoesminecraft", soundcloud_username: "noisia"},
	{twitter_username: "Pink", youtube_username: "TheEllenShow", soundcloud_username: "le1f"},
	{twitter_username: "selenagomez", youtube_username: "vanossgaming", soundcloud_username: "nickyromero"},
	{twitter_username: "Randy_Gage", youtube_username: "portadosfundos", soundcloud_username: "modestep"},
	{twitter_username: "Harry_Styles", youtube_username: "elrubiusOMG", soundcloud_username: "datsik"},
	{twitter_username: "ArianaGrande", youtube_username: "TheOfficialSkrillex", soundcloud_username: "borgore"},
	{twitter_username: "KAKA", youtube_username: "werevertumorro", soundcloud_username: "r3hab"},
	{twitter_username: "onedirection", youtube_username: "collegehumor", soundcloud_username: "dada-life"},
	{twitter_username: "OfficialAdele", youtube_username: "lady16makeup", soundcloud_username: "killthenoise"},
	{twitter_username: "NiallOfficial", youtube_username: "TheSyndicateProject", soundcloud_username: "axwell"},
	{twitter_username: "aliciakeys", youtube_username: "CaptainSparklez", soundcloud_username: "ingrosso"},
	{twitter_username: "BrunoMars", youtube_username: "vsauce", soundcloud_username: "steveangello"},
	{twitter_username: "LilTunechi", youtube_username: "RoosterTeeth", soundcloud_username: "nguzunguzu"},
	{twitter_username: "venelibertario", youtube_username: "ElektraRecords", soundcloud_username: "seven-lions"},
	{twitter_username: "Eminem", youtube_username: "Macbarbie07", soundcloud_username: "majorlazer"},
	{twitter_username: "MileyCyrus", youtube_username: "vegetta777", soundcloud_username: "daedelus"},
	{twitter_username: "BillGates", youtube_username: "VitalyzdTv", soundcloud_username: "markprtchrd"},
	{twitter_username: "pitbull", youtube_username: "ksiolajidebt", soundcloud_username: "bokbok"},
	{twitter_username: "Real_Liam_Payne", youtube_username: "officialpsy", soundcloud_username: "letherette"},
	{twitter_username: "NICKIMINAJ", youtube_username: "SpinninRec", soundcloud_username: "jazzface"},
	{twitter_username: "Louis_Tomlinson", youtube_username: "enchufetv", soundcloud_username: "joakimbouaziz"},
	{twitter_username: "Drake", youtube_username: "freddiew", soundcloud_username: "vicram"},
	{twitter_username: "jimmyfallon", youtube_username: "MichellePhan", soundcloud_username: "dirty_knees"},
	{twitter_username: "AvrilLavigne", youtube_username: "BlueXephos", soundcloud_username: "prothese"},
	{twitter_username: "aplusk", youtube_username: "PTXofficial", soundcloud_username: "fonal"},
	{twitter_username: "KingJames", youtube_username: "TobyGames", soundcloud_username: "ghostly"},
	{twitter_username: "wizkhalifa", youtube_username: "PrankvsPrank", soundcloud_username: "nomdstbear"},
	{twitter_username: "davidguetta", youtube_username: "zoella280390", soundcloud_username: "polishcutouts"},
	{twitter_username: "neymarjr", youtube_username: "EpicMealTime", soundcloud_username: "berlincommunityradio"},
	{twitter_username: "EmWatson", youtube_username: "RiotGamesInc", soundcloud_username: "hunee"},
	{twitter_username: "MariahCarey", youtube_username: "boyceavenue", soundcloud_username: "quarion"},
	{twitter_username: "KevinHart4real", youtube_username: "MonsieurDream", soundcloud_username: "crackirecords"},
	{twitter_username: "chrisbrown", youtube_username: "speedyw03", soundcloud_username: "voiron"},
	{twitter_username: "Beyonce", youtube_username: "ShaneDawsonTV", soundcloud_username: "wankers-united"},
	{twitter_username: "zaynmalik", youtube_username: "canalparafernalha", soundcloud_username: "mesak"},
	{twitter_username: "xtina", youtube_username: "tseries", soundcloud_username: "pure"},
	{twitter_username: "JimCarrey", youtube_username: "Tobuscus", soundcloud_username: "gl03"},
	{twitter_username: "ConanOBrien", youtube_username: "failarmy", soundcloud_username: "katharina"},
	{twitter_username: "kourtneykardash", youtube_username: "programagalofrito", soundcloud_username: "gulliver-johnson"},
	{twitter_username: "ParisHilton", youtube_username: "WatchMojo", soundcloud_username: "umek"},
	{twitter_username: "RyanSeacrest", youtube_username: "thelonelyisland", soundcloud_username: "sixteenofive"},
	{twitter_username: "danieltosh", youtube_username: "tyleroakley", soundcloud_username: "great-stuff"},
	{twitter_username: "iamwill", youtube_username: "NBA", soundcloud_username: "ramon-tapia"},
	{twitter_username: "ashleytisdale", youtube_username: "movieclipsTRAILERS", soundcloud_username: "the-subliminal-kid"},
	{twitter_username: "thomaspower", youtube_username: "lindseystomp", soundcloud_username: "moog-club-bcn"},
	{twitter_username: "SrBachchan", youtube_username: "SMTOWN", soundcloud_username: "polybius-trax"},
	{twitter_username: "ActuallyNPH", youtube_username: "thewillyrex", soundcloud_username: "antonmaiof"},
	{twitter_username: "agnezmo", youtube_username: "JuegaGerman", soundcloud_username: "jayrope"},
	{twitter_username: "tyrabanks", youtube_username: "AdamThomasMoran", soundcloud_username: "alpendub"},
	{twitter_username: "AlejandroSanz", youtube_username: "UKFDubstep", soundcloud_username: "jazzysport"},
	{twitter_username: "SnoopDogg", youtube_username: "FPSRussia", soundcloud_username: "n_u_t_s"},
	{twitter_username: "0xF2", youtube_username: "NormanFaitDesVideos", soundcloud_username: "kitrecords"},
	{twitter_username: "khloekardashian", youtube_username: "IGNentertainment", soundcloud_username: "digitaltsunami"},
	{twitter_username: "LeoDiCaprio", youtube_username: "vice", soundcloud_username: "delsinrecords"},
	{twitter_username: "ivetesangalo", youtube_username: "latenight", soundcloud_username: "conforce"},
	{twitter_username: "charliesheen", youtube_username: "BFvsGF", soundcloud_username: "photophobia-symptoms"},
	{twitter_username: "edsheeran", youtube_username: "Matroix", soundcloud_username: "melina-kal-i"},
	{twitter_username: "ricky_martin", youtube_username: "SteveKardynal", soundcloud_username: "energeia-matter"},
	{twitter_username: "10Ronaldinho", youtube_username: "JimmyKimmelLive", soundcloud_username: "telo-suite"},
	{twitter_username: "kanyewest", youtube_username: "SeaNanners", soundcloud_username: "minimalismos"},
	{twitter_username: "SimonCowell", youtube_username: "RomanAtwood", soundcloud_username: "djadnan"},
	{twitter_username: "carlyraejepsen", youtube_username: "KurtHugoSchneider", soundcloud_username: "lovercio"},
	{twitter_username: "novaspivack", youtube_username: "rhettandlink2", soundcloud_username: "sibegg"},
	{twitter_username: "MohamadAlarefe", youtube_username: "theslowmoguys", soundcloud_username: "radiomovies"},
	{twitter_username: "iamsrk", youtube_username: "BartBaKer", soundcloud_username: "dan-goodwin-6"},
	{twitter_username: "WayneRooney", youtube_username: "ThisIsHorosho", soundcloud_username: "aaronbelay"},
	{twitter_username: "iamdiddy", youtube_username: "DisneyCollectorBR", soundcloud_username: "ronemusic"},
	{twitter_username: "andresiniesta8", youtube_username: "getmovies", soundcloud_username: "raw-life"},
	{twitter_username: "aamir_khan", youtube_username: "blucollection", soundcloud_username: "eightyocho"},
	{twitter_username: "ClaudiaLeitte", youtube_username: "DisneyCarToys", soundcloud_username: "your-old-droog"},
	{twitter_username: "Usher", youtube_username: "MashaMedvedTV", soundcloud_username: "knxwledge"},
	{twitter_username: "ZacEfron", youtube_username: "buzzfeedyellow", soundcloud_username: "littlesimz"},
	{twitter_username: "gqindia", youtube_username: "SurpriseToys", soundcloud_username: "joshxarce"}
]

users.each_with_index do |user,index|
	User.create!(email: Faker::Internet.email, name: Faker::Name.name, blurb: Faker::Hacker.say_something_smart, image_url: "https://pbs.twimg.com/profile_images/3253620646/8031eb423b8d91cca462af4825cdfdb2.jpeg", password: "password",twitter_username: user[:twitter_username], youtube_username: user[:youtube_username], soundcloud_username: user[:soundcloud_username])
	puts "#{index + 1} users loaded"
end

User.all.each_with_index do |user,index|
	puts "loading tweets for user #{index + 1}"
	user.load_tweets
	puts "loading videos for user #{index + 1}"
	user.load_videos
	puts "loading tracks for user #{index + 1}"
	user.load_tracks
end
