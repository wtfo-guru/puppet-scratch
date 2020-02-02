# define scratch::capture
# -*- Mode: Puppet; tab-width: 2; indent-tabs-mode: nil -*-
# vim:sta:et:sw=2:ts=2:syntax=puppet
#
# Revision History:
# 20200130 - que - initial version
#
define scratch::capture (
  $value,
) {

  $tmp = lookup('scratch::temp_directory', String, first, '/tmp')
  $capture_fpn = "${tmp}/${name}.json"
  $capture_hash = { $name => $value }
  file { $capture_fpn:
    ensure  => file,
    owner   => root,
    group   => wheel,
    mode    => '0640',
    content => inline_template("<%- require 'json' -%>
<%= JSON.pretty_generate(@capture_hash) %>
"),
  }
}
