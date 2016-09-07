CDPATH=
# requires find, sed, revpath, egrep, grep, fgrep, cat, rm, basename

if ! which revpath >/dev/null 2>/dev/null; then
    echo "!!! Cannot find revpath: this script may fail" >&2
    echo "!!! Try installing the imake package" >&2
fi

add_cmake_files_manpage() {
    local dir_local=$1;
    for manfile in `find $dir_local/ -name man-*.docbook`; do
        subdir=$(dirname $manfile)
        fname=$(basename $manfile)
        name=${fname%.docbook}
        no=${name##*.}
        echo "kdoctools_create_manpage($fname $no INSTALL_DESTINATION \${MAN_INSTALL_DIR}/\${CURRENT_LANG}/ )" >> $subdir/CMakeLists.txt
    done
}

add_cmake_files_doc() {
    local dir_local=$1
    local list_dir
    # This is just not to make a find * in a dir that has no items and so we avoid getting a find warning
    count=`cd $dir_local && find . -mindepth 1 -maxdepth 1 -regex '.*' | egrep -v "\.svn" | wc -l`
    if [ $count -eq 0 ]; then
        return
    fi
    list_dir=`cd $dir_local && find * -maxdepth 0 -type d -not -empty | grep -v "\.svn"`
    # remove old CMakeLists.txt
    rm -f $dir_local/CMakeLists.txt

    # Better empty than non-existent CMakeLists.txt, so that cmake does not complain
    touch $dir_local/CMakeLists.txt

    for subdir in $list_dir; do
        echo "add_subdirectory( $subdir )" >> $dir_local/CMakeLists.txt
        if test -f $dir_local/index.docbook; then
            if ! grep -q "kdoctools_create_handbook" $dir_local/CMakeLists.txt; then
                echo "kdoctools_create_handbook(index.docbook INSTALL_DESTINATION \${HTML_INSTALL_DIR}/\${CURRENT_LANG}/ SUBDIR $subdir )" >> $dir_local/CMakeLists.txt
            fi
        fi
        add_cmake_files_doc $dir_local/$subdir
        case $subdir in
           common)
               echo "FILE(GLOB _html *.html)" >> $dir_local/$subdir/CMakeLists.txt
               echo "FILE(GLOB _css *.css)" >> $dir_local/$subdir/CMakeLists.txt
               echo "FILE(GLOB _pngs *.png)" >> $dir_local/$subdir/CMakeLists.txt
               echo "install( FILES \${_html} \${_css} \${_png} DESTINATION \${HTML_INSTALL_DIR}/\${CURRENT_LANG}/common)" >> $dir_local/$subdir/CMakeLists.txt
               #howto install the missing symlinks e.g. ${HTML_INSTALL_DIR}/en/common/1.png  ${HTML_INSTALL_DIR}/\${CURRENT_LANG}/common/1.png ?
               ;;
           *)
               if test -f $dir_local/$subdir/index.docbook; then
                   # test if it's a kcontrol module.
                   local kcontrol_found=`echo $dir_local/$subdir | grep kcontrol`
                   local add_subdir=
                   if [ ! -z $kcontrol_found ]; then
                       add_subdir="SUBDIR kcontrol/$subdir"
                   fi
                   local kioslave_found=`echo $dir_local/$subdir | grep kioslave`
                   if [ ! -z $kioslave_found ]; then
                       add_subdir="SUBDIR kioslave5/$subdir"
                   fi
                   # test if it's a khelpcenter module (glossary)
                   local glossary_found=`echo $dir_local/$subdir | grep glossary`
                   if [ ! -z $glossary_found ]; then
                       add_subdir="SUBDIR khelpcenter/$subdir"
                   fi
                   local documentationnotfound_found=`echo $dir_local/$subdir | grep documentationnotfound`
                   if [ ! -z $documentationnotfound_found ]; then
                       add_subdir="SUBDIR kioslave5/help/$subdir"
                   fi

                   if [ -z "$add_subdir" ]; then
                       add_subdir="SUBDIR $subdir"
                   fi

                   echo "kdoctools_create_handbook(index.docbook INSTALL_DESTINATION \${HTML_INSTALL_DIR}/\${CURRENT_LANG}/ $add_subdir )" >> $dir_local/$subdir/CMakeLists.txt
               fi
               ;;
        esac
    done
}

subdirs="$@"
if test -z "$subdirs"; then
    if test -f inst-apps; then
        subdirs=`cat inst-apps`
    else
        subdirs=`cat subdirs`
    fi
fi

for dir in $subdirs; do 
    echo "processing $dir"
    # Top-level language project setup.
    : > $dir/CMakeLists.txt
    if test ! -f CMakeLists.txt; then # not in sub-language dir
        cat > $dir/CMakeLists.txt <<EOF
project(kde-i18n-$dir)
cmake_minimum_required(VERSION 2.8.12)

find_package(Gettext REQUIRED)
find_package(ECM 0.0.12 REQUIRED)
set(CMAKE_MODULE_PATH \${ECM_MODULE_PATH} \${ECM_KDE_MODULE_DIR})

include(KDEInstallDirs)

find_package(KF5DocTools REQUIRED)
find_package(KF5I18n REQUIRED)

if (NOT GETTEXT_MSGMERGE_EXECUTABLE)
   MESSAGE(FATAL_ERROR "Please install the msgmerge binary")
endif (NOT GETTEXT_MSGMERGE_EXECUTABLE)

IF(NOT GETTEXT_MSGFMT_EXECUTABLE)
   MESSAGE(FATAL_ERROR "Please install the msgfmt binary")
endif (NOT GETTEXT_MSGFMT_EXECUTABLE)

EOF
    fi
    echo "set(CURRENT_LANG $dir)" >> $dir/CMakeLists.txt
    echo "" >> $dir/CMakeLists.txt

    # UI message catalogs.
    if test -d $dir/messages; then
        echo "add_subdirectory(messages)" >> $dir/CMakeLists.txt

        : > $dir/messages/CMakeLists.txt
        #dirs=`cd $dir/messages && find * -maxdepth 1 -type d -not -empty | fgrep -v others | fgrep -v www.kde.org | fgrep -v "\.svn" | grep -v ^www$ | grep -v koffice`
        dirs=calligra
        for dir2 in $dirs; do
            cat > $dir/messages/$dir2/CMakeLists.txt <<'EOF'
include(ECMPoQmTools)

# Determine if a .po file must be compiled into a .mo or a .qm file
file(GLOB po_files *.po)
set(mo_po_files)
set(qm_po_files)
foreach(po_file ${po_files})
    string(REGEX MATCH "_qt\\.po$" match "${po_file}")
    if(match)
        set(qm_po_files ${qm_po_files} ${po_file})
    else()
        set(mo_po_files ${mo_po_files} ${po_file})
    endif()
endforeach()

if(qm_po_files)
    ecm_process_po_files_as_qm(${CURRENT_LANG} ALL
        INSTALL_DESTINATION ${LOCALE_INSTALL_DIR}
        PO_FILES ${qm_po_files}
    )
endif()

if (mo_po_files)
    gettext_process_po_files(${CURRENT_LANG} ALL
        INSTALL_DESTINATION ${LOCALE_INSTALL_DIR}
        PO_FILES ${mo_po_files}
    )
endif()
EOF
            echo "add_subdirectory($dir2)" >> $dir/messages/CMakeLists.txt
        done
        files=`cd $dir/messages && find -L . -maxdepth 1 -type f | egrep -v "CMakeLists.txt|no-auto-merge" | sed -e "s,^./,,"`
        for file in $files; do
            echo "install(FILES $file DESTINATION \${LOCALE_INSTALL_DIR}/\${CURRENT_LANG}/ )" >> $dir/messages/CMakeLists.txt
        done
    fi

    # Documentation.
    #dirs=
    #if test -d $dir/docs; then
        #echo "add_subdirectory(docs)" >> $dir/CMakeLists.txt;
        #add_cmake_files_doc  $dir/docs; 
        #add_cmake_files_manpage $dir/docs;
    #fi

    # Custom localized application data.
    #if test -d $dir/data; then
    #    # remove old CMakeLists.txt
    #    rm -f $dir/data/CMakeLists.txt;
        #echo "add_subdirectory(data)" >> $dir/CMakeLists.txt
    #    dirs=`cd $dir/data && find * -maxdepth 0 -type d -not -empty | fgrep -v .svn`
    #    for dir2 in $dirs; do
    #        echo "add_subdirectory($dir2)" >> $dir/data/CMakeLists.txt
    #        rm -f $dir/data/$dir2/CMakeLists.txt;
    #        subdirs=`cd $dir/data/$dir2 && find * -maxdepth 0 -type d -not -empty | fgrep -v .svn`
    #        for subdir2 in $subdirs; do
                #echo "add_subdirectory($subdir2)" >> $dir/data/$dir2/CMakeLists.txt
    #        done
    #    done
    #fi

    # Transcript files.
    #if test -d $dir/scripts; then
    #    echo "add_subdirectory(scripts)" >> $dir/CMakeLists.txt
    #    dirs2=`cd $dir/scripts && find * -maxdepth 0 -type d -not -empty | fgrep -v .svn | fgrep -v internal`
    #    : > $dir/scripts/CMakeLists.txt
    #    cmakeincfile=CMakeInclude.cmake
    #    if test -f $dir/scripts/$cmakeincfile; then
    #        echo "include($cmakeincfile)" >> $dir/scripts/CMakeLists.txt
    #    fi
    #    for dir2 in $dirs2; do
    #        echo "add_subdirectory($dir2)" >> $dir/scripts/CMakeLists.txt
    #        tsdirs=`cd $dir/scripts/$dir2 && find * -maxdepth 0 -type d -not -empty | fgrep -v .svn | fgrep -v internal`
    #        : > $dir/scripts/$dir2/CMakeLists.txt
    #        for tsdir in $tsdirs; do
    #            echo "ki18n_install_ts_files(\${CURRENT_LANG} $tsdir)" >> $dir/scripts/$dir2/CMakeLists.txt
    #        done
    #    done
    #fi

    # Add subdirs of sub-languages.
    sublangs=`find $dir -maxdepth 1 -type d -iname "$dir[_@]*" -not -empty`
    for subl in $sublangs; do
        sublc=`basename $subl`
        echo "add_subdirectory($sublc)" >> $dir/CMakeLists.txt
    done
    # Recurse for sub-languages.
    agcmd=`echo $0`
    if [ `echo $0 | cut -b 1` != '/' ]; then
        revp=`revpath $dir`
        agcmd=`echo $0 | sed "s:^\([^/]\):$revp\0:"` # change autogen.sh path if relative
    fi
    cd $dir
    for subl in $sublangs; do
        $agcmd `basename $subl`
    done
    cd ..
done
