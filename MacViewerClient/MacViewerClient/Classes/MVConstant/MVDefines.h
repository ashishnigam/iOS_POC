//
//  MVDefines.h
//  MacViewerClient

#ifndef MacViewerClient_MVDefines_h
#define MacViewerClient_MVDefines_h

#pragma MARK -
#pragma MARK SCREEN CORDINATE METHOD

#define SCREEN_ORIGIN_X             0
#define SCREEN_ORIGIN_Y             0
#define SERVICE_RESOLVE_TIMEOUT     0.0   //Specify 0.0 for indefinite
#define DEFAULT_PORT                2515
#define MAX_PORT_VALUE              65536

#pragma MACRO FUNCTION  VIEW COARDINATE SYSTEM

#define         _viewBound()                self.view.bounds

#pragma MACRO FUNCTION MEMORY MANAGMENT

#define     _ReleaseObject(object)          { [object release]; object = nil; }
#define     _ReleaseObjectWithCheck(object) if(object)  { _ReleaseObject (object) } 

#endif
