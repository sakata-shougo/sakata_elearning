# has_manyでどこと繋がっているのか。

class Word < ApplicationRecord
  belongs_to :category
  validates :content, presence: true 
  has_many :choices, dependent: :destroy
  accepts_nested_attributes_for :choices
  validate :has_one_correct_answer, :has_unique_choices

  def correct_answer
    choices.find_by(correct:true).try(:content)
  end 

  def has_one_correct_answer
     if choices.select{ |choice| choice.correct? }.count != 1
      return errors.add :base,"Must have one correct choice"
     end
  end

  def has_unique_choices
      if choices.uniq{|choice| choice.content }.count < choices.length
        return errors.add :base,'Must have unique choices'
      end
  end
end

#def has_one_correct_answerは選択肢を1つしか洗濯してはいけない