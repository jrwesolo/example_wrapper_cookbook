name             'example_wrapper_cookbook'
maintainer       'YOUR_NAME'
maintainer_email 'YOUR_EMAIL'
license          'All rights reserved'
description      'Installs/Configures example_wrapper_cookbook'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

supports 'centos'

depends 'example_cookbook', '~> 0.1.0'

recipe 'example_wrapper_cookbook::default', 'demonstrates '
