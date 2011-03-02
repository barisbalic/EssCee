# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{esscee}
  s.version = "0.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Baris Balic"]
  s.cert_chain = ["/Users/baris/.keys/gem-public_cert.pem"]
  s.date = %q{2011-03-02}
  s.description = %q{A wrapper for the Windows SC command-line utility for managing services.}
  s.email = %q{baris.balic@uswitch.com}
  s.extra_rdoc_files = ["README", "lib/esscee.rb", "lib/host.rb", "lib/response_parser.rb", "lib/service.rb"]
  s.files = ["Manifest", "README", "Rakefile", "esscee.gemspec", "lib/esscee.rb", "lib/host.rb", "lib/response_parser.rb", "lib/service.rb", "spec/localhost.query.all", "spec/response_parser_spec.rb"]
  s.homepage = %q{http://github.com/barisbalic/EssCee}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Esscee", "--main", "README"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{esscee}
  s.rubygems_version = %q{1.3.7}
  s.signing_key = %q{/Users/baris/.keys/gem-private_key.pem}
  s.summary = %q{A wrapper for the Windows SC command-line utility for managing services.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
