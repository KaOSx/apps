#!/bin/sh -f

export CASROOT=/usr

export CSF_LANGUAGE=us
export MMGT_CLEAR=1
export CSF_EXCEPTION_PROMPT=1

export CSF_SHMessage="$CASROOT"/share/opencascade/resources/SHMessage
export CSF_MIGRATION_TYPES="$CASROOT"/share/opencascade/resources/StdResource/MigrationSheet.txt
export CSF_MDTVTexturesDirectory="$CASROOT"/share/opencascade/resources/Textures
export CSF_XSMessage="$CASROOT"/share/opencascade/resources/XSMessage
export CSF_StandardDefaults="$CASROOT"/share/opencascade/resources/StdResource
export CSF_PluginDefaults="$CASROOT"/share/opencascade/resources/StdResource
export CSF_XCAFDefaults="$CASROOT"/share/opencascade/resources/StdResource
export CSF_StandardLiteDefaults="$CASROOT"/share/opencascade/resources/StdResource
export CSF_UnitsLexicon="$CASROOT"/share/opencascade/resources/UnitsAPI/Lexi_Expr.dat
export CSF_UnitsDefinition="$CASROOT"/share/opencascade/resources/UnitsAPI/Units.dat
export CSF_IGESDefaults="$CASROOT"/share/opencascade/resources/XSTEPResource
export CSF_STEPDefaults="$CASROOT"/share/opencascade/resources/XSTEPResource
export CSF_XmlOcafResource="$CASROOT"/share/opencascade/resources/XmlOcafResource
export CSF_GraphicShr="$CASROOT"/lib/opencascade/libTKOpenGl.so
