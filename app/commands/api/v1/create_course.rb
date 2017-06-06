class Api::V1::CreateCourse
  prepend SimpleCommand
  include ActiveModel::Model

  validates :creator, presence: true
  validates :title, presence: true, allow_blank: false, length: { minimum: 5, maximum: 255 }
  validates :description, presence: true, allow_blank: false, length: { minimum: 5, maximum: 1000 }

  def initialize(options = {})
    @creator = options[:creator]
    @title = options[:title]
    @description = options[:description]
    @price = options[:price]
  end

  def call
    return nil unless valid?
    creator.courses.create! title: title,
                            description: description,
                            price: price
  rescue => e
    errors.add :create_course, e.message
  end

  private

  attr_reader :creator, :title, :description, :price
end
