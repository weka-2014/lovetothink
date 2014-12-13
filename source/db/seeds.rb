# require 'faker'

# User.destroy_all

# users = ["katyperry","justinbieber","BarackObama","taylorswift13","ladygaga","britneyspears","jtimberlake","rihanna","auria","Cristano","JLo","shakira","KimKardashian","Oprah","ddlovato","Pink","selenagomez","Randy_Gage","Harry_Styles","ArianaGrande","KAKA","onedirection","OfficialAdele","NiallOfficial","aliciakeys","BrunoMars","LilTunechi","venelibertario","Eminem","MileyCyrus","BillGates","pitbull","Real_Liam_Payne","NICKIMINAJ","Louis_Tomlinson","Drake","jimmyfallon","AvrilLavigne","aplusk","KingJames","wizkhalifa","davidguetta","neymarjr","EmWatson","MariahCarey","KevinHart4real","chrisbrown","Beyonce","zaynmalik","xtina","JimCarrey","ConanOBrien","kourtneykardash","ParisHilton","RyanSeacrest","danieltosh","iamwill","ashleytisdale","thomaspower","SrBachchan","ActuallyNPH","agnezmo","tyrabanks","AlejandroSanz","SnoopDogg","0xF2","khloekardashian","LeoDiCaprio","ivetesangalo","charliesheen","edsheeran","ricky_martin","10Ronaldinho","kanyewest","SimonCowell","carlyraejepsen","novaspivack","MohamadAlarefe","iamsrk","WayneRooney","iamdiddy","andresiniesta8","aamir_khan","ClaudiaLeitte","Usher","ZacEfron","gqindia"]

# users.each_with_index do |user,index|
# 	User.create!(email: Faker::Internet.email, name: Faker::Name.name, blurb: Faker::Hacker.say_something_smart, image_url: "https://pbs.twimg.com/profile_images/3253620646/8031eb423b8d91cca462af4825cdfdb2.jpeg", password: "password",twitter_username: user)
# 	puts "#{index + 1} users loaded"
# end

# User.all.each_with_index do |user,index|
# 	puts "loading tweets for user #{index + 1}"
# 	user.load_tweets
# 	sleep(2)
# end

