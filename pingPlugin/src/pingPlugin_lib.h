/******************************************************************************
 
pingPlugin_lib.h -
                                                                             
*****************************************************************************/

#ifndef _PINGPLUGIN_LIB_H_
#define _PINGPLUGIN_LIB_H_ 1

#ifdef __cplusplus
#define PING_API __declspec(dllexport)

extern "C" {
#endif /* __cplusplus */

#define PINGLIB_MAJOR 1
#define PINGLIB_MINOR 0
#define PINGLIB_RELEASE 0

#define PING_ERROR   0
#define PING_OK      1

#include <stddef.h>
#include <stdbool.h>

extern void ping();

#ifdef __cplusplus
}
#endif /* __cplusplus */
#endif /* _PINGPLUGIN_LIB_H */

/* end */
