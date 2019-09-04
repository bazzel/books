FactoryBot.define do
  factory :book do
    title { 'MyString' }

    trait :invalid do
      title { '' }
    end

    factory :ebook, class: Ebook do
      type { 'Ebook' }
      link { 'http://www.kabisa.nl' }
    end

    factory :printed_book, class: PrintedBook do
      type { 'PrintedBook' }

      after(:build) do |book, evaluator|
        book.copies << build(:copy)
      end
    end
  end
end
