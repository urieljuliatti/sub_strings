# frozen_string_literal: true

FactoryBot.define do
  factory :main, class: Start do
    phrase { 'below' }
    dictionary { %w[below down go going horn how howdy it i low own part partner sit] }
    result { { 'below' => 1, 'low' => 1 } }

    trait :bender do
      phrase { 'Bender' }
    end

    trait :howdy do
      phrase { 'Howdy partner, sit down! How\'s it going?' }
      result {
        {
          'down' => 1, 'go' => 1, 'going' => 1, 'how' => 2,
          'howdy' => 1, 'it' => 2, 'i' => 3, 'own' => 1,
          'part' => 1, 'partner' => 1, 'sit' => 1
        }
      }
    end

    initialize_with { new(phrase, dictionary) }
  end
end
