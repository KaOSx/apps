/***************************************************************************
 *
 *   Copyright (C) 2011 The Chakra Project
 *
 *   GPL3
 *
 ***************************************************************************/

#ifndef CONFIG_H
#define CONFIG_H

/* Defines the installation paths */
#define IMAGE_INSTALL_PATH "${CMAKE_INSTALL_PREFIX}/share/tribe/images"
#define SCRIPTS_INSTALL_PATH "${CMAKE_INSTALL_PREFIX}/share/tribe/scripts"
#define CONFIG_INSTALL_PATH "${CMAKE_INSTALL_PREFIX}/share/tribe/config"
#define STYLESHEET_INSTALL_PATH "${CMAKE_INSTALL_PREFIX}/share/tribe/style/tribe.qss"
#define TRIBE_INSTALL_PATH "${CMAKE_INSTALL_PREFIX}"
#define DATA_INSTALL_DIR "${DATA_INSTALL_DIR}"

/* Defines Tribe Build Revision (will appear on UI) */
#define TRIBE_BUILD_REVISION "source build/from git"

/* Defines Target Mount Point */
#define INSTALLATION_TARGET "/mnt/install.root"

/* Defines Boot Mount Point */
#define BOOTMNT_POINT "/bootmnt/chakra/@ARCH@"

/* Defines the version */
#define TRIBE_VERSION "source build/from git"

#endif /*CONFIG_H*/
