# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Restaurant.create(name:"Lucky's", location: "110 Main St", cuisine: "Comfort Food")
Restaurant.create(name:"Sam's Club", location: "100 Side St", cuisine: "Diner")
Restaurant.create(name:"Taco Truck", location: "200 Back St", cuisine: "Fast Food")


Review.create(
  restaurant_id: 1,
  user_id: 1,
  content:"Really like this place! Love Walt (the owner) super chill, makes great drinks! Everything I've ordered on the menu is good, nice prices & no complaints over here! Was told there's a dress code after hours but I get it, no shoes, no shirt, no service (makes sense! Saw some complaints & don't see the big deal.) overall a good place to go if you're looking for a 'cheers' kinda place",
  rating: 5,
  title: "very yummy",
  price: "$$"
)
Review.create(
  restaurant_id: 1,
  user_id: 2,
  content:"good 2",
  rating: 4,
  title: "I've conservatively been here 20+ times, and i've yet to have a bad experience. I've sat in the restaurant seating a couple of times, but 90% we stay in the bar. The bartenders are amazing, they always have a great attitude and take care of us very well! Oysters are AMAZING, always. But hands down.. We come for the Burger. Considering the plethora of Burger joints around, and this being a seafood place (Which is also amazing). The Burger I could eat every single dayyyy. Drinks are always made fresh, well, and efficiently. Keep doing what you're doing, and i'll def be returning often!",
  price: "$$"
)
Review.create(
  restaurant_id: 1,
  user_id: 3,
  content:"2nd lunch not quite as on-point as first. Place was slammed so that could be the difference. Prawn cocktail was good but not great, shrimp quality just average. WCYC scores with its housemade dip, though: excellent!
  Fish'n'chips, switched out with polenta fries. Fries didn't work, tasted too bland. Fish had really salty batter, shocked Spouse who said he would definitely not order this again.
  Burger is a good bet here; note meat is cooked European style so if you want medium-rare, order MEDIUM. Potato salad had too much Dijon for me (a little mustard goes a long way, in my book) and the chopped dill pickles in it were....odd.
  Bread pudding, nice and soft before, was less so this time. We're not fond of firm bread puddings, so were disappointed.
  Overall, the inconsistency bothered us. We might or might not return.",
  rating: 3,
  title: "yummy",
  price: "$$"
)

Review.create(
  restaurant_id: 2,
  user_id: 1,
  content:"Celebrated our 18th wedding anniversary here and was very pleased with the experience. Had a reservation at 7:30 pm but finished walking around the shops at 6:00 pm. We attempted to see if they would let us arrive early and they had no issue at all. We sat in the back patio area which was really nice and a lot more quite than the indoors. Great patio ambiance and very cool. We sat in the back away from the door which was good because as the sun went down I could see those guests getting sun right on them. For a quiet dinner enjoying the company of my wife, this place nailed it. Service was great as well.
  Halibut was amazing and so was the Calamari.",
  rating: 4,
  title: "not bad",
  price: "$$$"
)
Review.create(
  restaurant_id: 2,
  user_id: 2,
  content:"Why do I always end up here when I'm overserved and famished? It's a saving grace, I tell you. Open late. It's super small, so if you can snag a seat, good for you! It's quick service, so I don't expect people hanging out too long, so if you're patient, I'm sure a seat can open up fairly fast. Small rant: Although I did order my food first and got served last, but it all good, since the cheeseburger was delicious. The fries are the ultimate rip off since they literally give you like 12 for the price. The staff is fine. Definitely not warm and funny, but serving drunkards on the repeat probably isn't the most fun and warm feeling for them. It's one counter with some seating and it's definitely got that old-school vibe, which is hard to find these days. The burger was juicy, the roll was fresh and overall I scarfed it down and it soaked some of the booze up. In the Bay Area, it's a reasonable price for a fresh made, late night eat with some pretty cool old-school vibes. Not sure I'd come for like a lunch, unless I really was looking for a quick diner like burger. Take a friend or date after a night of drinking, and be that in-the-know, under the radar type person that you are.",
  rating: 3,
  title: "could be worse",
  price: "$$$"
)
Review.create(
  restaurant_id: 2,
  user_id: 3,
  content:"Been here a couple times before with no issues. A dive bar with low key atmosphere. Walked in and was told immediately that there's a dress code after 9pm and we had to have sleeves. My wife was wearing a tank top and I was wearing a muscle type shirt with a hood. (We just came from 6 Flags and wanted to have some drinks with our friend that came up from out of town) We were trying to show her this cool spot that we've had fun at before and between the 3 of us, drop some good money to have a good time. Seriously ridiculous to be refused service for wearing Summer wear, when it was 85 and still in the 70s after 9pm at a dive bar. Did we walk into a 5 star restaurant with suit and tie required? I can see why the ratings are so low. Unfortunately on the hunt for a new spot to enjoy a drink in my shorts and tshirt",
  rating: 2,
  title: "decent",
  price: "$$$"
)

Review.create(
  restaurant_id: 3,
  user_id: 1,
  content:"The line is crazy long. It was crowded on a Friday night and one of my friends suggested we eat here. I'm not too sure what all the hype is about. I got a super burrito carne Asada and I thought it was fine but couldn't tell why it was super, The meet was too chewy for my tastes and there was hardly any avocado in the burrito. I also could not taste the beans, or cheese or whatever else was in it. The only thing I could taste was the loads of salsa in it to the point where when I took a bite the liquid part of the salsa fell onto my lap. It wasn't pretty and I didn't think it was that great either. We shared a side of chips with guacamole and salsa and the guacamole was pretty tasteless/bland. The chips also got soggy because there is too much liquid in the salsa. I'm not sure what all the hype was about since I don't think my burrito was worth the $13 it cost and it wasn't something that would keep me coming back, especially since it requires looking for tables amidst a fire-hazard crowd with no order in how the food is handed out. Maybe I'm expecting too much, but with their lines I think they can invest in a microphone and more organized placeholders and line molds.",
  rating: 3,
  title: "so so",
  price: "$"
)
Review.create(
  restaurant_id: 3,
  user_id: 2,
  content:"Went here during the day. Very friendly female bartender. Kept up with me wanting to switch the channels for March madness. Coors lights were real cold which is a huge deal for me. Food menu looked good. Will edit review when I try the food. I'll be back",
  rating: 2,
  title: "meh",
  price: "$"
)
Review.create(
  restaurant_id: 3,
  user_id: 3,
  content:"THIS PLACE IS AWFUL!!!! Would not accept a REAL id. Bouncer was a complete fool and treated women like dirt. ANDY the bouncer was so mean and would not allow me to speak to his superiors. I will never be coming here again. I wish I could give negative stars.",
  rating: 1,
  title: "yuck",
  price: "$"
)
