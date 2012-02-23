pl, en, de = flatpage(:pl), flatpage(:en), flatpage(:de)

FactoryGirl.define do
  factory :flatpage do
    title_pl pl.title
    content_pl pl.content

    title_en en.title
    content_en en.content

    title_de de.title
    content_de de.content

    position 1
  end
end