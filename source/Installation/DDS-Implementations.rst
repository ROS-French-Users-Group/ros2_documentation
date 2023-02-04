Les implémentations DDS
=======================

Par défaut, ROS 2 utilise DDS comme `middleware <https://design.ros2.org/articles/ros_on_dds.html>`__. Il est compatible
avec plusieurs fournisseurs DDS ou RTPS (le protocole filaire DDS).
Les vendeurs DDS supportant ROS sont  Fast DDS d'eProsima, Connext DDS de RTI, Eclipse Cyclone DDS et GurumDDS de de GurumNetworks. Voir "
"https://ros.org/reps/rep-2000.html pour les fournisseurs DDS pris en charge par distribution.

Dans la distribution Rolling, le vendeur DDS par défaut est Fast DDS d'eProsima.

* :doc:`Travailler avec Eclipse Cyclone DDS <DDS-Implementations/Working-with-Eclipse-CycloneDDS>` explique comment utiliser Cyclone DDS.
* :doc:`Travailler avec eProsima Fast DDS <DDS-Implementations/Working-with-eProsima-Fast-DDS>` explique comment utiliser Fast DDS.
* :doc:`Travailler avec GurumNetworks GurumDDS <DDS-Implementations/Working-with-GurumNetworks-GurumDDS>` explique comment utiliser GurumDDS.

.. toctree::
   :hidden:
   :glob:

   DDS-Implementations/*

Si vous souhaitez utiliser l'un des autres fournisseurs, vous devrez installer le logiciel correspondant séparément avant de construire ROS 2. La version ROS 2
créera automatiquement la prise en charge des fournisseurs qui ont été correctement installés et sourcés.


Once you've installed a new DDS vendor, you can change the vendor used at runtime: :doc:`Working with Multiple RMW Implementations <../How-To-Guides/Working-with-multiple-RMW-implementations>`.
Une fois que vous avez installé un nouveau fournisseur DDS, vous pouvez changer le fournisseur utilisé lors de l'exécution : :doc:`Travailler avec des multiples implémentation de RMW  <../How-To-Guides/Working-with-multiple-RMW-implementations>`."

Des instructions détaillées pour l'installation d'autres fournisseurs DDS sont fournies ci-dessous.

.. contents:: Platformes / Types d'Installation
   :depth: 1
   :local:

Installation de ROS 2 sur Ubuntu Linux à partir des sources
-----------------------------------------------------------

RTI Connext (version 6.0.1, amd64 uniquement)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Les paquets Debian fournis dans les dépôts apt de ROS-2
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Vous pouvez installer un paquet Debian de RTI Connext disponible sur les dépôts ROS 2 apt. Vous devrez accepter une licence de RTI.


.. code-block:: bash

   sudo apt update && sudo apt install -q -y rti-connext-dds-6.0.1

Il faut sourcer le fichier de configuration pour assigner la variable ``NDDSHOME``.

.. code-block:: bash

   cd /opt/rti.com/rti_connext_dds-6.0.1/resource/scripts && source ./rtisetenv_x64Linux4gcc7.3.0.bash; cd -

Note: quand vous utiliser ``zsh`` vous devez être dans le répertoire du script quand il est sourcé pour
qu'il fonctione proprement.

Il est maintenant possible de construire ROS 2 en utilisant les indications habituelles, le support RT sera pris en compte.


Les paquets binaires officiels de RTI
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Vous pouvez installer Connext 6.0.1 par un paquet binaire fournit par RTI,
es options disponibles sont :doc:`université, achat ou évaluation <DDS-Implementations/Install-Connext-University-Eval>`

Après téléchargement, il faut exécuter ``chmod +x`` sur le fichier exécutable ``.run`` et l'exécuter.
Il faut noter que si vous installez dans un répertoire système il faut également utiliser ``sudo``.

L'emplacement par défaut est ``~/rti_connext_dds-6.0.1``

Aprés l'installation, il faut utiliser le lanceur RTI et spécifier votre fichier de licence (obtenu à partir de RTI).

Cela s'effectue en ajoutant la ligne suivante à votre fichier ``.bashrc`` qui indique où se trouve votre fichier licence sur le disque.

.. code-block:: bash

   export RTI_LICENSE_FILE=path/to/rti_license.dat

Sourcer le fichier de configuration pour spécifier la variable d'environnement ``NDDSHOME``.

.. code-block:: bash

   cd ~/rti_connext_dds-6.0.1/resource/scripts && source ./rtisetenv_x64Linux4gcc7.3.0.bash; cd -

Il est possible de construire ROS 2 normalement et utiliser RTI comme implémentation de DDS.

Installation binaire de Linux Ubuntu
------------------------------------

RTI Connext (version 6.0.1, amd64 seulement)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Pour utiliser RTI Connext DDS il est possible d'utiliser les options suivantes :doc:`université, achat ou évaluation <DDS-Implementations/Install-Connext-University-Eval>`
ou vous pouvez installer un paquet Debian basé uniquement sur les librairies de RTI Connext 6.0.1, disponible à partir du dépôt OSRF et sous `une licence non-commerciale <https://www.rti.com/ncl>`__.

Pour installer le paquet Debian à base de librairies uniquement:

.. code-block:: bash

   sudo apt update && sudo apt install -q -y rti-connext-dds-6.0.1

Vous devrez accepter un accord de licence de RTI, et vous trouverez un fichier 'rti_license.dat dans l'installation.

Il faut ajouter la ligne suivante à votre fichier ``.bashrc`` pour pointer vers la licence (et sourcer le fichier ``.bashrc``).

.. code-block:: bash

   export RTI_LICENSE_FILE=path/to/rti_license.dat

Dans tous les cas il est nécessaire de sourcer le fichier de configuration pour spécifier la variable d'envionnement ``NDDSHOME``:

.. code-block:: bash

   cd /opt/rti.com/rti_connext_dds-6.0.1/resource/scripts && source ./rtisetenv_x64Linux4gcc7.3.0.bash; cd -

Note: les instructions précédentes peuvent nécessiter des modifications suivant l'emplacement de l'installation RTI sur votre disque.

Si vous souhaitez istaller les plugins Connext DDS-Security le lecteur est invité à consulter :doc:`cette page <DDS-Implementations/Install-Connext-Security-Plugins>`.

Installation sous OSX à partir des sources
------------------------------------------

RTI Connext (6.0.1)
^^^^^^^^^^^^^^^^^^^

Si vous souhaitez construire ROS 2 avec RTI Connext DDS les options suivantes sont disponibles  :doc:`université, achat ou évaluation <DDS-Implementations/Install-Connext-University-Eval>`

Vous avez également besoin d'un environnement d'exécution Java installé pour exécuter le générateur de code RTI, vous pouvez l'obtenir `ici <https://support.apple.com/kb/DL1572?locale=en_US>`__.

Après l'installation il faut exécuter le lanceur RTI, et désigner l'endroit où se trouve le fichier de licence sur le disque.

Sourcer le fichier de configuration pour spécifier la variable d'environnement  ``NDDSHOME`` avant de construire votre espace de travail.

.. code-block:: bash

   source /Applications/rti_connext_dds-6.0.1/resource/scripts/rtisetenv_x64Darwin17clang9.0.bash

Vous aurez peut-être besoin d'augmenter la taille de la mémoire partagée en suivant https://community.rti.com/kb/osx510

Si vous souhaitez installer les plugins Connext DDS-Security les instructions sont disponibles sur :doc:`cette page <DDS-Implementations/Install-Connext-Security-Plugins>`.

Installation binaire OSX
------------------------


Activer la prise en charge de Connext
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Pour utiliser ROS 2 avec RTI Connext DDS, les options suivantes sont possibles  :doc:`université, achat ou évaluation <DDS-Implementations/Install-Connext-University-Eval>`

Après l'installation, exécuter le lanceur RTI et spécifier l'endroit où se trouve votre fichier de licence sur le disque.

Sourcer le fichier de configuration pour spécifier la variable d'environnement  ``NDDSHOME`` avant de construire votre espace de travail.

.. code-block:: bash

   source /Applications/rti_connext_dds-6.0.1/resource/scripts/rtisetenv_x64Darwin17clang9.0.bash

Vous aurez peut-être besoin d'augmenter la taille de la mémoire partagée en suivant https://community.rti.com/kb/osx510

Si vous souhaitez installer les plugins Connext DDS-Security les instructions sont disponibles sur :doc:`cette page <DDS-Implementations/Install-Connext-Security-Plugins>`.

Installation sous Windows à partir des sources
----------------------------------------------

RTI Connext 6.0.1
^^^^^^^^^^^^^^^^^

Si vous souhaitez construire ROS 2 avec RTI Connext DDS les options suivantes sont disponibles  :doc:`université, achat ou évaluation <DDS-Implementations/Install-Connext-University-Eval>`

Après l'installation, utilisez le lanceur RTI pour charger votre fichier de licence.

Ensuite, avant de construire ROS 2, il faut configurer l'environnement Connext:

.. code-block:: bash

   call "C:\Program Files\rti_connext_dds-6.0.1\resource\scripts\rtisetenv_x64Win64VS2017.bat"

Notez que ce chemin peut-être différent suivant l'endroit que vous avez sélectionné pour installer RTI Connext DDS, et la version de Visual Studio que vous avez sélectionné.

Le chemin précédent est chemin par défaut pour la version 6.0.1, mais changera en fonction des versions futures.

Si vous souhaitez installer les plugins Connext DDS-Security les instructions sont disponibles sur :doc:`cette page <DDS-Implementations/Install-Connext-Security-Plugins>`.

Installation sous Windows avec les paquets binaires
---------------------------------------------------


RTI Connext
^^^^^^^^^^^

Pour utiliser RTI Connext DDS les options disponibles sont :doc:`université, achat ou évaluation <DDS-Implementations/Install-Connext-University-Eval>`

Après l'installation il faut exécuter le lanceur RTI, et désigner l'endroit où se trouve le fichier de licence sur le disque.

Ensuite, avant de construire ROS 2, il faut configurer l'environnement Connext:

.. code-block:: bash

   call "C:\Program Files\rti_connext_dds-6.0.1\resource\scripts\rtisetenv_x64Win64VS2017.bat"

Si vous souhaitez installer les plugins Connext DDS-Security plugins il est possible de consulter :doc:`cette page <DDS-Implementations/Install-Connext-Security-Plugins>`.
