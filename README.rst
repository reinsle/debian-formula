======
debian
======

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

Available states
================

.. contents::
    :local:

``debian``
----------

Includes debian.sources/*

``debian.dash``
----------

Enables dash as System Shell

``debian.dash.disable``
----------

Disables dash as System Shell

``debian.sources``
------------------

Installs base debian package repository and updates package list.

``debian.sources.salt``
-----------------------

Installs salt debian package repository and installs matching apt-key

