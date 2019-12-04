//
//  pingPlugin.cpp
//  pingAPIapp
//
//  Created by Kalokhe, Ashwini on 12/3/19.
//  Copyright © 2019 Kalokhe, Ashwini. All rights reserved.
//

#include <stdlib.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "pingPlugin_lib.h"

/******************************************************************************
 Main sequence
******************************************************************************/
int main(int argc, char **argv)
{
   return 0;
}

void ping()
    {
    printf("Hello to native PingPlugin\n");
    int x;
    x = system("ping -c 1 ifconfig.me");
    if(x == 0)
            printf("Success\n");
        else
            printf("Failed\n");
            
    }

