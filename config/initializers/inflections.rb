# frozen_string_literal: true

Rails.autoloaders.each do |autoloader|
  autoloader.inflector.inflect(
    'coc' => 'COC',
    'nanpa' => 'NANPA',
  )
 end
