require 'celluloid'
require 'listen/listener'

module Listen
  include Celluloid

  # Listens to file system modifications on a either single directory or multiple directories.
  #
  # @param (see Listen::Listener#new)
  #
  # @yield [modified, added, removed] the changed files
  # @yieldparam [Array<String>] modified the list of modified files
  # @yieldparam [Array<String>] added the list of added files
  # @yieldparam [Array<String>] removed the list of removed files
  #
  # @return [Listen::Listener] the listener
  #
  def self.to(*args, &block)
    Actor[:listener] = Listener.new(*args, &block)
    Actor[:listener].async.start
  end
end
