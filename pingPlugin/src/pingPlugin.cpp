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
#include <ctime>

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

    printf("Hello to native PingPlugin\n");
    char c[255];
    strcpy(c, "ping -c 1 ");
    strcat(c, address);
    int x;

    // start time≈
    std::clock_t start = std::clock();
    
    // PING
    x = system(c);

    // stop timer

    // compute and print the elapsed time in seconds
    res->time = ( std::clock() - start ) / CLOCKS_PER_SEC;

    
    res->isDone = !x;
    if(x == 0)
            printf("\nNative:Success\t isDone(%s) ip(%s) time(%d/s)", res->isDone == 0 ? "false" : "true", address, res->time);
        else
            printf("\nNative:Failed");
    return res;
    }

