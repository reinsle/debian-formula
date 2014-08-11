include:
  - debian.dash.reconfigure

# enables dash as system shell
echo "set dash/sh false" | debconf-communicate:
  cmd.run:
    - unless: debconf-show dash | grep false
    - watch_in:
      - cmd: dpkg-reconfigure_dash
    - require_in:
      - cmd: dpkg-reconfigure_dash
