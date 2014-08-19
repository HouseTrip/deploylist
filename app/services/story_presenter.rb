class StoryPresenter < SimpleDelegator
  def title
    model.title.present? ? model.title : 'No title'
  end

  private

  def model
    __getobj__
  end
end
