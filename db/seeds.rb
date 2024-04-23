
require 'faker'

5.times do

    user = User.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        password: Faker::Internet.password(min_length: 6),
        created_at: Faker::Time.between(from: DateTime.now - 365, to: DateTime.now),
        updated_at: Faker::Time.between(from: DateTime.now - 30, to: DateTime.now)
    )

    tag = Tag.create!(
        name: Faker::Lorem.unique.word
    )

    2.times do

        post = Post.create!(
            title: Faker::Lorem.sentence,
            content: Faker::Lorem.paragraph,
            user_id: user.id,
            answers_count: rand(0..10),
            likes_count: rand(0..10),
            created_at: Faker::Time.between(from: DateTime.now - 365, to: DateTime.now),
            updated_at: Faker::Time.between(from: DateTime.now - 30, to: DateTime.now)
        )

        PostTag.create!(
            post_id: post.id,
            tag_id: tag.id
        )

    end

end


