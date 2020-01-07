module Search
  module Filter
    class Dropdown < ActionView::Component::Base
      include BootstrapHelper

      attr_reader :data_controller, :title

      def initialize(data_controller: 'dropdown', title:)
        @data_controller = data_controller
        @title = title
      end


      def dom_id
        [model_name.singular, object_id].join('-')
      end
    end
  end
end
