class Error
  attr_reader :message
  def initialize(messages)
    @message = craft_error_message(messages)
  end

  private

  def craft_error_message(messages)
    return messages.uniq.to_sentence if messages.kind_of?(Array)
    messages
  end
end
