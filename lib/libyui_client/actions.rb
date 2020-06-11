# frozen_string_literal: true

module LibyuiClient
  class Actions
    attr_accessor :context
    PRESS = {action: 'press'}
    TOGGLE = {action: 'toggle'}
    CHECK = {action: 'check'}
    UNCHECK = {action: 'uncheck'}
    SELECT = {action: 'select'}
    ENTER_TEXT = {action: 'enter_text'}

    def initialize(context)
      @context = context
    end
    
    def execute(widget)
      LibyuiClient.logger.info("Send #{context} action for #{widget.class.name} #{widget.filter}")
      widget.widget_controller.send_action(widget.filter, @context, timeout: widget.timeout, interval: widget.interval)
    end
  end
end
