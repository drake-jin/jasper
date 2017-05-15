$LOAD_PATH.unshift(File.dirname(__FILE__))
require "jekyll"

# Top-level namespace for all GitHub Pages-related concerns.
module GitHubPages
  autoload :Configuration, "github-pages/configuration"
  autoload :Dependencies,  "github-pages/dependencies"
  autoload :VERSION,       "github-pages/version"

  def self.versions
    Dependencies.versions
  end
end

Jekyll.logger.debug "GitHub Pages:", "github-pages v#{GitHubPages::VERSION}"
Jekyll.logger.debug "GitHub Pages:", "jekyll v#{Jekyll::VERSION}"
Jekyll::Hooks.register :site, :after_reset do |site|
  GitHubPages::Configuration.set(site)
end