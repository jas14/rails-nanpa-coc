# frozen_string_literal: true

Rails.application.routes.draw do
  mount NANPA::COC::Engine => '/nanpa-coc'
end
