# installes dependend on installed os the needed sources.list
/etc/apt/sources.list:
  file.managed:
    - source: salt://debian/files/sources.list.{{ grains['os']|lower }}.{{ grains['lsb_distrib_codename']|lower}}
    - user: root
    - group: root
    - mode: 0644

sources_update:
  cmd.wait:
    - name: apt-get update
    - watch:
      - file: /etc/apt/sources.list
    - require:
      - file: /etc/apt/sources.list
