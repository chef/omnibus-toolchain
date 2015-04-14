source 'https://supermarket.chef.io'

# The apt cookbook is required to bring the apt cache up-to-date on Ubuntu
# systems, since the cache can become stale on older boxes.
#cookbook 'apt', '~> 2.0'

cookbook 'omnibus'

group :integration do
  cookbook 'apt',      '~> 2.3'
  cookbook 'freebsd',  '~> 0.1'
  cookbook 'yum-epel', '~> 0.3'
end
