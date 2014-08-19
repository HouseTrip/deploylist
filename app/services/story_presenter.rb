class StoryPresenter < SimpleDelegator
  def title
    model.title.present? ? model.title : sanitized_message
  end

  private

  def sanitized_message
    model.message.gsub(/.* into /, '').gsub(/\d+$/, '').strip
  end

  def model
    __getobj__
  end
end
