include:
  - debian.tools

{% if grains['cpuarch'] in 'x86', 'x86_64' %}
# installes dependend on installed os the needed sources.list
/etc/apt/sources.list:
  file.managed:
    - source: salt://debian/files/sources.list.{{ grains['os']|lower }}.{{ grains['lsb_distrib_codename']|lower}}
    - user: root
    - group: root
    - mode: 0644
    - require_in:
      - cmd: apt-get_update
    - watch_in:
      - cmd: apt-get_update
{% endif %}
