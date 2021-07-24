scope: with scope;
let ruby = scope.ruby.withPackages (pkgs: with pkgs; [
  rails
  pg
  puma
  listen
  rufo
]);
in
[
  (writeScriptBin "rails" ''
    #!/${ruby}/bin/ruby
    APP_PATH = File.expand_path('${source}/config/application', __dir__)
    require "rails/commands"
  '')
  ruby
]
