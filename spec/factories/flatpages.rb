pl, en, de = flatpage(:pl), flatpage(:en), flatpage(:de)

FactoryGirl.define do
  factory :flatpage do
    title_pl pl.title
    content_pl pl.content
    meta_title_pl pl.meta_title
    meta_description_pl pl.meta_description
    meta_keywords_pl pl.meta_keywords


    title_en en.title
    content_en en.content
    meta_title_en en.meta_title
    meta_description_en en.meta_description
    meta_keywords_en en.meta_keywords

    title_de de.title
    content_de de.content
    meta_title_de de.meta_title
    meta_description_de de.meta_description
    meta_keywords_de de.meta_keywords

    position 1
  end
end