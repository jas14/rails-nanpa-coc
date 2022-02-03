# frozen_string_literal: true

module NANPA
  module COC
    class ApplicationRecord < ActiveRecord::Base
      self.abstract_class = true
    end
  end
end
