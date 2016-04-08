module SecretsHelper
  def self.from_json
    if @secrets.nil?
      src = Rails.root.join('config','secrets.json')
      @secrets ||= File.open(src, 'r') { |f| JSON.parse(f.read)[Rails.env] }
    end
    @secrets.freeze
  end
end
