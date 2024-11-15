class Recipe < ApplicationRecord
  after_save :set_content, if: -> { saved_change_to_name? || saved_change_to_ingredients? }

  def content
    if super.blank?
      set_content
    else
      super
    end
  end

  private

  def set_content
    client = OpenAI::Client.new
    chaptgpt_response = client.chat(
      parameters: {
        model: "gpt-3.5-turbo",
        messages: [{
          role: "user",
          content: "Give me a simple recipe for #{name} with the ingredients #{ingredients}. " \
                   "Give me only the text of the recipe, without any of your own answer like " \
                   "'Here is a simple recipe'."
        }]
      }
    )

    new_content = chaptgpt_response["choices"][0]["message"]["content"]
    update(content: new_content)

    new_content
  end
end
