name 'build_cookbook'
maintainer 'The Authors'
maintainer_email 'you@example.com'
license 'all_rights'
version '0.1.0'

# Pipeline Dependencies
depends 'delivery-sugar'
depends 'languages'

# Engineering Services cookbooks (will eventually be deps of `delivery-bus`)
depends 'artifactory-pro'
depends 'java'
depends 'jenkins'
depends 'oc-artifactory'
depends 'opscode-ci'
