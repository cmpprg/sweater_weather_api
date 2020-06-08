class Error
  attr_reader :message
  def initialize(unsaved_object)
    @message = craft_error_message(unsaved_object)
  end

  private

  def craft_error_message(object)
    object.errors.full_messages.uniq.to_sentence
  end
end
