namespace :dev do
    
    task fake_user: :environment do
      #Users.destroy_all
      20.times do |i|
        User.create!(
            email: FFaker::Internet.unique.email,
            password: "12345678"
          )
      end
      puts "have created fake users"
      puts "now you have #{User.count} users data"
    end

    task fake_restaurant: :environment do
      Restaurant.destroy_all
      500.times do |i|
        Restaurant.create!(name: FFaker::Name.first_name,
          opening_hours: FFaker::Time.datetime,
          tel: FFaker::PhoneNumber.short_phone_number,
          address: FFaker::Address.street_address,
          description: FFaker::Lorem.paragraph,
          category: Category.all.sample
        )
      end
       puts "have created fake restaurants"
       puts "now you have #{Restaurant.count} restaurants data"
    end

    task fake_comment: :environment do
      Comment.destroy_all
      Restaurant.all.each do |restaurant|
        3.times do |j|
            restaurant.comments.create!(
                content: FFaker::Lorem.paragraph,
                user: User.all.sample
              )
        end
      end
        puts "have created fake comments"
        puts "now you have #{Comment.count} restaurants data"
      
    end

end
