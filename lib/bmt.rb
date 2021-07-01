require 'bmt/item'
require 'bmt/methodology'
require 'bmt/step'

require 'date'
require 'json'
require 'pathname'

module BMT
  class VersionNotFoundError < StandardError; end
  class MethodologyNotFoundError < StandardError; end
  DATA_DIR = Pathname.new(__dir__).join('data')

  # memoize loaded
  @methodologies = {}
  @methodology_keys = {}

  module_function

  # returns a Methodology object given a key and a version
  def find(key, version: current_version)
    raise VersionNotFoundError unless versions.include?(version)
    raise MethodologyNotFoundError unless methodology_keys(version: version).include?(key)

    @methodologies[version].nil? && @methodologies[version] = {}

    @methodologies[version][key] ||= Methodology.new(
      key: key,
      version: version,
      attributes: methodology_json(key, version: version)
    )

    @methodologies[version][key]
  end

  def current_version
    versions.first
  end

  # returns available methodology keys for a given version
  def methodology_keys(version: current_version)
    @methodology_keys[version] ||=
      DATA_DIR.join(version, 'methodologies').entries
              .map(&:basename)
              .map(&:to_s)
              .select { |dirname| dirname =~ /json/ }
              .map { |filepath| File.basename(filepath, File.extname(filepath)) }
  end

  # Infer the available versions of the BMT from the names of the files
  # in the repo.
  # The returned list is in order with the current version first.
  def versions
    @versions ||= json_dir_names.sort.reverse!
  end

  def methodology_json(key, version: current_version)
    JSON.parse(methodology_pathname(key, version: version).read)
  end

  def methodology_pathname(key, version: current_version)
    DATA_DIR.join(version, 'methodologies', "#{key}.json")
  end

  # Get names of directories matching lib/data/<major>-<minor>/
  def json_dir_names
    DATA_DIR.entries
            .map(&:basename)
            .map(&:to_s)
            .select { |dirname| dirname =~ /^[0-9]+\.[0-9]/ }.sort
  end
end
