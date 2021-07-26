scope:
let ruby = scope.ruby_3_0.withPackages (pkgs: with pkgs; [
  rails
  pg
  puma
  listen
  rake
]); in
with scope; [
  (writeScriptBin "rails" ''
    #!/${ruby}/bin/ruby
    APP_PATH = File.expand_path('${source}/config/application', __dir__)
    require "rails/commands"
  '')
  ruby
  rufo
  postgresql
]
