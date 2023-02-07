Installation des prérequis
--------------------------

Installer Chocolatey
^^^^^^^^^^^^^^^^^^^^

Chocolatey est un gestionnaire de paquets pour Windows, installez-le en suivant les instructions d'installation:

https://chocolatey.org/

Chocolatey sera utilisé pour installer d'autres outils de développement.

Installer Python
^^^^^^^^^^^^^^^^

Ouvrez une invite de commande et tapez ce qui suit pour installer Python via Chocolatey:

.. code-block:: bash

   choco install -y python --version 3.8.3

Installer Visual C++ Redistributable
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Ouvrez une invite de commande et tapez ce qui suit pour les installer via Chocolatey:

.. code-block:: bash

   choco install -y vcredist2013 vcredist140

Installer OpenSSL
^^^^^^^^^^^^^^^^^

Téléchargez le programme d'installation OpenSSL *Win64 OpenSSL v1.1.1n* à partir de `cette page <https://slproweb.com/products/Win32OpenSSL.html>`__.
Faites défiler vers le bas de la page et téléchargez *Win64 OpenSSL v1.1.1n*.
Ne téléchargez pas les versions Win32 ou Light, ni les programmes d'installation v3.X.Y.

Exécutez le programme d'installation avec les paramètres par défaut, car les commandes suivantes supposent que vous avez utilisé le répertoire d'installation par défaut.

Cette commande définit une variable d'environnement qui persiste au fil des sessions:

.. code-block:: bash

   setx /m OPENSSL_CONF "C:\Program Files\OpenSSL-Win64\bin\openssl.cfg"

Vous devrez ajouter le dossier bin OpenSSL-Win64 à votre PATH.
Vous pouvez le faire en cliquant sur l'icône Windows, en tapant "Variables d'environnement",
puis en cliquant sur "Modifier les variables d'environnement système".
Dans la boîte de dialogue résultante, cliquez sur "Variables d'environnement",
puis cliquez sur "Chemin" dans le volet inférieur, enfin cliquez sur "Modifier" et ajoutez le chemin ci-dessous.

* ``C:\Program Files\OpenSSL-Win64\bin\``

Installer Visual Studio
^^^^^^^^^^^^^^^^^^^^^^^

Installez Visual Studio 2019.

Si vous disposez déjà d'une version payante de Visual Studio 2019 (Professional, Enterprise),
vous pouvez ignorer cette étape.

Microsoft fournit une version gratuite de Visual Studio 2019, nommée Community, qui peut être utilisée pour créer des applications utilisant ROS 2.
`Vous pouvez télécharger le programme d'installation directement via ce lien. <https://visualstudio.microsoft.com/thank-you-downloading-visual-studio/?sku=Community&rel=16&src=myvs&utm_medium=microsoft&utm_source=my.visualstudio.com&utm_campaign=download&utm_content=vs+community+2019>`_

Assurez-vous que les fonctionnalités Visual C++ sont installées.

Un moyen simple de s'assurer qu'ils sont installés est de sélectionner le flux de travail ``Développement de bureau avec C++`` lors de l'installation.

   .. image:: /Installation/images/windows-vs-studio-install.png

Assurez-vous qu'aucun outil C++ CMake n'est installé en les désélectionnant dans la liste des composants à installer.


Installer OpenCV
^^^^^^^^^^^^^^^^

Certains exemples nécessitent l'installation d'OpenCV.

Vous pouvez télécharger une version précompilée d'OpenCV 3.4.6 à partir de https://github.com/ros2/ros2/releases/download/opencv-archives/opencv-3.4.6-vc16.VS2019.zip .

En supposant que vous l'avez décompressé dans ``C:\opencv``, tapez ce qui suit sur une invite de commande (nécessite des privilèges d'administrateur):

.. code-block:: bash

   setx /m OpenCV_DIR C:\opencv

Puisque c'est une version ROS précompilée, il faut indiquer où trouver les bibliothèques OpenCV.
Il faut étendre la variable ``PATH`` à ``C:\opencv\x64\vc16\bin``.

Installer les dépendances
^^^^^^^^^^^^^^^^^^^^^^^^^

Il existe quelques dépendances non disponibles dans la base de données du paquet Chocolatey. Afin de faciliter le processus d'installation manuelle, nous fournissons les paquets Chocolatey nécessaires.

Comme certains paquets chocolatés en dépendent, nous commençons par installer CMake

.. code-block:: bash

   choco install -y cmake

Vous devrez ajouter le dossier CMake bin ``C:\Program Files\CMake\bin`` à votre PATH.

Veuillez télécharger ces paquets depuis `ce dépôt <https://github.com/ros2/choco-packages/releases/latest>`__  GitHub.

* asio.1.12.1.nupkg
* bullet.3.17.nupkg
* cunit.2.1.3.nupkg
* eigen-3.3.4.nupkg
* tinyxml-usestl.2.6.2.nupkg
* tinyxml2.6.0.0.nupkg

Une fois ces paquets téléchargés, ouvrez un shell d'administration et exécutez la commande suivante:

.. code-block:: bash

   choco install -y -s <PATH\TO\DOWNLOADS\> asio cunit eigen tinyxml-usestl tinyxml2 bullet

Veuillez remplacer ``<PATH\TO\DOWNLOADS>`` par le dossier dans lequel vous avez téléchargé les paquets.

Mise à niveau de pip et setuptools:

.. code-block:: bash

   python -m pip install -U pip setuptools==59.6.0

Installez maintenant quelques dépendances Python supplémentaires:

.. code-block:: bash

   python -m pip install -U catkin_pkg cryptography empy importlib-metadata lark==1.1.1 lxml matplotlib netifaces numpy opencv-python PyQt5 pillow psutil pycairo pydot pyparsing==2.4.7 pyyaml rosdistro

Installer Qt5
^^^^^^^^^^^^^

Téléchargez le `5.12.X offline installer <https://www.qt.io/offline-installers>`_ depuis le site Web de Qt.
Exécutez le programme d'installation. Assurez-vous de sélectionner le composant ``MSVC 2017 64-bit`` sous l'arborescence ``Qt`` -> ``Qt 5.12.12``.

Enfin, dans une fenêtre administrateur ``cmd.exe``, définissez ces variables d'environnement. Les commandes ci-dessous supposent que vous l'avez installé à l'emplacement par défaut de ``C:\Qt``.

.. code-block:: bash

   setx /m Qt5_DIR C:\Qt\Qt5.12.12\5.12.12\msvc2017_64
   setx /m QT_QPA_PLATFORM_PLUGIN_PATH C:\Qt\Qt5.12.12\5.12.12\msvc2017_64\plugins\platforms


.. note::

   Ce chemin peut changer en fonction de la version de MSVC installée, du répertoire dans lequel Qt a été installé et de la version de Qt installée.


Dépendances RQt
^^^^^^^^^^^^^^^

Pour exécuter rqt_graph, vous devez `télécharger <https://graphviz.gitlab.io/_pages/Download/Download_windows.html>`__ et installer `Graphviz <https://graphviz.gitlab.io/>`__.
Le programme d'installation vous demandera si vous souhaitez ajouter graphviz à PATH, choisissez de l'ajouter à l'utilisateur actuel ou à tous les utilisateurs.


Installer des implémentations DDS supplémentaires (facultatif)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Si vous souhaitez utiliser un autre fournisseur DDS ou RTPS en plus du Fast DDS par défaut, vous pouvez trouver des instructions `ici </Installation/DDS-Implementations>`_.
