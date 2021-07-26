class ApplicationController < ActionController::API
  def index
    render json: model.all, **render_options
  end

  def show
    render json: model.find(params.require(:id)), **render_options
  end

  def model
    self.class.name.delete_suffix('Controller').singularize.constantize
  end

  def render_options
    # see https://apidock.com/rails/ActiveModel/Serializers/JSON/as_json
    def parse_nested(name, raw)
      raw.split(',')
        .map { |x| x.split('.').reverse.reduce({}) { |acc, x| {name => {x => acc}} } }
        .reduce({}) { |acc, x| acc.deep_merge(x) }
    end
    raw_options = params.permit(:root, :only, :except, :include).to_h
    nested_options = [:only, :except, :include]
      .map { |name| parse_nested(name, raw_options[name].to_s) }
      .reduce({}) { |acc, x| acc.deep_merge(x) }

    {root: raw_options[:root] == 'true'}.merge(nested_options)
  end
end
