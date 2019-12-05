/******************************************************************************
 
pingPlugin_lib.h -
                                                                             
*****************************************************************************/

#ifndef _PINGPLUGIN_LIB_H_
#define _PINGPLUGIN_LIB_H_ 1

#ifdef __cplusplus
#define PING_API __declspec(dllexport)
#include "pingPlugin.h"
extern "C" {
#endif /* __cplusplus */

#define PINGPLUGINLIB_MAJOR 1
#define PINGPLUGINLIB_MINOR 0
#define PINGPLUGINLIB_RELEASE 0

#define PINGPLUGIN_ERROR   0
#define PINGPLUGIN_OK      1

  extern PingResult* Ping_Native(const char address[])
  {
      return (Ping(address));
  }

#ifdef __cplusplus
}
#endif /* __cplusplus */
#endif /* _PINGPLUGIN_LIB_H */

/* end */
