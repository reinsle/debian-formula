include:
  - debian.sources

# installs salt.list debian repository
/etc/apt/sources.list.d/salt.list:
  file.managed:
    - source: salt://debian/files/salt.list.{{ grains['os']|lower }}.{{ grains['lsb_distrib_codename']|lower}}
    - user: root
    - group: root
    - mode: 0644
    - require_in:
      - cmd: sources_update
    - watch_in:
      - cmd: sources_update

# installs salt apt-key
wget -q -O- "http://debian.saltstack.com/debian-salt-team-joehealy.gpg.key" | apt-key add -:
  cmd.run:
    - unless: apt-key  list | grep "Joe Healy <joehealy@gmail.com>"
    - require:
      - file: /etc/apt/sources.list.d/salt.list
    - require_in:
      - cmd: sources_update
    - watch_in:
      - cmd: sources_update
