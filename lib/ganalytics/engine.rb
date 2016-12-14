module Ganalytics
  class Engine < ::Rails::Engine
    isolate_namespace Analytics
  end
end
