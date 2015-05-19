# Installs apt-listchanges package for notifieing on package updates
apt-listchanges:
  pkg.installed:
    - watch:
      - debconf: apt-listchanges
    - require:
      - debconf: apt-listchanges
  debconf.set:
    - data:
        'apt-listchanges/frontend': {'type': 'select', 'value': 'pager'}
        'apt-listchanges/confirm': {'type': 'boolean', 'value': 'false'}
        'apt-listchanges/which': {'type': 'select', 'value': 'both'}
        'apt-listchanges/email-address': {'type': 'string', 'value': 'root'}
        'apt-listchanges/save-seen': {'type': 'boolean', 'value': 'false'}
