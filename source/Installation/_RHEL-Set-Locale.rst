Assurez-vous d'avoir une locale qui supporte ``UTF-8``.
Si vous êtes dans un environnement minimal (comme un conteneur docker), la locale peut être
quelque chose de minimal comme ``C``. Nous testons avec les paramètres
suivants. Cependant, un autre paramètre régional pris en charge par UTF-8 devrait fonctionner.

.. code-block:: bash

   locale  # check for UTF-8

   sudo dnf install langpacks-en glibc-langpack-en
   export LANG=en_US.UTF-8

   locale  # verify settings
