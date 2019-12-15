class Design

  DESIGN_BASE_DIR = "/app/views/designs".freeze

  def self.all
    designs = []
    Dir.chdir("#{Rails.root}#{DESIGN_BASE_DIR}") do
      designs = Dir.glob('*').select { |f| File.directory? f }
    end
  end

end