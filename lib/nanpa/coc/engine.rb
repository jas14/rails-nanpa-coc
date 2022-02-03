module NANPA
  module COC
    class Engine < ::Rails::Engine
      isolate_namespace NANPA::COC
      config.generators.api_only = true
    end
  end
end
