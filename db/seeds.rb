User.create! id: 1, email: "hello@arthurcolle.com",password: "password", name: "Arthur Colle",home: "401 Nina Place, Rockville MD 20852",lat: "39.0562619",long: "-77.13000090000003",phone_number: 3018005595,customer_id: "cus_6PYmOJmoUSITmD",connect_id: "acct_16CjelFldA6z6KA4",secret_id: "sk_test_R2NOeLX66gzm8arMG123He4x",publishable_id: "pk_test_GYlomdEyvHFNRsHX9hzfy3fg",transfers_enabled: true,fb_hd_profile_picture: "https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xpf1/v/t1.0-1/p200x200/1525778_405272576305070_6364653294120721379_n.jpg?oh=8f65b61217a4a019f8cee53009ced0bd&oe=55F9FD51&__gda__=1441657662_15829f6406db7c3bf4658b788112c4f6",lat_f: 39.056262,long_f: -77.130001,prof_pic: "https://scontent.cdninstagram.com/hphotos-xaf1/t51.2885-15/e15/11356353_720047521439521_517049214_n.jpg"

user = User.find(1)
user.dishes.create(:name => 'Curly fry sandwich', :description => 'No drink included!', :image_url => 'https://scontent.cdninstagram.com/hphotos-xpa1/t51.2885-15/e15/11049217_1050798778268911_1794059291_n.jpg', :price => 16.0, active: true)
user.dishes.create(:name => 'Sandwich special', :description => 'This has fries which you can eat with ketchup', :image_url => 'https://scontent.cdninstagram.com/hphotos-xpa1/t51.2885-15/e15/11190839_805640789526181_646591393_n.jpg', :price => 20.0, active: true)
user.dishes.create(:name => 'Fresh Soylent', :description => 'Soylent is a new form of food replacement', :image_url => 'https://scontent.cdninstagram.com/hphotos-xat1/t51.2885-15/e15/11093130_1004141852944320_1506520240_n.jpg', :price => 15.0, active: true)
user.dishes.create(:name => 'Breakfast Special', :description => 'bagel + coffee', :image_url => 'https://scontent.cdninstagram.com/hphotos-xap1/t51.2885-15/e15/11176423_790570584373337_2062673856_n.jpg', :price => 5.0, active: true)
user.dishes.create(:name => 'Steak', :description => 'Delicious steak', :image_url => 'https://scontent.cdninstagram.com/hphotos-xat1/t51.2885-15/e15/11186826_1583942281846613_998802125_n.jpg', :price => 100.0, active: true)


user = User.create! id: 2,email: "junior@gosling.com",password: "password", name: "Junior Gosling", home: "404 Nina Place, Rockville MD 20852",lat: "39.055862",long: "-77.130473",phone_number: "3014454646",customer_id: "cus_6PcduSfNhQLJoR",connect_id: "acct_16CnNqIMUrhWScYG",secret_id: "sk_test_1uvAa21dVekxtJVxmpKKTNZI",publishable_id: "pk_test_YaAtTHGQdhVA8LD4XQ2QVX7K",transfers_enabled: true,fb_hd_profile_picture: "https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xpf1/v/t1.0-1/p200x200/1525778_405272576305070_6364653294120721379_n.jpg?oh=8f65b61217a4a019f8cee53009ced0bd&oe=55F9FD51&__gda__=1441657662_15829f6406db7c3bf4658b788112c4f6",lat_f: 39.055862,long_f: -77.130473
user = User.find(2)
user.dishes.create(:name => 'Leaf', :description => 'A good leaf', :image_url => "https://scontent.cdninstagram.com/hphotos-xaf1/t51.2885-15/e15/11236108_830332670386695_1290447161_n.jpg", :price => 1000, active: true)

OrderStatus.delete_all
OrderStatus.create! id: 1, name: "In Progress"
OrderStatus.create! id: 2, name: "Placed"
OrderStatus.create! id: 3, name: "Shipped"
OrderStatus.create! id: 4, name: "Cancelled"

