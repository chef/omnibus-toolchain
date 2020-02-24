# THIS IS NOW HAND MANAGED, JUST EDIT THE THING
# keep it machine-parsable since CI uses it
#
# ruby-cleanup.rb verifies only one version of bundler is installed, so pin it here
override :bundler, version: "2.1.2" # pin to what ships in the ruby version