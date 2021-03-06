# installs apticron for automatically installs updates
apticron:
  pkg.installed:
    - watch:
      - debconf: apticron
    - require:
      - debconf: apticron
  debconf.set:
    - data:
        'apticron/notification': {'type': 'string', 'value': 'root'}

# configuring apticron
/etc/apticron/apticron.conf:
  file.replace:
    - pattern: '^#*\s*LISTCHANGES_PROFILE\s*=\s*.*$'
    - repl: 'LISTCHANGES_PROFILE="apticron"'
    - require:
      - pkg: apticron
