//
//  pingPlugin.cpp
//  pingAPIapp
//
//  Created by Kalokhe, Ashwini on 12/3/19.
//  Copyright © 2019 Kalokhe, Ashwini. All rights reserved.
//

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "pingPlugin.h"
#include "pingPlugin_lib.h"
#include <sys/time.h> 

/******************************************************************************
 Main sequence
******************************************************************************/
int main(int argc, char **argv)
{
   return 0;
}

PingResult* Ping(const char address[])
    {
    PingResult* res = (PingResult*)malloc(sizeof(PingResult));
    res->isDone = false;
    struct timeval t1, t2;
    
    printf("Hello to native PingPlugin\n");
    char c[255];
    strcpy(c, "ping -c 1 ");
    strcat(c, address);
    int x;

    // start time
    gettimeofday(&t1, NULL);
    
    // PING
    x = system(c);

    // stop timer
    gettimeofday(&t2, NULL);

    // compute and print the elapsed time in millisec
    res->time = (t2.tv_sec - t1.tv_sec) * 1000.0;      // sec to ms
    res->time += (t2.tv_usec - t1.tv_usec) / 1000.0; 
    
    res->isDone = !x;
    if(x == 0)
            printf("\nNative:Success\t isDone(%s) ip(%s) time(%d-ms)", res->isDone == 0 ? "false" : "true", address, res->time);
        else
            printf("\nNative:Failed");
    return res;
    }

