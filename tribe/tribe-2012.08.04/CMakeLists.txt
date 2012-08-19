project(tribe)

cmake_minimum_required(VERSION 2.6.0)
set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake/modules)

find_package(KDE4 REQUIRED)

configure_file(config-tribe.h.cmake ${CMAKE_CURRENT_BINARY_DIR}/config-tribe.h)

include (MacroLibrary)
include (FindPackageHandleStandardArgs)
include (KDE4Defaults)

find_package(MarbleWidget REQUIRED)
find_package(TribePartitionManager REQUIRED)
find_package(MSGFMT REQUIRED)

add_subdirectory(icons)
add_subdirectory(translations)

add_definitions (
    ${QT_DEFINITIONS}
    ${KDE4_DEFINITIONS}
)

include_directories (
    ${CMAKE_SOURCE_DIR}
    ${CMAKE_SOURCE_DIR}/src
    ${CMAKE_BINARY_DIR}
    ${KDE4_INCLUDES}
    ${LIBMARBLEWIDGET_INCLUDE_DIR}
    ${TRIBEPARTITIONMANAGER_INCLUDE_DIR}
)

SET(tribe_SRCS
    src/main.cpp
    src/mainwindow.cpp
    src/installationhandler.cpp
    src/abstractpage.cpp
    src/pmhandler.cpp
)

SET(tribe_WIDGETS
    src/widgets/progresswidget.cpp
    src/widgets/userwidget.cpp
    src/widgets/avatardialog.cpp
)

SET(tribe_PAGES
    src/pages/intropage.cpp
    src/pages/releasenotespage.cpp
    src/pages/partitionpage.cpp
    src/pages/usercreationpage.cpp
    src/pages/installationpage.cpp
    src/pages/readyinstallpage.cpp
    src/pages/bootloaderpage.cpp
    src/pages/finishpage.cpp
    src/pages/licensepage.cpp
    src/pages/configpage.cpp
    src/pages/localepage.cpp
)

SET(tribe_PAGE_UIS
    ui/pages/base.ui
    ui/pages/intro.ui
    ui/pages/releasenotes.ui
    ui/pages/license.ui
    ui/pages/locale.ui
    ui/pages/config.ui
    ui/pages/partition.ui
    ui/pages/usercreation.ui
    ui/pages/installation.ui
    ui/pages/readyinstall.ui
    ui/pages/bootloader.ui
    ui/pages/finish.ui
)

set(tribe_WIDGET_UIS
    ui/widgets/progresswidget.ui
    ui/widgets/userwidget.ui
    ui/widgets/avatardialog.ui
)

SET(tribe_IMAGES
    ui/images/background.svg
    ui/images/sidebar.svg
)

SET(tribe_STYLESHEET
    ui/tribe.qss
)

qt4_add_resources(tribe_RESOUCES ui/tribe.qrc)

kde4_add_ui_files(tribe_SRCS ${tribe_PAGE_UIS} ${tribe_WIDGET_UIS})

kde4_add_executable(tribe
    ${tribe_SRCS}
    ${tribe_PAGES}
    ${tribe_WIDGETS}
    ${tribe_RESOUCES}
)

target_link_libraries(tribe
                      ${KDE4_KDEUI_LIBRARY}
                      ${KDE4_KDECORE_LIBRARY}
                      ${KDE4_KUTILS_LIBRARY}
                      ${KDE4_KIO_LIBRARY}
                      ${LIBMARBLEWIDGET_LIBRARY}
                      ${TRIBEPARTITIONMANAGER_LIBRARY}
)

file(GLOB POSTINSTALL_FUNCTIONS
    scripts/postinstall-functions/* )

file(GLOB tribe_SCRIPTS
    scripts/*.sh )

file(GLOB tribe_AVATARS
    ui/images/avatars/*.png )

file(GLOB appIcons
    data/appIcons/*.png )

install(TARGETS tribe DESTINATION ${CMAKE_INSTALL_PREFIX}/bin)

install(FILES ${tribe_SCRIPTS} 
        DESTINATION ${CMAKE_INSTALL_PREFIX}/share/tribe/scripts 
        PERMISSIONS GROUP_READ
                    OWNER_READ
                    WORLD_READ
                    GROUP_EXECUTE
                    OWNER_EXECUTE
                    WORLD_EXECUTE)

install(FILES ${tribe_AVATARS} 
        DESTINATION ${CMAKE_INSTALL_PREFIX}/share/tribe/avatars)

install(FILES ${POSTINSTALL_FUNCTIONS} DESTINATION ${CMAKE_INSTALL_PREFIX}/share/tribe/scripts)
install(FILES data/postinstall.conf DESTINATION ${CMAKE_INSTALL_PREFIX}/share/tribe/config)

install(FILES RELEASE_NOTES.html DESTINATION ${CMAKE_INSTALL_PREFIX}/share/tribe/config)
install(FILES tribe.desktop DESTINATION ${CMAKE_INSTALL_PREFIX}/share/applications)

install(FILES ${tribe_STYLESHEET} DESTINATION ${CMAKE_INSTALL_PREFIX}/share/tribe/style)
install(FILES data/cities.kml DESTINATION ${DATA_INSTALL_DIR}/marble/data/placemarks)
install(FILES data/timezones DESTINATION ${CMAKE_INSTALL_PREFIX}/share/tribe/config)

install(FILES data/all_locales DESTINATION ${CMAKE_INSTALL_PREFIX}/share/tribe/config)
install(FILES data/all_kde_langpacks DESTINATION ${CMAKE_INSTALL_PREFIX}/share/tribe/config)
install(FILES ${appIcons} DESTINATION ${CMAKE_INSTALL_PREFIX}/share/tribe/config)
install(FILES data/configPagePkgData DESTINATION ${CMAKE_INSTALL_PREFIX}/share/tribe/config)
install(FILES data/configPageBundleData DESTINATION ${CMAKE_INSTALL_PREFIX}/share/tribe/config)
