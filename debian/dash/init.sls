include:
  - debian.dash.reconfigure

# enables dash as system shell
echo "set dash/sh true" | debconf-communicate:
  cmd.run:
    - unless: debconf-show dash | grep true
    - watch_in:
      - cmd: dpkg-reconfigure_dash
    - require_in:
      - cmd: dpkg-reconfigure_dash
